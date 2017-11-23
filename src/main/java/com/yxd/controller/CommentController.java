package com.yxd.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.yxd.entity.Comment;
import com.yxd.entity.User;
import com.yxd.service.CommentService;
import com.yxd.util.HtmlIOUtil;
import com.yxd.view.CommentView;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Resource
	private CommentService commentService;
	/**
	 * 点击查看更多加载数据
	 * */
	@ResponseBody
	@RequestMapping("queryMore.do")
	public String queryMore(HttpServletRequest request, @RequestParam("fid")int fid,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="2")int pageSize) {
		
		PageHelper.startPage(pageNum,pageSize);
		List<CommentView> commentViewList = commentService.queryComment(fid);
		if(commentViewList != null) {
			//获取帖子对应的评论和回复
			for(CommentView commentView:commentViewList) {
				String cpath = commentView.getComment().getCcontent();
				commentView.getComment().setCcontent(HtmlIOUtil.read(cpath));
			}
		}
		Gson gson = new Gson();
		String data = gson.toJson(commentViewList);
		return data;
	}
	/**
	 * 发表评论 
	 * */
	@ResponseBody
	@RequestMapping("/edit.do")
	public String edit(HttpServletRequest request, @RequestParam("fid")int fid,@RequestParam("ccontent")String ccontent) {
		Comment comment = new Comment();
		comment.setFid(fid);
		comment.setCread("no");
		comment.setUid(((User)request.getSession().getAttribute("user")).getUid());
		//创建日期
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String cdate = sdf.format(new Date());
		comment.setCdate(cdate);
		//按当天日趋创建文件夹
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		String ymd = sd.format(new Date());
		String path = request.getSession().getServletContext().getRealPath("/") + "comment/article/"+ymd+"/";
		//上传的所有图片路径
		String cimage = null;
		if(request.getSession().getAttribute("cimage") != null)
			 cimage = request.getSession().getAttribute("cimage").toString();
		comment.setCimage(cimage);
		
		//按时间戳命名文件
		String name = System.currentTimeMillis()+".html";
		String info = HtmlIOUtil.write(ccontent, path, name);
		
		comment.setCcontent(path+name);
		int result = commentService.edit(comment);
		if(result != 0 && "上传成功".equals(info)){
			request.getSession().setAttribute("cimage", null);
			return "1";}
		return "0";
	}
	/**
	 * 图片上传
	 * */
	@ResponseBody
	@RequestMapping("/upload.do")
	public void upload(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		//文件保存目录路径
		String savePath = request.getSession().getServletContext().getRealPath("/") + "/comment/";

		//文件保存目录URL
		String saveUrl  = request.getContextPath() + "/comment/";

		//定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp,svg");
		//最大文件大小
		long maxSize = 1000000;
		
		//设置返回编码
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		//判断是否有文件上传
		if(!ServletFileUpload.isMultipartContent(request)){
			out.println(getError("请选择文件。"));
			return;
		}
		
		//创建目录
		File uploadDir = new File(savePath);
		if(!uploadDir.exists()){
			uploadDir.mkdirs();
		}
		
		//默认上传的文件夹目录为image
		String dirName = request.getParameter("dir");
		if (dirName == null) {
			dirName = "image";
		}
		//创建文件夹
		savePath += dirName + "/";
		saveUrl += dirName + "/";
		File saveDirFile = new File(savePath);
		if (!saveDirFile.exists()) {
			saveDirFile.mkdirs();
		}
		//按当天日趋创建文件夹
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		saveUrl += ymd + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		
		//上传文件
		 MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
		 Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
			MultipartFile item = entity.getValue();
			String fileName = item.getOriginalFilename();
				//检查文件大小
				if(item.getSize() > maxSize){
					out.println(getError("上传文件大小超过限制。"));
					return;
				}
				//检查扩展名
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
					out.println(getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。"));
					return;
				}

				String newFileName = System.currentTimeMillis() + "." + fileExt;
				try{
					File uploadedFile = new File(savePath, newFileName);
					item.transferTo(uploadedFile);
					if(request.getSession().getAttribute("cimage") != null) {
						@SuppressWarnings("unchecked")
						List<String> list = (List<String>)request.getSession().getAttribute("cimage"); 
						list.add(ymd+"/"+newFileName);
						request.getSession().setAttribute("cimage", list);
					}else {
						List<String> list = new ArrayList<>();
						list.add(ymd+"/"+newFileName);
						request.getSession().setAttribute("cimage", list);
					}
				}catch(Exception e){
					out.println(getError("上传文件失败。"));
					return;
				}

				JsonObject obj = new JsonObject();
				obj.addProperty("error", 0);
				obj.addProperty("url", saveUrl + newFileName);
				out.println(obj.toString());
			}
	}
	
	private String getError(String message) {
		JsonObject obj = new JsonObject();
		obj.addProperty("error", 1);
		obj.addProperty("message", message);
		return obj.toString();
	}
}

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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.yxd.entity.Comment;
import com.yxd.entity.Forum;
import com.yxd.entity.User;
import com.yxd.service.ForumService;
import com.yxd.util.HtmlIOUtil;
import com.yxd.view.CommentView;
import com.yxd.view.ForumView;

@Controller
@RequestMapping("/forum")
public class ForumController {
	@Resource
	private ForumService forumService;
	/**
	 * 论坛首页
	 * */
	@RequestMapping("/queryList.do")
	public String index(HttpServletRequest request,@RequestParam(value="ftype",required=false,defaultValue="学习技术类")String ftype,
			@RequestParam(value="serach",required=false)String serach,
		    @RequestParam(value="condition",required=false)String condition) {
		//论坛列表
		PageHelper.startPage(1,10);
		List<ForumView> lists = null;
		if("按关键字查找".equals(condition))
			 lists = forumService.queryKey(ftype,serach);
		else
			lists = forumService.queryList(ftype,serach);
		for(ForumView list:lists) {
			//获取文本
			String path = list.getfList().getFcontent();
			String fcontent = HtmlIOUtil.read(path);
			
			//去掉html格式,并截取前200个字
			String reg_html="<[^>]+>";
			if(fcontent.replaceAll(reg_html, "").length()>200)
				list.getfList().setFcontent(fcontent.replaceAll(reg_html, "").substring(0,200)+"...");
			else
				list.getfList().setFcontent(fcontent.replaceAll(reg_html, ""));
			
			//获取文本中的第一张图片<img />
			Pattern pattern = Pattern.compile("<img.*src\\s*=\\s*(.*?)[^>]*?>");
			Matcher matcher = pattern.matcher(fcontent);
			if(matcher.find()) {
				//获取<img />的src的值
				String img = matcher.group();
				Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
				if(m.find())
					list.getfList().setFimage(m.group());
			}
			//日期截取
			list.getfList().setFdate(list.getfList().getFdate().substring(0,10));
		}
		//论坛热搜
		PageHelper.startPage(1,5);
		List<ForumView> hots = forumService.queryHot();
		for(ForumView hot:hots) {
			if(hot.getuList().getUmotto().length()>15)
				hot.getuList().setUmotto(hot.getuList().getUmotto().substring(0,15)+"...");
		}
		request.getSession().setAttribute("ftype",ftype);
		request.getSession().setAttribute("forumViewList",lists);
		request.getSession().setAttribute("fhotList",hots);
		request.getSession().setAttribute("serachText",serach);
		request.getSession().setAttribute("condition",condition);
		return "redirect:/forum.jsp";
	}
	/**
	 * 查询所有帖子
	 * */
	@RequestMapping("queryAll.do")
	public String queryAll(HttpServletRequest request,
			@RequestParam(value="ftype",required = false)String ftype,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="7")int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Forum> list = forumService.queryAll(ftype);
		PageInfo<Forum> forumpage = new PageInfo<>(list);
		request.getSession().setAttribute("forumpage", forumpage);
		request.getSession().setAttribute("ftype", ftype);
		return "redirect:/admin/forum.jsp";
	}
	/**
	 * 按UID查询帖子
	 * */
	@RequestMapping("queryByUid.do")
	public String queryByUid(HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="7")int pageSize) {
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		PageHelper.startPage(pageNum,pageSize);
		List<Forum> list = forumService.queryByUid(uid);
		PageInfo<Forum> pfpage = new PageInfo<>(list);
		request.getSession().setAttribute("pfpage", pfpage);
		return "redirect:/personforum.jsp";
	}
	/**
	 * 按FID查询帖子
	 * */
	@RequestMapping("queryById.do")
	public String queryById(HttpServletRequest request, @RequestParam("fid")int fid) {
		ForumView forumView = forumService.queryById(fid);
		PageHelper.startPage(1,5);
		List<CommentView> commentViewList = forumService.queryComment(fid);
		if(forumView != null && commentViewList != null) {
			//获取楼主帖子和个人信息
			String path = forumView.getfList().getFcontent();
			forumView.getfList().setFcontent(HtmlIOUtil.read(path));
			request.getSession().setAttribute("forumView",forumView);
			//获取帖子对应的评论和回复
			for(CommentView commentView:commentViewList) {
				String cpath = commentView.getComment().getCcontent();
				commentView.getComment().setCcontent(HtmlIOUtil.read(cpath));
			}
			request.getSession().setAttribute("commentViewList",commentViewList);
		}
		//论坛热搜
		PageHelper.startPage(1,5);
		List<ForumView> hots = forumService.queryHot();
		for(ForumView hot:hots) {
			if(hot.getuList().getUmotto().length()>15)
				hot.getuList().setUmotto(hot.getuList().getUmotto().substring(0,15)+"...");
		}
		request.getSession().setAttribute("chotList",hots);
		return "redirect:/detail.jsp";
	}
	/**
	 * 按FID,CID查询帖子
	 * */
	@RequestMapping("queryOne.do")
	public String queryOne(HttpServletRequest request, @RequestParam("fid")int fid, @RequestParam("cid")int cid,@RequestParam(value="rid",required=false)String rid) {
		ForumView pforumView = forumService.queryById(fid);
		List<CommentView> pcommentViewList = forumService.queryOne(cid);
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid(); 
		if(pforumView != null && pcommentViewList != null) {
			//获取楼主帖子和个人信息
			String path = pforumView.getfList().getFcontent();
			pforumView.getfList().setFcontent(HtmlIOUtil.read(path));
			request.getSession().setAttribute("pforumView",pforumView);
			//获取帖子对应的评论和回复
			for(CommentView commentView:pcommentViewList) {
				String cpath = commentView.getComment().getCcontent();
				commentView.getComment().setCcontent(HtmlIOUtil.read(cpath));
			}
			request.getSession().setAttribute("pcommentViewList",pcommentViewList);
			//修改该评论或回复状态
			if(rid != null) {
				forumService.changeRread(Integer.parseInt(rid));
				request.getSession().setAttribute("read",forumService.queryRead(uid));
			}else {
				forumService.changeCread(cid);
				request.getSession().setAttribute("read",forumService.queryRead(uid));
			}
		}
		//论坛热搜
		PageHelper.startPage(1,5);
		List<ForumView> hots = forumService.queryHot();
		for(ForumView hot:hots) {
			if(hot.getuList().getUmotto().length()>15)
				hot.getuList().setUmotto(hot.getuList().getUmotto().substring(0,15)+"...");
		}
		request.getSession().setAttribute("chotList",hots);
		return "redirect:/personfcheck.jsp";
	}
	/**
	 * 点击查看更多加载数据
	 * */
	@ResponseBody
	@RequestMapping("/queryMore.do")
	public String queryByType(HttpServletRequest request,@RequestParam("ftype")String ftype,
			@RequestParam(value="serach",required=false)String serach,
			@RequestParam(value="condition",required=false)String condition,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize) {
		PageHelper.startPage(pageNum,pageSize);
		List<ForumView> lists = null;
		if("按关键字查找".equals(condition))
			 lists = forumService.queryKey(ftype,serach);
		else
			lists = forumService.queryList(ftype,serach);
		for(ForumView list:lists) {
			//获取文本
			String path = list.getfList().getFcontent();
			String fcontent = HtmlIOUtil.read(path);
			
			//去掉html格式,并截取前200个字
			String reg_html="<[^>]+>";
			if(fcontent.replaceAll(reg_html, "").length()>200)
				list.getfList().setFcontent(fcontent.replaceAll(reg_html, "").substring(0,200)+"...");
			else
				list.getfList().setFcontent(fcontent.replaceAll(reg_html, ""));
			
			//获取文本中的第一张图片<img />
			Pattern pattern = Pattern.compile("<img.*src\\s*=\\s*(.*?)[^>]*?>");
			Matcher matcher = pattern.matcher(fcontent);
			if(matcher.find()) {
				//获取<img />的src的值
				String img = matcher.group();
				Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
				if(m.find())
					list.getfList().setFimage(m.group());
			}
			//日期截取
			list.getfList().setFdate(list.getfList().getFdate().substring(0,10));
		}
		request.getSession().setAttribute("serachText",serach);
		request.getSession().setAttribute("condition",condition);
		Gson gson = new Gson();
		String data = gson.toJson(lists);
		return data;
	}
	/**
	 * 编辑帖子 
	 * */
	@ResponseBody
	@RequestMapping("/edit.do")
	public String edit(HttpServletRequest request, @RequestParam("ftitle")String ftitle,@RequestParam("ftype")String ftype,@RequestParam("fcontent")String fcontent) {
		Forum forum = new Forum();
		forum.setFtitle(ftitle);
		forum.setFtype(ftype);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String fdate = sdf.format(new Date());
		forum.setFdate(fdate);
		//按当天日趋创建文件夹
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		String ymd = sd.format(new Date());
		String path = request.getSession().getServletContext().getRealPath("/") + "/forum/article/"+ftype+"/"+ymd+"/";
		//上传的所有图片路径
		String fimage = null;
		if(request.getSession().getAttribute("fimage") != null)
			 fimage = request.getSession().getAttribute("fimage").toString();
		forum.setFimage(fimage);
		
		//按时间戳命名文件
		String name = System.currentTimeMillis()+".html";
		String info = HtmlIOUtil.write(fcontent, path, name);
		
		forum.setFcontent(path+name);
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		int result = forumService.edit(forum,uid);
		if(result != 0 && "上传成功".equals(info)){
			request.getSession().setAttribute("fimage", null);
			return "1";}
		return "0";
	}
	/**
	 * 根据FID删除回复
	 * */
	@ResponseBody
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request, @RequestParam("fid")int fid) {
		List<Integer> cids = forumService.queryCid(fid);
		if(!"[null]".equals(cids.toString())) {
			for (int cid : cids) {
				//删除回复
				forumService.deleteReply(cid);
				//删除评论
				String path = ((Comment)(forumService.findComment(cid))).getCcontent();
				String cimages = ((Comment)(forumService.findComment(cid))).getCimage();
				if(cimages != null) {
					cimages = cimages.substring(1,cimages.length()-1);
					String []images = cimages.split(",");
					for (String image : images) {
						String savePath = request.getSession().getServletContext().getRealPath("/") + "/comment/image/";
						HtmlIOUtil.delete(savePath+image.trim());
					}
				}
				HtmlIOUtil.delete(path);
				forumService.deleteComment(cid);
			}
		}
		String path = ((Forum)(forumService.findOne(fid))).getFcontent();
		String fimages = ((Forum)(forumService.findOne(fid))).getFimage();
		if(fimages != null) {
			fimages = fimages.substring(1,fimages.length()-1);
			String []images = fimages.split(",");
			for (String image : images) {
				String savePath = request.getSession().getServletContext().getRealPath("/") + "/forum/image/";
				HtmlIOUtil.delete(savePath+image.trim());
			}
		}
		HtmlIOUtil.delete(path);
		forumService.delete(fid);
		return "1";
	}
	/**
	 * 图片上传
	 * */
	@ResponseBody
	@RequestMapping("/upload.do")
	public void upload(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		//文件保存目录路径
		String savePath = request.getSession().getServletContext().getRealPath("/") + "/forum/";

		//文件保存目录URL
		String saveUrl  = request.getContextPath() + "/forum/";

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
					if(request.getSession().getAttribute("fimage") != null) {
						@SuppressWarnings("unchecked")
						List<String> list = (List<String>)request.getSession().getAttribute("fimage"); 
						list.add(ymd+"/"+newFileName);
						request.getSession().setAttribute("fimage", list);
					}else {
						List<String> list = new ArrayList<>();
						list.add(ymd+"/"+newFileName);
						request.getSession().setAttribute("fimage", list);
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

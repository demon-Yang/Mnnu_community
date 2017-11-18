package com.yxd.controller;

import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
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
import com.github.pagehelper.PageInfo;
import com.google.gson.JsonObject;
import com.yxd.entity.News;
import com.yxd.service.NewsService;
import com.yxd.util.HtmlIOUtil;

@Controller
@RequestMapping("/admin/news")
public class AdminNewsController {
	@Resource
	private NewsService newsService;
	/**
	 * 主界面新闻
	 * */
	@ResponseBody
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request) {
		/*获取新闻,并裁剪新闻标题*/
		PageHelper.startPage(1,8);
		List<News> acadList = newsService.queryByType("学术报告");
		for (News list:acadList) {
			if(list.getNtitle().length()>15)
				list.setNtitle(list.getNtitle().substring(0,15)+"...");
			list.setNdate(list.getNdate().substring(5,10));
		}
		
		PageHelper.startPage(1,3);
		List<News> hnewList = newsService.queryByType("热点聚焦");
		for (News list:hnewList) {
			if(list.getNtitle().length()>25)
				list.setNtitle(list.getNtitle().substring(0,25)+"...");
			list.setNdate(list.getNdate().substring(5,10));
		}
		
		PageHelper.startPage(1,3);
		List<News> mnewList = newsService.queryByType("闽师新闻");
		for (News list:mnewList) {
			if(list.getNtitle().length()>25)
				list.setNtitle(list.getNtitle().substring(0,25)+"...");
			list.setNdate(list.getNdate().substring(5,10));
		}
		
		PageHelper.startPage(1,3);
		List<News> noticeList = newsService.queryByType("通知公告");
		for (News list:noticeList) {
			if(list.getNtitle().length()>45)
				list.setNtitle(list.getNtitle().substring(0,45)+"...");
			list.setNdate(list.getNdate().substring(5,10));
		}
		request.getSession().setAttribute("indexAcadList", acadList);
		request.getSession().setAttribute("indexHnewList", hnewList);
		request.getSession().setAttribute("indexMnewList", mnewList);
		request.getSession().setAttribute("indexNoticeList", noticeList);
		return "1";
	}
	/**
	 * 新闻列表
	 * */
	@ResponseBody
	@RequestMapping("/newslist.do")
	public String newslist(HttpServletRequest request) {
		/*获取新闻,并裁剪新闻标题*/
		PageHelper.startPage(1,4);
		List<News> acadList = newsService.queryByType("学术报告");
		for (News list:acadList) {
			if(list.getNtitle().length()>16)
				list.setNtitle(list.getNtitle().substring(0,16)+"...");
		}
		
		PageHelper.startPage(1,4);
		List<News> hnewList = newsService.queryByType("热点聚焦");
		for (News list:hnewList) {
			if(list.getNtitle().length()>16)
				list.setNtitle(list.getNtitle().substring(0,16)+"...");
		}
		
		PageHelper.startPage(1,4);
		List<News> mnewList = newsService.queryByType("闽师新闻");
		for (News list:mnewList) {
			if(list.getNtitle().length()>16)
				list.setNtitle(list.getNtitle().substring(0,16)+"...");
		}
		
		PageHelper.startPage(1,4);
		List<News> noticeList = newsService.queryByType("通知公告");
		for (News list:noticeList) {
			if(list.getNtitle().length()>16)
				list.setNtitle(list.getNtitle().substring(0,16)+"...");
		}
		request.getSession().setAttribute("newsAcadList", acadList);
		request.getSession().setAttribute("newsHnewList", hnewList);
		request.getSession().setAttribute("newsMnewList", mnewList);
		request.getSession().setAttribute("newsNoticeList", noticeList);
		return "1";
	}
	/**
	 * 新闻列表按类型查找新闻
	 * */
	@RequestMapping("/queryList.do")
	public String queryList(HttpServletRequest request,@RequestParam("ntype")String ntype,
			@RequestParam(value="ntitle",required=false)String ntitle,@RequestParam(value="ndate",required=false)String ndate,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="3")int pageSize) {
			PageHelper.startPage(pageNum, pageSize);
			List<News> newsList = newsService.queryByCondition(ntype, ntitle, ndate);
			PageInfo<News> page = new PageInfo<News>(newsList);
			request.getSession().setAttribute("sntitle",ntitle);
			request.getSession().setAttribute("sndate",ndate);
			request.getSession().setAttribute("newsList", newsList);
			request.getSession().setAttribute("nlistType", ntype);
			request.getSession().setAttribute("page", page);
			return "redirect:/newslist.jsp";
	}
	/**
	 * 编辑新闻 
	 * */
	@ResponseBody
	@RequestMapping("/edit.do")
	public String edit(HttpServletRequest request, @RequestParam("ntitle")String ntitle,@RequestParam("ntype")String ntype,@RequestParam("ncontent")String ncontent) {
		News news = new News();
		news.setNtitle(ntitle);
		news.setNtype(ntype);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ndate = sdf.format(new Date());
		news.setNdate(ndate);
		//按当天日趋创建文件夹
		SimpleDateFormat sd = new SimpleDateFormat("yyyyMMdd");
		String ymd = sd.format(new Date());
		String path = request.getSession().getServletContext().getRealPath("/") + "/news/article/"+ntype+"/"+ymd+"/";
		//按时间戳命名文件
		String name = System.currentTimeMillis()+".html";
		String info = HtmlIOUtil.write(ncontent, path, name);
		
		news.setNcontent(path+name);
		int result = newsService.edit(news);
		if(result != 0 && "上传成功".equals(info))
			return "1";
		return "0";
	}
	/**
	 * 按ID查找单篇新闻
	 * */
	@RequestMapping("/findOne.do")
	public String findOne(HttpServletRequest request,@RequestParam("nid")int nid) {
		News news = newsService.findOne(nid);
		if(news != null) {
			String path = ((News)newsService.findOne(nid)).getNcontent();
			news.setNcontent(HtmlIOUtil.read(path));
			request.getSession().setAttribute("news",news);
		}
		return "redirect:/news.jsp";
	}
	/**
	 * 按类型查找新闻
	 * */
	@RequestMapping("/queryByType.do")
	public String queryByType(HttpServletRequest request,@RequestParam("ntype")String ntype,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize) {
		if("闽师新闻".equals(ntype)) {
			PageHelper.startPage(pageNum, pageSize);
			List<News> mnewList = newsService.queryByType(ntype);
			PageInfo<News> mnewPage = new PageInfo<News>(mnewList);
			request.getSession().setAttribute("mnewList", mnewList);
			request.getSession().setAttribute("mnewPage", mnewPage);
			return "redirect:/admin/mnew.jsp";
		}else if("学术报告".equals(ntype)) {
			PageHelper.startPage(pageNum, pageSize);
			List<News> acadList = newsService.queryByType(ntype);
			PageInfo<News> acadPage = new PageInfo<News>(acadList);
			request.getSession().setAttribute("acadList", acadList);
			request.getSession().setAttribute("acadPage", acadPage);
			return "redirect:/admin/academic.jsp";
		}else if("热点聚焦".equals(ntype)) {
			PageHelper.startPage(pageNum, pageSize);
			List<News> hnewList = newsService.queryByType(ntype);
			PageInfo<News> hnewpage = new PageInfo<News>(hnewList);
			request.getSession().setAttribute("hnewList", hnewList);
			request.getSession().setAttribute("hnewPage", hnewpage);
			return "redirect:/admin/hnew.jsp";
		}else {
			PageHelper.startPage(pageNum, pageSize);
			List<News> noticeList = newsService.queryByType(ntype);
			PageInfo<News> noticePage = new PageInfo<News>(noticeList);
			request.getSession().setAttribute("noticeList", noticeList);
			request.getSession().setAttribute("noticePage", noticePage);
			return "redirect:/admin/notice.jsp";
		}
	}
	/**
	 * 删除新闻 
	 * */
	@ResponseBody
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request,@RequestParam("nid")int nid) {
		String path = ((News)newsService.findOne(nid)).getNcontent();
		String info = HtmlIOUtil.delete(path);
		int result = newsService.delete(nid);
		if(result != 0 && "删除成功".equals(info))
			return "1";
		return "0";
	}
	/**
	 * 图片上传
	 * */
	@ResponseBody
	@RequestMapping("/upload.do")
	public void upload(HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		//文件保存目录路径
		String savePath = request.getSession().getServletContext().getRealPath("/") + "/news/";

		//文件保存目录URL
		String saveUrl  = request.getContextPath() + "/news/";

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

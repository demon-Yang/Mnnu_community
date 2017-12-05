package com.yxd.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.yxd.entity.Market;
import com.yxd.entity.User;
import com.yxd.service.MarketService;

@Controller
@RequestMapping("/market")
public class MarketController {
	@Resource
	private MarketService marketService;
	/**
	 * 添加商品
	 * */
	@RequestMapping("/add.do")
	public String add(HttpServletRequest request,@RequestParam("mtitle")String mtitle,@RequestParam("mcontact")String mcontact,@RequestParam("mtype")String mtype,
			@RequestParam(value = "mimage1", required = false) MultipartFile mimage1,@RequestParam(value = "mimage2", required = false) MultipartFile mimage2,
			@RequestParam(value = "mimage3", required = false) MultipartFile mimage3,@RequestParam(value = "mimage4", required = false) MultipartFile mimage4,
			@RequestParam("mcontent") String mcontent) {
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		Market market = new Market();
		market.setUid(uid);
		market.setMtitle(mtitle);
		market.setMcontact(mcontact);
		market.setMtype(mtype);
		market.setMcontent(mcontent);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String mdate = sd.format(new Date());
		market.setMdate(mdate);
		//创建文件夹
		String path = request.getSession().getServletContext().getRealPath("market/image/");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		path += ymd + "/";
		//将图片读取到文件夹中
		Map<String,String> mimage = new HashMap<>();
		String image1Name = mimage1.getOriginalFilename();   
		if(!image1Name.trim().isEmpty()&& image1Name != null) {
			String fileType = image1Name.substring(image1Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"1"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage1.transferTo(targetFile);
				mimage.put("mimage1",path+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String image2Name = mimage2.getOriginalFilename();   
		if(!image2Name.trim().isEmpty()&& image2Name != null) {
			String fileType = image2Name.substring(image2Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"2"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage2.transferTo(targetFile);
				mimage.put("mimage2",path+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String image3Name = mimage3.getOriginalFilename();   
		if(!image3Name.trim().isEmpty()&& image3Name != null) {
			String fileType = image3Name.substring(image3Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"3"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage3.transferTo(targetFile);
				mimage.put("mimage3",path+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String image4Name = mimage4.getOriginalFilename();   
		if(!image4Name.trim().isEmpty()&& image4Name != null) {
			String fileType = image4Name.substring(image4Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"4"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage4.transferTo(targetFile);
				mimage.put("mimage4",path+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Gson gson = new Gson();
		String mimages = gson.toJson(mimage);
		market.setMimage(mimages);
		marketService.add(market);
		return "redirect:/personmarket.jsp";
	}
	/**
	 * 图片预览
	 * */
	@ResponseBody
	@RequestMapping(value="/preview.do",produces = "text/html; charset=utf-8")
	public String preview(HttpServletRequest request,@RequestParam("mtitle")String mtitle,@RequestParam("mcontact")String mcontact,
			@RequestParam(value = "mimage1", required = false) MultipartFile mimage1,@RequestParam(value = "mimage2", required = false) MultipartFile mimage2,
			@RequestParam(value = "mimage3", required = false) MultipartFile mimage3,@RequestParam(value = "mimage4", required = false) MultipartFile mimage4,
			@RequestParam("mcontent") String mcontent) {
		Market market = new Market();
		market.setMtitle(mtitle);
		market.setMcontact(mcontact);
		market.setMcontent(mcontent);
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String mdate = sd.format(new Date());
		market.setMdate(mdate);
		//创建文件夹
		String path = request.getSession().getServletContext().getRealPath("market/temp/");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		path += ymd + "/";
		//将图片读取到文件夹中
		Map<String,String> mimage = new HashMap<>();
		String image1Name = mimage1.getOriginalFilename();   
		if(!image1Name.trim().isEmpty()&& image1Name != null) {
			String fileType = image1Name.substring(image1Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"1"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage1.transferTo(targetFile);
				mimage.put("mimage1","/Mnnu_community/market/temp/"+ymd+"/"+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String image2Name = mimage2.getOriginalFilename();   
		if(!image2Name.trim().isEmpty()&& image2Name != null) {
			String fileType = image2Name.substring(image2Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"2"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage2.transferTo(targetFile);
				mimage.put("mimage2","/Mnnu_community/market/temp/"+ymd+"/"+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String image3Name = mimage3.getOriginalFilename();   
		if(!image3Name.trim().isEmpty()&& image3Name != null) {
			String fileType = image3Name.substring(image3Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"3"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage3.transferTo(targetFile);
				mimage.put("mimage3","/Mnnu_community/market/temp/"+ymd+"/"+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String image4Name = mimage4.getOriginalFilename();   
		if(!image4Name.trim().isEmpty()&& image4Name != null) {
			String fileType = image4Name.substring(image4Name.lastIndexOf("."));
			String fileName = System.currentTimeMillis()+"4"+fileType;
			File targetFile = new File(path,fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				mimage4.transferTo(targetFile);
				mimage.put("mimage4","/Mnnu_community/market/temp/"+ymd+"/"+fileName);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Gson gson = new Gson();
		String mimages = gson.toJson(mimage);
		market.setMimage(mimages);
		String data = gson.toJson(market);
		return data;
	}
	
}

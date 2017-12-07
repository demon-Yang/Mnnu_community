package com.yxd.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.yxd.entity.Market;
import com.yxd.entity.User;
import com.yxd.service.MarketService;
import com.yxd.util.HtmlIOUtil;
import com.yxd.view.MarketView;

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
	 * 查询个人商品
	 * */
	@RequestMapping("queryByUid.do")
	public String queryByUid(HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="2")int pageSize) {
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		PageHelper.startPage(pageNum, pageSize);
		List<Market> lists = marketService.queryByUid(uid);
		PageInfo<Market> pmpage = new PageInfo<>(lists);
		request.getSession().setAttribute("pmpage", pmpage);
		return "redirect:/personmarket.jsp";
	}
	/**
	 * 查询个人商品
	 * */
	@RequestMapping("queryByMid.do")
	public String queryByMid(HttpServletRequest request,@RequestParam("mid")int mid,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="2")int pageSize) {
		Market market = marketService.queryByMid(mid);
		String images = market.getMimage();
		Gson gson = new Gson();
		Map<String,String> map = gson.fromJson(images,new TypeToken<HashMap<String,Object>>(){}.getType());
		String mimage1 = map.get("mimage1");
		String mimage2 = map.get("mimage2");
		String mimage3 = map.get("mimage3");
		String mimage4 = map.get("mimage4");
		request.getSession().setAttribute("pmimage1",mimage1.substring(mimage1.length()-56,mimage1.length()));
		request.getSession().setAttribute("pmimage2",mimage2.substring(mimage2.length()-56,mimage2.length()));
		request.getSession().setAttribute("pmimage3",mimage3.substring(mimage3.length()-56,mimage3.length()));
		request.getSession().setAttribute("pmimage4",mimage4.substring(mimage4.length()-56,mimage4.length()));
		request.getSession().setAttribute("pmarket", market);
		return "redirect:/personmcheck.jsp";
	}
	/**
	 * 查询单个商品
	 * */
	@RequestMapping("queryOne.do")
	public String queryOne(HttpServletRequest request,@RequestParam("mid")int mid,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="2")int pageSize) {
		Market market = marketService.queryByMid(mid);
		String images = market.getMimage();
		Gson gson = new Gson();
		Map<String,String> map = gson.fromJson(images,new TypeToken<HashMap<String,Object>>(){}.getType());
		String mimage1 = map.get("mimage1");
		String mimage2 = map.get("mimage2");
		String mimage3 = map.get("mimage3");
		String mimage4 = map.get("mimage4");
		request.getSession().setAttribute("mimage1",mimage1.substring(mimage1.length()-56,mimage1.length()));
		request.getSession().setAttribute("mimage2",mimage2.substring(mimage2.length()-56,mimage2.length()));
		request.getSession().setAttribute("mimage3",mimage3.substring(mimage3.length()-56,mimage3.length()));
		request.getSession().setAttribute("mimage4",mimage4.substring(mimage4.length()-56,mimage4.length()));
		request.getSession().setAttribute("market", market);
		return "redirect:/admin/marketcheck.jsp";
	}
	/**
	 * 查询所有商品
	 * */
	@RequestMapping("queryAll.do")
	public String queryAll(HttpServletRequest request,
			@RequestParam(value="mtype",required = false)String mtype,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="7")int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Market> list = marketService.queryAll(mtype);
		PageInfo<Market> marketpage = new PageInfo<>(list);
		request.getSession().setAttribute("marketpage", marketpage);
		request.getSession().setAttribute("mtype", mtype);
		return "redirect:/admin/market.jsp";
	}
	/**
	 * 类型查询商品
	 * */
	@RequestMapping("queryByType.do")
	public String queryByType(HttpServletRequest request,
			@RequestParam(value="mtype",defaultValue="共享图书",required = false)String mtype,
			@RequestParam(value="condition",required = false)String mtitle,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="6")int pageSize) {
		PageHelper.startPage(pageNum, pageSize);
		List<Market> list = marketService.queryByType(mtype, mtitle);
		
		//建立marketview
		List<MarketView> view = new ArrayList<MarketView>();
		Gson gson = new Gson();
		for (Market market : list) {
			String mimage = market.getMimage();
			Map<String,String> map = gson.fromJson(mimage,new TypeToken<HashMap<String,Object>>(){}.getType());
			String mimage1 = map.get("mimage1");
			String mimage2 = map.get("mimage2");
			String mimage3 = map.get("mimage3");
			String mimage4 = map.get("mimage4");
			MarketView marketView = new MarketView();
			marketView.setMarket(market);
			marketView.setMimage1(mimage1.substring(mimage1.length()-56,mimage1.length()));
			marketView.setMimage2(mimage2.substring(mimage2.length()-56,mimage2.length()));
			marketView.setMimage3(mimage3.substring(mimage3.length()-56,mimage3.length()));
			marketView.setMimage4(mimage4.substring(mimage4.length()-56,mimage4.length()));
			view.add(marketView);
		}
		PageInfo<Market> mtypepage = new PageInfo<>(list);
		request.getSession().setAttribute("mtypepage", mtypepage);
		request.getSession().setAttribute("marketView", view);
		request.getSession().setAttribute("mtype", mtype);
		request.getSession().setAttribute("condition", mtitle);
		return "redirect:/market.jsp";
	}
	/**
	 * 根据MID删除回复
	 * */
	@ResponseBody
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request, @RequestParam("mid")int mid) {
		Market market = marketService.queryByMid(mid);
		//删除图片
		String images = market.getMimage();
		Gson gson = new Gson();
		Map<String,String> map = gson.fromJson(images,new TypeToken<HashMap<String,Object>>(){}.getType());
		String mimage1 = map.get("mimage1");
		String mimage2 = map.get("mimage2");
		String mimage3 = map.get("mimage3");
		String mimage4 = map.get("mimage4");
		HtmlIOUtil.delete(mimage1);
		HtmlIOUtil.delete(mimage2);
		HtmlIOUtil.delete(mimage3);
		HtmlIOUtil.delete(mimage4);
		//删除数据库的数据
		marketService.delete(mid);
		return "1";
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

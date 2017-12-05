package com.yxd.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin")
public class AdminSlideController {
	/**
	 * 轮播图
	 * */
	@RequestMapping("/slide.do")
	public String slide(HttpServletRequest request,@RequestParam(value = "slide1", required = false) MultipartFile slide1,
			@RequestParam(value = "slide2", required = false) MultipartFile slide2,@RequestParam(value = "slide3", required = false) MultipartFile slide3) {
		String path = request.getSession().getServletContext().getRealPath("images/");
		String slide1Name = slide1.getOriginalFilename();
		String slide2Name = slide2.getOriginalFilename();
		String slide3Name = slide3.getOriginalFilename();
		if(!slide1Name.trim().isEmpty()&& slide1Name != null) {
			String fileType = slide1Name.substring(slide1Name.lastIndexOf("."));
			File targetFile = new File(path,"slide1"+fileType);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				slide1.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(!slide2Name.trim().isEmpty()&& slide2Name != null) {
			String fileType = slide2Name.substring(slide2Name.lastIndexOf("."));
			File targetFile = new File(path,"slide2"+fileType);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				slide2.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(!slide3Name.trim().isEmpty()&& slide3Name != null) {
			String fileType = slide3Name.substring(slide3Name.lastIndexOf("."));
			File targetFile = new File(path,"slide3"+fileType);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				slide3.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/news/index.do";
	}
	/**
	 * 轮播图1预览
	 * */
	@ResponseBody
	@RequestMapping("/slide1Preview.do")
	public String slide1Preview(HttpServletRequest request,@RequestParam(value = "slide1", required = false) MultipartFile slide1,@RequestParam("name")String name) {
		String path = request.getSession().getServletContext().getRealPath("news/slide/");
		String fileName = slide1.getOriginalFilename();   
		if(!fileName.trim().isEmpty()&&fileName != null) {
			String fileType = fileName.substring(fileName.lastIndexOf(".")); 
			File targetFile = new File(path,name+fileType);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				slide1.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/Mnnu_community/news/slide/"+name+fileType;
		}
		return "";
	}
	/**
	 * 轮播图2预览
	 * */
	@ResponseBody
	@RequestMapping("/slide2Preview.do")
	public String slide2Preview(HttpServletRequest request,@RequestParam(value = "slide2", required = false) MultipartFile slide2,@RequestParam("name")String name) {
		String path = request.getSession().getServletContext().getRealPath("news/slide/");
		String fileName = slide2.getOriginalFilename();   
		if(!fileName.trim().isEmpty()&&fileName != null) {
			String fileType = fileName.substring(fileName.lastIndexOf(".")); 
			File targetFile = new File(path,name+fileType);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				slide2.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/Mnnu_community/news/slide/"+name+fileType;
		}
		return "";
	}
	/**
	 * 轮播图3预览
	 * */
	@ResponseBody
	@RequestMapping("/slide3Preview.do")
	public String slide3Preview(HttpServletRequest request,@RequestParam(value = "slide3", required = false) MultipartFile slide3,@RequestParam("name")String name) {
		String path = request.getSession().getServletContext().getRealPath("news/slide/");
		String fileName = slide3.getOriginalFilename();   
		if(!fileName.trim().isEmpty()&&fileName != null) {
			String fileType = fileName.substring(fileName.lastIndexOf(".")); 
			File targetFile = new File(path,name+fileType);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			try {
				slide3.transferTo(targetFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "/Mnnu_community/news/slide/"+name+fileType;
		}
		return "";
	}
}

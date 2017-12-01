package com.yxd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yxd.entity.Notes;
import com.yxd.entity.User;
import com.yxd.service.NotesService;

@Controller
@RequestMapping("/notes")
public class NotesController {
	@Resource
	private NotesService notesService;
	/**
	 *写留言
	 * */
	@RequestMapping("/insert.do")
	public String insert(HttpServletRequest request,@RequestParam("ncontent")String ncontent) {
		Notes notes = new Notes();
		notes.setNcontent(ncontent);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ndate = sdf.format(new Date());
		notes.setNdate(ndate);
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		notes.setUid(uid);
		notesService.insert(notes);
		return "forward:queryAll.do";
	}
	/**
	 * 查询所有留言
	 * */
	@RequestMapping("/queryAll.do")
	public String queryAll(HttpServletRequest request) {
		List<Notes> notes = notesService.queryAll();
		request.getSession().setAttribute("notes", notes);
		return "redirect:/notes.jsp";
	}
	/**
	 * 按日期查询所有留言
	 * */
	@RequestMapping("/queryByDate.do")
	public String queryByDate(HttpServletRequest request,@RequestParam("ndate")String ndate) {
		List<Notes> notes = notesService.queryByDate(ndate);
		request.getSession().setAttribute("notes", notes);
		return "redirect:/notes.jsp";
	}
}

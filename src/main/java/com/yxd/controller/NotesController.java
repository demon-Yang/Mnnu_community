package com.yxd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yxd.entity.Notes;
import com.yxd.entity.User;
import com.yxd.service.NotesService;

@Controller
@RequestMapping("/notes")
public class NotesController {
	@Resource
	private NotesService notesService;
	@ResponseBody
	@RequestMapping("/insert.do")
	public String insert(HttpServletRequest request,@RequestParam("ncontent")String ncontent) {
		Notes notes = new Notes();
		notes.setNcontent(ncontent);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String ndate = sdf.format(new Date());
		notes.setNdate(ndate);
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		notes.setUid(uid);
		//notesService.insert(notes);
		request.getSession().setAttribute("notes",notes);
		return "1";
	}
}

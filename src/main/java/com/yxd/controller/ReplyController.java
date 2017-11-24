package com.yxd.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.yxd.service.ReplyService;
import com.yxd.view.ReplyView;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Resource
	private ReplyService replyService;
	/**
	 * 点击查看评论
	 * */
	@ResponseBody
	@RequestMapping("/queryReply.do")
	public String queryReply(HttpServletRequest request, @RequestParam("cid")int cid,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="2")int pageSize) {
		
		PageHelper.startPage(pageNum,pageSize);
		List<ReplyView> replyViewList = replyService.queryReply(cid);
		PageInfo<ReplyView> page = new PageInfo<ReplyView>(replyViewList);
		Gson gson = new Gson();
		String data = gson.toJson(page);
		return data;
	}
}

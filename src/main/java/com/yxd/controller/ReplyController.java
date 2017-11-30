package com.yxd.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.yxd.entity.Reply;
import com.yxd.entity.User;
import com.yxd.service.ReplyService;
import com.yxd.view.PReplyView;
import com.yxd.view.ReplyView;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Resource
	private ReplyService replyService;
	/**
	 * 添加评论
	 * */
	@ResponseBody
	@RequestMapping("/add.do")
	public String add(HttpServletRequest request,@RequestParam("rcontent")String rcontent,@RequestParam("cid")int cid,
			@RequestParam("fromid")int fromid,@RequestParam("toid")int toid) {
		Reply reply = new Reply();
		reply.setCid(cid);
		reply.setRcontent(rcontent);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String rdate = sdf.format(new Date());
		reply.setRdate(rdate);
		reply.setRread("no");
		reply.setFromid(fromid);
		reply.setToid(toid);
		replyService.add(reply);
		return "1";
	}
	/**
	 * 按用户ID查看回复
	 * */
	@RequestMapping("/queryByUid.do")
	public String queryByUid(HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize) {
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		PageHelper.startPage(pageNum,pageSize);
		List<PReplyView> lists = replyService.queryByUid(uid);
		for(PReplyView list:lists) {
			String reg_html="<[^>]+>";
			String rcontent = list.getReply().getRcontent().replaceAll(reg_html, "");
			if(rcontent.length()>30)
				list.getReply().setRcontent(rcontent.substring(0,30)+"...");
		}
		PageInfo<PReplyView> pfrpage = new PageInfo<>(lists);
		request.getSession().setAttribute("pfrpage", pfrpage);
		return "redirect:/personfreply.jsp";
	}
	/**
	 * 根据用户ID查询个人评论对应的回复 
	 * */
	@RequestMapping("/queryByPuid.do")
	public String queryByPuid(HttpServletRequest request,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize) {
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid();
		PageHelper.startPage(pageNum,pageSize);
		List<PReplyView> lists = replyService.queryByPuid(uid);
		for(PReplyView list:lists) {
			String reg_html="<[^>]+>";
			String rcontent = list.getReply().getRcontent().replaceAll(reg_html, "");
			if(rcontent.length()>30)
				list.getReply().setRcontent(rcontent.substring(0,30)+"...");
		}
		PageInfo<PReplyView> prmpage = new PageInfo<>(lists);
		request.getSession().setAttribute("prmpage", prmpage);
		return "redirect:/personrmsg.jsp";
	}
	/**
	 * 点击查看评论
	 * */
	@ResponseBody
	@RequestMapping("/queryReply.do")
	public String queryReply(HttpServletRequest request, @RequestParam("cid")int cid,
			@RequestParam(value="pageNum",defaultValue="1")int pageNum,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize) {
		
		PageHelper.startPage(pageNum,pageSize);
		List<ReplyView> replyViewList = replyService.queryReply(cid);
		PageInfo<ReplyView> page = new PageInfo<ReplyView>(replyViewList);
		Gson gson = new Gson();
		String data = gson.toJson(page);
		return data;
	}
	/**
	 * 根据RID改变未读状态
	 * */
	@RequestMapping("/changeRead.do")
	public String changeRead(HttpServletRequest request, @RequestParam("rid")int rid) {
		replyService.changeRead(rid);
		int uid = ((User)(request.getSession().getAttribute("user"))).getUid(); 
		int read = replyService.queryRead(uid);
		request.getSession().setAttribute("read",read);
		return "forward:queryByPuid.do";
	}
	/**
	 * 根据RID删除回复
	 * */
	@ResponseBody
	@RequestMapping("/delete.do")
	public String delete(HttpServletRequest request, @RequestParam("rid")int rid) {
		replyService.delete(rid);
		return "1";
	}
}

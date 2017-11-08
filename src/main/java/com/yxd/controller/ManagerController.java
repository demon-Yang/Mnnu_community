package com.yxd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yxd.entity.Manager;
import com.yxd.service.ManagerService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Resource
	private ManagerService managerService;
	
	/**
	 * 登录
	 * */
	@ResponseBody
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request,@RequestParam("mname")String mname,@RequestParam("mpwd")String mpwd) {
		Manager manager = managerService.login(mname, mpwd);
		if(manager == null)
			return "0";
		else {
			request.getSession().setAttribute("manager",manager);
			return "1";
		}
	}
	/**
	 * 退出登录
	 * */
	@ResponseBody
	@RequestMapping("/loginout.do")
	public void loginout(HttpServletRequest request) {
		request.getSession().invalidate();
	}
}

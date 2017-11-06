package com.yxd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yxd.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService UserService;
	/**
	 * 注册
	 * */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request){
		
		return null;
	}
}

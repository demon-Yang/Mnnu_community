package com.yxd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yxd.service.UserService;
import com.yxd.util.JavaMail;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	/**
	 * 注册
	 * */
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request){
		
		return null;
	}
	
	@ResponseBody
	@RequestMapping("/sendVcode.do")
	public String sendVcode(HttpServletRequest request ,@RequestParam("vcode")int vcode,@RequestParam("uemail")String uemail) throws Exception {
		int result = userService.queryByEmail(uemail);
		if(result == 0) {
			//JavaMail.send(vcode ,uemail);
			System.out.println(vcode);
			return "0";
		}
		else {
			return "1";
		}
	}
}

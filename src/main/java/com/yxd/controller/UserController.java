package com.yxd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yxd.entity.User;
import com.yxd.service.UserService;
import com.yxd.util.JavaMail;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource
	private UserService userService;
	
	/**
	 * 登录
	 * */
	@ResponseBody
	@RequestMapping("/login.do")
	public String login(HttpServletRequest request,@RequestParam("uemail")String uemail,@RequestParam("upwd")String upwd) {
		User user = userService.login(uemail, upwd);
		if(user == null)
			return "0";
		else {
			request.getSession().setAttribute("user",user);
			return "1";
		}
	}
	
	/**
	 * 注册
	 * */
	@ResponseBody
	@RequestMapping("/register.do")
	public String register(HttpServletRequest request,@RequestParam("uemail")String uemail,@RequestParam("uname")String uname,
			@RequestParam("upwd")String upwd){
		User user = new User();
		user.setUemail(uemail);
		user.setUname(uname);
		user.setUpwd(upwd);
		userService.register(user);
		return "1";
	}
	
	/**
	 * 忘记密码
	 * @throws Exception 
	 * */
	@ResponseBody
	@RequestMapping("/forgetpwd.do")
	public String forgetpwd(HttpServletRequest request,@RequestParam("uemail")String uemail) throws Exception {
		String pwd = userService.forgetpwd(uemail);
		if(pwd == null)
			return "0";
		else {
			//JavaMail.send(pwd ,uemail);
			return "1";
		} 
	}
	/**
	 * 注册表单
	 * 发送验证码 
	 * */
	@ResponseBody
	@RequestMapping("/sendVcode.do")
	public String sendVcode(HttpServletRequest request ,@RequestParam("uemail")String uemail) throws Exception {
		int result = userService.queryByEmail(uemail);
		if(result == 0) {
			int rvcode = (int)(Math.random()*9000+1000);
			//JavaMail.send(rvcode+"" ,uemail);
			System.out.println(rvcode);
			request.getSession().setAttribute("rvcode",rvcode);
			return "0";
		}
		else {
			return "1";
		}
	}
	/**
	 * 忘记密码表单
	 * 发送验证码 
	 * */
	@ResponseBody
	@RequestMapping("/fsendVcode.do")
	public String fsendVcode(HttpServletRequest request ,@RequestParam("uemail")String uemail) throws Exception {
		int result = userService.queryByEmail(uemail);
		if(result != 0) {
			int rvcode = (int)(Math.random()*9000+1000);
			//JavaMail.send(rvcode+"" ,uemail);
			System.out.println(rvcode);
			request.getSession().setAttribute("rvcode",rvcode);
			return "1";
		}
		else {
			return "0";
		}
	}
	/**
	 * 注册表单
	 * 获取验证码
	 * */
	@ResponseBody
	@RequestMapping("/getVcode.do")
	public String getVcode(HttpServletRequest request) {
		String rvcode = null;
		if(request.getSession().getAttribute("rvcode") != null) 
			rvcode = request.getSession().getAttribute("rvcode").toString();
		return rvcode;
	}
}

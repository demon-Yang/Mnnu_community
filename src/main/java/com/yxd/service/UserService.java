package com.yxd.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.UserDao;
import com.yxd.entity.User;

@Service
public class UserService {
	@Resource
	private UserDao userDao;
	//用户登录
	public User login(String uemail,String upwd) {
		return userDao.login(uemail, upwd);
	}
	//邮箱查询用户是否存在
	public int queryByEmail(String uemail) {
		return userDao.queryByEmail(uemail);
	}
	//查询用户是否存在，存在返回密码
	public String forgetpwd(String uemail) {
		return userDao.forgetpwd(uemail);
	}
	//用户注册
	public int register(User user) {
		 return userDao.register(user);
	}
	//修改原密码
	public int changeUpwd(String uemail,String upwd) {
		return userDao.changeUpwd(uemail, upwd);
	}
	//更新用户信息
	public int updateBase(String uname,String umotto,String uportrait) {
		return userDao.updateBase(uname, umotto, uportrait);
	}
}

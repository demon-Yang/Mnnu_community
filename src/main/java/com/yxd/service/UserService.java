package com.yxd.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.UserDao;
import com.yxd.entity.User;

@Service
public class UserService {
	@Resource
	private UserDao userDao;
	//邮箱查询用户是否存在
	public int queryByEmail(String uemail) {
		return userDao.queryByEmail(uemail);
	}
	//用户注册
	public int register(User user) {
		 return userDao.register(user);
	}
}

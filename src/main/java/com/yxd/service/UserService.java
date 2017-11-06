package com.yxd.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.UserDao;
import com.yxd.entity.User;

@Service
public class UserService {
	@Resource
	private UserDao userDao;
	
	public int register(User user) {
		 return userDao.register(user);
	}
}

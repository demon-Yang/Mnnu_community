package com.yxd.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.ManagerDao;
import com.yxd.entity.Manager;

@Service
public class ManagerService {
	@Resource
	private ManagerDao managerDao;
	//管理员登录
	public Manager login(String mname,String mpwd) {
		return managerDao.login(mname, mpwd);
	}
}

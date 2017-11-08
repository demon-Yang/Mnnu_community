package com.yxd.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Manager;

@Repository
public interface ManagerDao {
	//管理员登录
	public Manager login(@Param("mname")String mname,@Param("mpwd")String mpwd);
}

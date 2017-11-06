package com.yxd.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.User;

@Repository
public interface UserDao {
	//邮箱查询用户是否存在
	public int queryByEmail(@Param("uemail")String uemail);
	//用户注册
	public int register(@Param("user")User user);
}

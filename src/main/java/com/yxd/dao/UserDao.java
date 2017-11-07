package com.yxd.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.User;

@Repository
public interface UserDao {
	//用户登录
	public User login(@Param("uemail")String uemail,@Param("upwd")String upwd);
	//邮箱查询用户是否存在
	public int queryByEmail(String uemail);
	//查询用户是否存在，存在返回密码
	public String forgetpwd(String uemail);
	//用户注册
	public int register(User user);
	//修改原密码
	public int changeUpwd(@Param("uemail")String uemail,@Param("upwd")String upwd);
}

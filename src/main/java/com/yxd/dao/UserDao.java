package com.yxd.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.User;

@Repository
public interface UserDao {
	public int register(@Param("user")User user);
}

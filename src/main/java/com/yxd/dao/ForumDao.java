package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Forum;

@Repository
public interface ForumDao {
	//编辑新闻
	public int edit(@Param("forum")Forum forum,@Param("uid")int uid);
	//按类型查询 
	public List<Forum> queryByType(@Param("ftype")String ftype);
}

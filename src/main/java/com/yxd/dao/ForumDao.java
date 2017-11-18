package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Forum;
import com.yxd.view.ForumView;

@Repository
public interface ForumDao {
	//编辑新闻
	public int edit(@Param("forum")Forum forum,@Param("uid")int uid);
	//查询类型列表
	public List<ForumView> queryList(@Param("ftype")String ftype);
}

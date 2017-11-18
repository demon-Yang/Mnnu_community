package com.yxd.dao;

import org.springframework.stereotype.Repository;

import com.yxd.entity.Comment;

@Repository
public interface CommentDao {
	//编辑新闻
	public int edit(Comment comment);
}

package com.yxd.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.CommentDao;
import com.yxd.entity.Comment;

@Service
public class CommentService {
	@Resource
	private CommentDao commentDao;
	//编辑新闻
		public int edit(Comment comment) {
			return commentDao.edit(comment);
		}
}

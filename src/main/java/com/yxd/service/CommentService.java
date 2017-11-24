package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.CommentDao;
import com.yxd.entity.Comment;
import com.yxd.view.CommentView;

@Service
public class CommentService {
	@Resource
	private CommentDao commentDao;
		//编辑新闻
		public int edit(Comment comment) {
			return commentDao.edit(comment);
		}
		//按FID查询帖子对应的评论
		public List<CommentView> queryComment(int fid) {
			return commentDao.queryComment(fid);
		}
}

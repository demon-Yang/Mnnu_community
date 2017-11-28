package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.CommentDao;
import com.yxd.entity.Comment;
import com.yxd.view.CommentView;
import com.yxd.view.PCommentView;

@Service
public class CommentService {
	@Resource
	private CommentDao commentDao;
	@Resource
	private ReplyService replyService;
		//编辑新闻
		public int edit(Comment comment) {
			return commentDao.edit(comment);
		}
		//按FID查询帖子对应的评论
		public List<CommentView> queryComment(int fid) {
			return commentDao.queryComment(fid);
		}
		//按CID查询对应的评论
		public List<CommentView> queryOne(int cid) {
			return commentDao.queryOne(cid);
		}
		//根据用户ID查询对应的评论
		public List<PCommentView> queryByUid(int uid){
			return commentDao.queryByUid(uid);
		}
		//根据用户ID查询个人帖子对应的评论
		public List<PCommentView> queryByPuid(int uid){
			return commentDao.queryByPuid(uid);
		}
		//根据CID改变是否未读状态
		public int changeRead(int cid) {
			return commentDao.changeRead(cid);
		}
		//根据用户ID查询未读的评论
		public int queryCread(int uid) {
			if(commentDao.queryCread(uid) == null)
				return 0;
			return Integer.parseInt(commentDao.queryCread(uid));
		}
		//查询未读的总评论和回复
		public int queryRead(int uid) {
			int cread = queryCread(uid);
			int rread = replyService.queryRread(uid);
			return cread+rread;
		}
}

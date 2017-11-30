package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.ForumDao;
import com.yxd.entity.Comment;
import com.yxd.entity.Forum;
import com.yxd.view.CommentView;
import com.yxd.view.ForumView;

@Service
public class ForumService {
	@Resource
	private ForumDao forumDao;
	@Resource
	private CommentService commentService;
	@Resource
	private ReplyService replyService;
		//编辑新闻
		public int edit(Forum forum,int uid) {
			return forumDao.edit(forum,uid);
		}
		//按查找所有帖子
		public List<Forum> queryAll(String ftype){
			return forumDao.queryAll(ftype);
		}
		//按用户查找对应的帖子
		public List<Forum> queryByUid(int uid){
			return forumDao.queryByUid(uid);
		}
		//按类型查询
		public List<ForumView> queryList(String ftype,String serach){
			return forumDao.queryList(ftype,serach);
		}
		//按类型查询
		public List<ForumView> queryKey(String ftype,String serach){
			return forumDao.queryKey(ftype,serach);
		}
		//按FID查询帖子 
		public ForumView queryById(int fid) {
			return forumDao.queryById(fid);
		}
		//按FID查询帖子对应的评论
		public List<CommentView> queryComment(int fid) {
			return commentService.queryComment(fid);
		}
		//按CID查询帖子对应的评论
		public List<CommentView> queryOne(int cid) {
			return commentService.queryOne(cid);
		}
		//查询评论最多的帖子
		public List<ForumView> queryHot(){
			return forumDao.queryHot();
		}
		//根据CID改变未读状态
		public int changeCread(int cid) {
			return commentService.changeRead(cid);
		}
		//根据RID改变未读状态
		public int changeRread(int rid) {
			return replyService.changeRead(rid);
		}
		//根据用户ID查询未读的评论
		public int queryRead(int uid) {
			int cread = commentService.queryCread(uid);
			int rread = replyService.queryRread(uid);
			return cread+rread;
		}
		//按FID查询所有评论的CID
		public List<Integer> queryCid(int fid){
			return forumDao.queryCid(fid);
		}
		//根据FID删除评论
		public int deleteComment(int cid) {
			return commentService.delete(cid);
		}
		//按CID查询删除回复
		public int deleteReply(int cid){
			return replyService.deleteByCid(cid);
		}
		//按FID查找评论
		public Forum findOne(int fid) {
			return forumDao.findOne(fid);
		}
		//根据FID删除回复
		public int delete(int fid) {
			return forumDao.delete(fid);
		}
		//按CID查找评论
		public Comment findComment(int cid) {
			return commentService.findOne(cid);
		}
}

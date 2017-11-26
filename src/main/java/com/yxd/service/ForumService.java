package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.ForumDao;
import com.yxd.entity.Forum;
import com.yxd.view.CommentView;
import com.yxd.view.ForumView;

@Service
public class ForumService {
	@Resource
	private ForumDao forumDao;
	@Resource
	private CommentService commentService;
		//编辑新闻
		public int edit(Forum forum,int uid) {
			return forumDao.edit(forum,uid);
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
		//查询评论最多的帖子
		public List<ForumView> queryHot(){
			return forumDao.queryHot();
		}
}

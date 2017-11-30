package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.ReplyDao;
import com.yxd.entity.Reply;
import com.yxd.view.PReplyView;
import com.yxd.view.ReplyView;

@Service
public class ReplyService {
	@Resource
	private ReplyDao replyDao;
	@Resource
	private CommentService commentService;
		//添加回复
		public int add(Reply reply) {
			return replyDao.add(reply);
		}
		//按CID查询评论对应的回复 
		public List<ReplyView> queryReply(int cid){
			return replyDao.queryReply(cid);
		}
		// 根据用户ID查询对应的回复
		public List<PReplyView> queryByUid(int uid){
			return replyDao.queryByUid(uid);
		}
		//根据用户ID查询个人评论对应的回复 
		public List<PReplyView> queryByPuid(int uid){
			return replyDao.queryByPuid(uid);
		}
		//根据用户ID查询未读的回复 
		public int queryRread(int uid) {
			if(replyDao.queryRread(uid) == null)
				return 0;
			return Integer.parseInt(replyDao.queryRread(uid));
		}
		//根据RID改变是否未读状态
		public int changeRead(int rid) {
			return replyDao.changeRead(rid);
		}
		//查询未读的总评论和回复
		public int queryRead(int uid) {
			int rread = queryRread(uid);
			int cread = commentService.queryCread(uid);
			return rread+cread;
		}
		//根据RID删除回复
		public int delete(int rid) {
			return replyDao.delete(rid);
		}
		//根据CID删除回复
		public int deleteByCid(int cid) {
			return replyDao.deleteByCid(cid);
		}
}

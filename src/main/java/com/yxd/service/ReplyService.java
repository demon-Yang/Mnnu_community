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
}

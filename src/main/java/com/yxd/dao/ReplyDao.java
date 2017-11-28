package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Reply;
import com.yxd.view.PReplyView;
import com.yxd.view.ReplyView;

@Repository
public interface ReplyDao {
	//添加回复
	public int add(Reply reply);
	//按CID查询评论对应的回复 
	public List<ReplyView> queryReply(@Param("cid")int cid);
	// 根据用户ID查询对应的回复
	public List<PReplyView> queryByUid(@Param("uid")int uid);
	//根据用户ID查询个人评论对应的回复 
	public List<PReplyView> queryByPuid(@Param("uid")int uid);
	//根据用户ID查询未读的回复 
	public String queryRread(@Param("uid")int uid);
	//根据RID改变是否未读状态
	public int changeRead(@Param("rid")int rid);
}

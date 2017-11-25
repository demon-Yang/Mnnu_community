package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Reply;
import com.yxd.view.ReplyView;

@Repository
public interface ReplyDao {
	//添加回复
	public int add(Reply reply);
	//按CID查询评论对应的回复 
	public List<ReplyView> queryReply(@Param("cid")int cid);
}

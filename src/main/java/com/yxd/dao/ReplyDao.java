package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.view.ReplyView;

@Repository
public interface ReplyDao {
	//按CID查询评论对应的回复 
	public List<ReplyView> queryReply(@Param("cid")int cid);
}

package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Forum;
import com.yxd.view.CommentView;
import com.yxd.view.ForumView;

@Repository
public interface ForumDao {
	//编辑新闻
	public int edit(@Param("forum")Forum forum,@Param("uid")int uid);
	//查询类型列表
	public List<ForumView> queryList(@Param("ftype")String ftype);
	//按FID查询帖子 
	public ForumView queryById(@Param("fid")int fid);
	//按FID查询帖子对应的评论
	public List<CommentView> queryComment(@Param("fid")int fid);
}

package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Comment;
import com.yxd.view.CommentView;
import com.yxd.view.PCommentView;

@Repository
public interface CommentDao {
	//编辑新闻
	public int edit(Comment comment);
	//按FID查询帖子对应的评论
	public List<CommentView> queryComment(@Param("fid")int fid);
	//按CID查询对应的评论
	public List<CommentView> queryOne(@Param("cid")int cid);
	//根据用户ID查询对应的评论
	public List<PCommentView> queryByUid(@Param("uid")int uid);
	//根据用户ID查询个人帖子对应的评论
	public List<PCommentView> queryByPuid(@Param("uid")int uid);
	//根据CID改变是否未读状态
	public int changeRead(@Param("cid")int cid);
	//根据用户ID查询未读的评论
	public String queryCread(@Param("uid")int uid);
	//按CID查找评论
	public Comment findOne(@Param("cid")int cid);
	//根据CID删除评论
	public int delete(@Param("cid")int cid);
	//根据FID删除评论
	public int deleteByFid(@Param("fid")int fid);
}

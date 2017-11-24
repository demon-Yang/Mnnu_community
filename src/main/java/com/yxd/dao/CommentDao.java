package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Comment;
import com.yxd.view.CommentView;

@Repository
public interface CommentDao {
	//编辑新闻
	public int edit(Comment comment);
	//按FID查询帖子对应的评论
	public List<CommentView> queryComment(@Param("fid")int fid);
}

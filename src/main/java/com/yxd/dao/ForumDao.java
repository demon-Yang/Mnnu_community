package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Forum;
import com.yxd.view.ForumView;

@Repository
public interface ForumDao {
	//编辑新闻
	public int edit(@Param("forum")Forum forum,@Param("uid")int uid);
	//按查找所有帖子
	public List<Forum> queryAll(@Param("ftype")String ftype);
	//按用户查找对应的帖子
	public List<Forum> queryByUid(@Param("uid")int uid);
	//查询类型列表
	public List<ForumView> queryList(@Param("ftype")String ftype,@Param("serach")String serach);
	//按关键字查询类型列表
	public List<ForumView> queryKey(@Param("ftype")String ftype,@Param("serach")String serach);
	//按FID查询帖子 
	public ForumView queryById(@Param("fid")int fid);
	//查询评论最多的帖子
	public List<ForumView> queryHot();
}

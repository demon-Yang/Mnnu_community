package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.ForumDao;
import com.yxd.entity.Forum;
import com.yxd.view.ForumView;

@Service
public class ForumService {
	@Resource
	private ForumDao forumDao;
	//编辑新闻
		public int edit(Forum forum,int uid) {
			return forumDao.edit(forum,uid);
		}
	//按类型查询
		public List<ForumView> queryList(String ftype){
			return forumDao.queryList(ftype);
		}
}

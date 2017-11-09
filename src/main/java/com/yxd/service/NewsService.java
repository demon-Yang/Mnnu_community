package com.yxd.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.NewsDao;
import com.yxd.entity.News;

@Service
public class NewsService {
	@Resource
	private NewsDao newsDao;
	//编辑新闻
	public int edit(News news) {
		return newsDao.edit(news);
	}
	//按ID查找单篇新闻 
	public News findOne(int nid) {
		return newsDao.findOne(nid);
	}
}

package com.yxd.service;

import java.util.List;

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
	//按类型查找新闻 
	public List<News> queryByType(String ntype) {
		return newsDao.queryByType(ntype);
	}
	//多条件查找新闻 
	public List<News> queryByCondition(String ntype,String ntitle,String ndate){
		return newsDao.queryByCondition(ntype, ntitle, ndate);
	}
	//删除新闻
	public int delete(int nid) {
		return newsDao.delete(nid);
	}
}

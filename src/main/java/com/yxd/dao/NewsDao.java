package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.News;

@Repository
public interface NewsDao {
	//编辑新闻
	public int edit(News news);
	//按ID查找单篇新闻 
	public News findOne(@Param("nid")int nid);
	//按类型查找新闻 
	public List<News> queryByType(@Param("ntype")String ntype);
	//多条件查找新闻 
	public List<News> queryByCondition(@Param("ntype")String ntype,@Param("ntitle")String ntitle,@Param("ndate")String ndate);
	//删除新闻
	public int delete(@Param("nid")int nid);
}

package com.yxd.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.yxd.entity.Market;

@Repository
public interface MarketDao {
	//添加商品
	public int add(Market market);
	//查询个人商品
	public List<Market> queryByUid(@Param("uid")int uid);
	//查询单个商品 
	public Market queryByMid(@Param("mid")int mid);
	//查询所有商品
	public List<Market> queryAll(@Param("mtype")String mtype);
	//删除商品
	public int delete(@Param("mid")int mid);
}

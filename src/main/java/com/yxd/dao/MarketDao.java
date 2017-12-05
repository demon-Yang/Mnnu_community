package com.yxd.dao;

import org.springframework.stereotype.Repository;

import com.yxd.entity.Market;

@Repository
public interface MarketDao {
	//添加商品
	public int add(Market market);
}

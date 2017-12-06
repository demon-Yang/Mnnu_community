package com.yxd.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.MarketDao;
import com.yxd.entity.Market;

@Service
public class MarketService {
	@Resource
	private MarketDao marketDao;
	//添加商品
	public int add(Market market) {
		return marketDao.add(market);
	}
	//查询个人商品
	public List<Market> queryByUid(int uid){
		return marketDao.queryByUid(uid);
	}
	//查询单个商品 
	public Market queryByMid(int mid) {
		return marketDao.queryByMid(mid);
	}
	//查询所有商品
	public List<Market> queryAll(String mtype){
		return marketDao.queryAll(mtype);
	}
	//删除商品
	public int delete(int mid) {
		return marketDao.delete(mid);
	}
}

package com.yxd.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yxd.dao.MarketDao;
import com.yxd.entity.Market;

@Service
public class MarketService {
	@Resource
	private MarketDao marketDao;
	public int add(Market market) {
		return marketDao.add(market);
	}
}

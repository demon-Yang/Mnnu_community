package com.yxd.view;

import java.io.Serializable;

import com.yxd.entity.Market;

public class MarketView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Market market;
	private String mimage1;
	private String mimage2;
	private String mimage3;
	private String mimage4;
	public Market getMarket() {
		return market;
	}
	public void setMarket(Market market) {
		this.market = market;
	}
	public String getMimage1() {
		return mimage1;
	}
	public void setMimage1(String mimage1) {
		this.mimage1 = mimage1;
	}
	public String getMimage2() {
		return mimage2;
	}
	public void setMimage2(String mimage2) {
		this.mimage2 = mimage2;
	}
	public String getMimage3() {
		return mimage3;
	}
	public void setMimage3(String mimage3) {
		this.mimage3 = mimage3;
	}
	public String getMimage4() {
		return mimage4;
	}
	public void setMimage4(String mimage4) {
		this.mimage4 = mimage4;
	}
}

package com.yxd.view;

import java.io.Serializable;

import com.yxd.entity.Forum;
import com.yxd.entity.User;

public class ForumView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Forum fList;
	private User uList;
	private int cTotal;
	public Forum getfList() {
		return fList;
	}
	public void setfList(Forum fList) {
		this.fList = fList;
	}
	public User getuList() {
		return uList;
	}
	public void setuList(User uList) {
		this.uList = uList;
	}
	public int getcTotal() {
		return cTotal;
	}
	public void setcTotal(int cTotal) {
		this.cTotal = cTotal;
	}
}

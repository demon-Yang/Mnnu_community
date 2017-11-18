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
}

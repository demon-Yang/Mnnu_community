package com.yxd.view;

import java.io.Serializable;

import com.yxd.entity.Comment;
import com.yxd.entity.User;

public class CommentView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Comment comment;
	private User user;
	private int rtotal;
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getRtotal() {
		return rtotal;
	}
	public void setRtotal(int rtotal) {
		this.rtotal = rtotal;
	}
}

package com.yxd.view;

import java.io.Serializable;
import java.util.List;

import com.yxd.entity.Comment;
import com.yxd.entity.User;

public class CommentView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Comment comment;
	private User user;
	private List<ReplyView> rList;
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
	public List<ReplyView> getrList() {
		return rList;
	}
	public void setrList(List<ReplyView> rList) {
		this.rList = rList;
	}
}

package com.yxd.view;

import java.io.Serializable;

import com.yxd.entity.Comment;

public class PCommentView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Comment comment;
	private String uname;
	private String ftitle;
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
}

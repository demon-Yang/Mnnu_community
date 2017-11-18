package com.yxd.view;

import java.io.Serializable;

import com.yxd.entity.Reply;
import com.yxd.entity.User;

public class ReplyView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Reply reply;
	private User from;
	private User to;
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
	public User getFrom() {
		return from;
	}
	public void setFrom(User from) {
		this.from = from;
	}
	public User getTo() {
		return to;
	}
	public void setTo(User to) {
		this.to = to;
	}
}

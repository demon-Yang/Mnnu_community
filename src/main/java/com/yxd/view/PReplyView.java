package com.yxd.view;

import java.io.Serializable;

import com.yxd.entity.Reply;

public class PReplyView implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String uname;
	private int fid;
	private String ftitle;
	private Reply reply;
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}
}

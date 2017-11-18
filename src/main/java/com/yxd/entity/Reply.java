package com.yxd.entity;

import java.io.Serializable;

public class Reply implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int rid;
	private String rcontent;
	private String rdate;
	private String rread;
	private int cid;
	private int fromid;
	private int toid;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getRread() {
		return rread;
	}
	public void setRread(String rread) {
		this.rread = rread;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getFromid() {
		return fromid;
	}
	public void setFromid(int fromid) {
		this.fromid = fromid;
	}
	public int getToid() {
		return toid;
	}
	public void setToid(int toid) {
		this.toid = toid;
	}
}

package com.yxd.entity;

import java.io.Serializable;

public class Notes implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int nid;
	private String ncontent;
	private String ndate;
	private int uid;
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
}

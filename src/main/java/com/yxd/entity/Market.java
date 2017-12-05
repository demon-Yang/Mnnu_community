package com.yxd.entity;

import java.io.Serializable;

public class Market implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int mid;
	private String mtitle;
	private String mcontact;
	private String mtype;
	private String mimage;
	private String mcontent;
	private String mdate;
	private int uid;
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMcontact() {
		return mcontact;
	}
	public void setMcontact(String mcontact) {
		this.mcontact = mcontact;
	}
	public String getMtype() {
		return mtype;
	}
	public void setMtype(String mtype) {
		this.mtype = mtype;
	}
	public String getMimage() {
		return mimage;
	}
	public void setMimage(String mimage) {
		this.mimage = mimage;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public String getMdate() {
		return mdate;
	}
	public void setMdate(String mdate) {
		this.mdate = mdate;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
}

package com.yxd.entity;

import java.io.Serializable;

public class News implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int nid;
	private String ntitle;
	private String ntype;
	private String ncontent;
	private String ndate;
	private String nimage;
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNtype() {
		return ntype;
	}
	public void setNtype(String ntype) {
		this.ntype = ntype;
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
	public String getNimage() {
		return nimage;
	}
	public void setNimage(String nimage) {
		this.nimage = nimage;
	}
}

package com.yxd.entity;

import java.io.Serializable;

public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int uid;
	private String uemail;
	private String uname;
	private String upwd;
	private String uportrait;
	private String umotto;
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpwd() {
		return upwd;
	}
	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}
	public String getUportrait() {
		return uportrait;
	}
	public void setUportrait(String uportrait) {
		this.uportrait = uportrait;
	}
	public String getUmotto() {
		return umotto;
	}
	public void setUmotto(String umotto) {
		this.umotto = umotto;
	}
}

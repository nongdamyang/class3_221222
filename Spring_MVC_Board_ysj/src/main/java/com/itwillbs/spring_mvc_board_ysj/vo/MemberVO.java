package com.itwillbs.spring_mvc_board_ysj.vo;

import java.sql.*;

public class MemberVO {

	private int idx;
	private String name;
	private String id;
	private String passwd;
	private String email;
	private String email1;
	private String email2;
	private String gender;
	private Date date;
	private String auth_status;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(int idx, String name, String id, String passwd, String email, String gender, Date date,
			String auth_status) {
		super();
		this.idx = idx;
		this.name = name;
		this.id = id;
		this.passwd = passwd;
		this.email = email;
		this.gender = gender;
		this.date = date;
		this.auth_status = auth_status;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAuth_status() {
		return auth_status;
	}

	public void setAuth_status(String auth_status) {
		this.auth_status = auth_status;
	}

// 분리된 이메일 
	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", name=" + name + ", id=" + id + ", passwd=" + passwd + ", email=" + email
				+ ", email1=" + email1 + ", email2=" + email2 + ", gender=" + gender + ", date=" + date
				+ ", auth_status=" + auth_status + "]";
	}
	
	
}













































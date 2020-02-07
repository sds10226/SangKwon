package com.cafe24.sosang.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String name;
	private String tel;
	private String id;
	private String password;
	private String email;
	private Timestamp reg_date;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	@Override
	public String toString() {
		return "MemberDTO [name=" + name + ", tel=" + tel + ", id=" + id + ", password=" + password + ", email=" + email
				+ ", reg_date=" + reg_date + "]";
	}

}

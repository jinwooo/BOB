package com.bob.proj.model.dto;

import java.util.Date;

public class UserBoardDto {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_email;
	private String user_addr;
	private String user_phone;
	private String user_gender;
	private Date user_birth;
	private String user_grade;
	private String user_sns;
	private String user_confirm;
	private String user_img;
	private int cno;
	
	public UserBoardDto() {
	}

	public UserBoardDto(String user_id, String user_pw, String user_name, String user_email, String user_addr,
			String user_phone, String user_gender, Date user_birth, String user_grade, String user_sns,
			String user_confirm, String user_img, int cno) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_addr = user_addr;
		this.user_phone = user_phone;
		this.user_gender = user_gender;
		this.user_birth = user_birth;
		this.user_grade = user_grade;
		this.user_sns = user_sns;
		this.user_confirm = user_confirm;
		this.user_img = user_img;
		this.cno = cno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}

	public String getUser_sns() {
		return user_sns;
	}

	public void setUser_sns(String user_sns) {
		this.user_sns = user_sns;
	}

	public String getUser_confirm() {
		return user_confirm;
	}

	public void setUser_confirm(String user_confirm) {
		this.user_confirm = user_confirm;
	}

	public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}
	
	
	
	
}

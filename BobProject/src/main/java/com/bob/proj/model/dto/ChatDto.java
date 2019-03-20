package com.bob.proj.model.dto;

import java.util.Date;

public class ChatDto {

	private int ch_no;
	private int cr_no;
	private int ch_roomno;
	private int ch_userno;
	private String user_id;
	private String ch_msg;
	private Date ch_time;
	
	public ChatDto() {
	}

	public ChatDto(int ch_no,int cr_no,int ch_roomno, int ch_userno, String user_id, String ch_msg, Date ch_time) {
		super();
		this.ch_no = ch_no;
		this.cr_no = cr_no;
		this.ch_roomno = ch_roomno;
		this.ch_userno = ch_userno;
		this.user_id = user_id;
		this.ch_msg = ch_msg;
		this.ch_time = ch_time;
	}

	public int getCr_no() {
		return cr_no;
	}

	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}

	public int getCh_roomno() {
		return ch_roomno;
	}

	public void setCh_roomno(int ch_roomno) {
		this.ch_roomno = ch_roomno;
	}

	public int getCh_no() {
		return ch_no;
	}

	public void setCh_no(int ch_no) {
		this.ch_no = ch_no;
	}

	public int getCh_userno() {
		return ch_userno;
	}

	public void setCh_userno(int ch_userno) {
		this.ch_userno = ch_userno;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCh_msg() {
		return ch_msg;
	}

	public void setCh_msg(String ch_msg) {
		this.ch_msg = ch_msg;
	}

	public Date getCh_time() {
		return ch_time;
	}

	public void setCh_time(Date ch_time) {
		this.ch_time = ch_time;
	}
	
	
	
}

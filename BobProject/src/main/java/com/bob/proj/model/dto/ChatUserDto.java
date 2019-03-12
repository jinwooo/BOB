package com.bob.proj.model.dto;

public class ChatUserDto {

	private int ch_userno;
	private String user_id;
	private int ch_usercnt;
	
	public ChatUserDto() {
	}

	public ChatUserDto(int ch_userno, String user_id, int ch_usercnt) {
		super();
		this.ch_userno = ch_userno;
		this.user_id = user_id;
		this.ch_usercnt = ch_usercnt;
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

	public int getCh_usercnt() {
		return ch_usercnt;
	}

	public void setCh_usercnt(int ch_usercnt) {
		this.ch_usercnt = ch_usercnt;
	}
	
	
	
}

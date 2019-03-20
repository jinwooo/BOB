package com.bob.proj.model.dto;

public class ChatUserDto {

	private int cr_no;
	private int ch_roomno;
	private String user_id;
	
	public ChatUserDto() {
	}
	
	public ChatUserDto(int cr_no, int ch_roomno, String user_id) {
		super();
		this.cr_no = cr_no;
		this.ch_roomno = ch_roomno;
		this.user_id = user_id;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}

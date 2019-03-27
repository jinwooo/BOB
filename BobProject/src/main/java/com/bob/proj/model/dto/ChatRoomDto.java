package com.bob.proj.model.dto;

public class ChatRoomDto {

	private int ch_roomno;
	private int ch_usercnt;
	
	public ChatRoomDto() {
	}

	public ChatRoomDto(int ch_roomno, int ch_usercnt) {
		super();
		this.ch_roomno = ch_roomno;
		this.ch_usercnt = ch_usercnt;
	}

	public int getCh_roomno() {
		return ch_roomno;
	}

	public void setCh_roomno(int ch_roomno) {
		this.ch_roomno = ch_roomno;
	}

	public int getCh_usercnt() {
		return ch_usercnt;
	}

	public void setCh_usercnt(int ch_usercnt) {
		this.ch_usercnt = ch_usercnt;
	}
	
	
	
}

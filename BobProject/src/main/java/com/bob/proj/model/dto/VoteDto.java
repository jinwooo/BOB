package com.bob.proj.model.dto;

public class VoteDto {

	private int v_no;
	private String v_menu;
	private int v_cnt;
	private String v_img;
	
	public VoteDto() {
	}

	public VoteDto(int v_no, String v_menu, int v_cnt, String v_img) {
		super();
		this.v_no = v_no;
		this.v_menu = v_menu;
		this.v_cnt = v_cnt;
		this.v_img = v_img;
	}

	public int getV_no() {
		return v_no;
	}

	public void setV_no(int v_no) {
		this.v_no = v_no;
	}

	public String getV_menu() {
		return v_menu;
	}

	public void setV_menu(String v_menu) {
		this.v_menu = v_menu;
	}

	public int getV_cnt() {
		return v_cnt;
	}

	public void setV_cnt(int v_cnt) {
		this.v_cnt = v_cnt;
	}

	public String getV_img() {
		return v_img;
	}

	public void setV_img(String v_img) {
		this.v_img = v_img;
	}
	
	
	
}

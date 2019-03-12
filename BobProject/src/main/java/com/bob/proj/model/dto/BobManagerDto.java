package com.bob.proj.model.dto;

import java.util.Date;

public class BobManagerDto {

	private int bm_id;
	private String user_id;
	private Date bm_date;
	private String bm_type;
	private String bm_menu;
	private String bm_kal;
	private String bm_img;
	
	public BobManagerDto() {
	}

	public BobManagerDto(int bm_id, String user_id, Date bm_date, String bm_type, String bm_menu, String bm_kal,
			String bm_img) {
		super();
		this.bm_id = bm_id;
		this.user_id = user_id;
		this.bm_date = bm_date;
		this.bm_type = bm_type;
		this.bm_menu = bm_menu;
		this.bm_kal = bm_kal;
		this.bm_img = bm_img;
	}

	public int getBm_id() {
		return bm_id;
	}

	public void setBm_id(int bm_id) {
		this.bm_id = bm_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getBm_date() {
		return bm_date;
	}

	public void setBm_date(Date bm_date) {
		this.bm_date = bm_date;
	}

	public String getBm_type() {
		return bm_type;
	}

	public void setBm_type(String bm_type) {
		this.bm_type = bm_type;
	}

	public String getBm_menu() {
		return bm_menu;
	}

	public void setBm_menu(String bm_menu) {
		this.bm_menu = bm_menu;
	}

	public String getBm_kal() {
		return bm_kal;
	}

	public void setBm_kal(String bm_kal) {
		this.bm_kal = bm_kal;
	}

	public String getBm_img() {
		return bm_img;
	}

	public void setBm_img(String bm_img) {
		this.bm_img = bm_img;
	}
	
	
	
}

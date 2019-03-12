package com.bob.proj.model.dto;

import java.util.Date;

public class BobDto {

	private int bob_id;
	private String user_id;
	private Date bob_date;
	private String bob_type;
	private String bob_menu;
	private String bob_kal;
	private String bob_img;
	
	public BobDto() {
	}

	public BobDto(int bob_id, String user_id, Date bob_date, String bob_type, String bob_menu, String bob_kal,
			String bob_img) {
		super();
		this.bob_id = bob_id;
		this.user_id = user_id;
		this.bob_date = bob_date;
		this.bob_type = bob_type;
		this.bob_menu = bob_menu;
		this.bob_kal = bob_kal;
		this.bob_img = bob_img;
	}

	public int getBob_id() {
		return bob_id;
	}

	public void setBob_id(int bob_id) {
		this.bob_id = bob_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getBob_date() {
		return bob_date;
	}

	public void setBob_date(Date bob_date) {
		this.bob_date = bob_date;
	}

	public String getBob_type() {
		return bob_type;
	}

	public void setBob_type(String bob_type) {
		this.bob_type = bob_type;
	}

	public String getBob_menu() {
		return bob_menu;
	}

	public void setBob_menu(String bob_menu) {
		this.bob_menu = bob_menu;
	}

	public String getBob_kal() {
		return bob_kal;
	}

	public void setBob_kal(String bob_kal) {
		this.bob_kal = bob_kal;
	}

	public String getBob_img() {
		return bob_img;
	}

	public void setBob_img(String bob_img) {
		this.bob_img = bob_img;
	}
	
	
	
	
}

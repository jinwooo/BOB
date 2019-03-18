package com.bob.proj.model.dto;

import java.util.Date;

public class NoticeDto {

	private int n_no;
	private String user_id;
	private String n_title;
	private String n_content;
	private Date n_date;
	private int n_view;
	
	public NoticeDto() {
	}

	public NoticeDto(int n_no, String user_id, String n_title, String n_content, Date n_date, int n_view) {
		super();
		this.n_no = n_no;
		this.user_id = user_id;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_date = n_date;
		this.n_view = n_view;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public int getN_view() {
		return n_view;
	}

	public void setN_view(int n_view) {
		this.n_view = n_view;
	}
	
	
	
}

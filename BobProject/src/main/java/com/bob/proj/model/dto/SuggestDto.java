package com.bob.proj.model.dto;

import java.util.Date;

public class SuggestDto {

	private int s_no;
	private String user_id;
	private String s_title;
	private String s_content;
	private Date s_date;
	private int s_view;
	private String s_delflag;
	
	public SuggestDto() {
	}

	public SuggestDto(int s_no, String user_id, String s_title, String s_content, Date s_date, int s_view,
			String s_delflag) {
		super();
		this.s_no = s_no;
		this.user_id = user_id;
		this.s_title = s_title;
		this.s_content = s_content;
		this.s_date = s_date;
		this.s_view = s_view;
		this.s_delflag = s_delflag;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getS_title() {
		return s_title;
	}

	public void setS_title(String s_title) {
		this.s_title = s_title;
	}

	public String getS_content() {
		return s_content;
	}

	public void setS_content(String s_content) {
		this.s_content = s_content;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public int getS_view() {
		return s_view;
	}

	public void setS_view(int s_view) {
		this.s_view = s_view;
	}

	public String getS_delflag() {
		return s_delflag;
	}

	public void setS_delflag(String s_delflag) {
		this.s_delflag = s_delflag;
	}
	
	
	
	
}

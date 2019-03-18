package com.bob.proj.model.dto;

import java.util.Date;

public class ScommentDto {

	private int sc_no;
	private int s_no;
	private String user_id;
	private int sc_gno;
	private int sc_gsq;
	private int sc_tap;
	private String sc_content;
	private Date sc_date;
	private String sc_delflag;
	
	public ScommentDto() {
	}

	public ScommentDto(int sc_no, int s_no, String user_id, int sc_gno, int sc_gsq, int sc_tap, String sc_content,
			Date sc_date, String sc_delflag) {
		super();
		this.sc_no = sc_no;
		this.s_no = s_no;
		this.user_id = user_id;
		this.sc_gno = sc_gno;
		this.sc_gsq = sc_gsq;
		this.sc_tap = sc_tap;
		this.sc_content = sc_content;
		this.sc_date = sc_date;
		this.sc_delflag = sc_delflag;
	}

	public int getSc_no() {
		return sc_no;
	}

	public void setSc_no(int sc_no) {
		this.sc_no = sc_no;
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

	public int getSc_gno() {
		return sc_gno;
	}

	public void setSc_gno(int sc_gno) {
		this.sc_gno = sc_gno;
	}

	public int getSc_gsq() {
		return sc_gsq;
	}

	public void setSc_gsq(int sc_gsq) {
		this.sc_gsq = sc_gsq;
	}

	public int getSc_tap() {
		return sc_tap;
	}

	public void setSc_tap(int sc_tap) {
		this.sc_tap = sc_tap;
	}

	public String getSc_content() {
		return sc_content;
	}

	public void setSc_content(String sc_content) {
		this.sc_content = sc_content;
	}

	public Date getSc_date() {
		return sc_date;
	}

	public void setSc_date(Date sc_date) {
		this.sc_date = sc_date;
	}

	public String getSc_delflag() {
		return sc_delflag;
	}

	public void setSc_delflag(String sc_delflag) {
		this.sc_delflag = sc_delflag;
	}
	
	
	
	
}

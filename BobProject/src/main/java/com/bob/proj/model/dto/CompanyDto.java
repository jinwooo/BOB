package com.bob.proj.model.dto;

public class CompanyDto {

	private int cno;
	private String cname;
	private String caddr;
	private String cyn;
	
	public CompanyDto() {
	}
	public CompanyDto(int cno, String cname, String caddr, String cyn) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.caddr = caddr;
		this.cyn = cyn;
	}
	
	
	public String getCaddr() {
		return caddr;
	}
	public void setCaddr(String caddr) {
		this.caddr = caddr;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCyn() {
		return cyn;
	}
	public void setCyn(String cyn) {
		this.cyn = cyn;
	}
	
	
	
}

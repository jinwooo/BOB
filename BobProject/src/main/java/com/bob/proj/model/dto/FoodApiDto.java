package com.bob.proj.model.dto;

public class FoodApiDto {

	private String foodname;
	private String kal;
	private String tan;
	private String dan;
	private String ji;
	
	public FoodApiDto() {
	}

	public FoodApiDto(String foodname, String kal, String tan, String dan, String ji) {
		super();
		this.foodname = foodname;
		this.kal = kal;
		this.tan = tan;
		this.dan = dan;
		this.ji = ji;
	}

	public String getFoodname() {
		return foodname;
	}

	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}

	public String getKal() {
		return kal;
	}

	public void setKal(String kal) {
		this.kal = kal;
	}

	public String getTan() {
		return tan;
	}

	public void setTan(String tan) {
		this.tan = tan;
	}

	public String getDan() {
		return dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}

	public String getJi() {
		return ji;
	}

	public void setJi(String ji) {
		this.ji = ji;
	}
	
	
	
	
}

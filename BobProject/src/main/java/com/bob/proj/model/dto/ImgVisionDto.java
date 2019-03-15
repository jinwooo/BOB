package com.bob.proj.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class ImgVisionDto {

	private String imgname;
	
	public ImgVisionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ImgVisionDto(String imgname) {
		super();
		this.imgname = imgname;

	}
	public String getImgname() {
		return imgname;
	}
	public void setImgname(String imgname) {
		this.imgname = imgname;
	}
		
	
	
}

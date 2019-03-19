package com.bob.dao;

import java.util.List;

import com.bob.proj.dto.BobDto;

public interface BobDao {
	
	String NAMESPACE = "com.bob.mapper.";
	
	public List<BobDto> adminMain();
	public BobDto selectOne(String user_id);
	public int join(BobDto dto);
	public int snsJoin(BobDto dto);
	public BobDto login(String user_id);
	public int confirm(String user_id);
	public BobDto findInfo(String email);
	public int updatePw(String user_id, String user_pw);
	public BobDto idCheck(String dto);
	public int changeInfo(String user_id,String user_pw, String user_name,String user_email,String user_phone,String user_addr);
	public int manageUser(String user_id, String user_grade);

}

package com.bob.proj.model.dao;

import java.util.List;

import com.bob.proj.model.dto.UserBoardDto;

public interface UserBoardDao {
	
	String NAMESPACE = "user.";
	
	public List<UserBoardDto> adminMain();
	public UserBoardDto selectOne(String user_id);
	public int join(UserBoardDto dto);
	public int snsJoin(UserBoardDto dto);
	public int confirm(String user_id);
	public UserBoardDto findInfo(String email);
	public int updatePw(String user_id, String user_pw);
	public int idCheck(String user_id);
	public int changeInfo(UserBoardDto dto);
	public int manageUser(String user_id, String user_grade);
	public UserBoardDto login(String user_id, String user_pw);
	

}

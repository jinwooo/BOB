package com.bob.proj.model.dao;

import java.util.List;

import com.bob.proj.model.dto.UserBoardDto;

public interface UserBoardDao {
	
	String NAMESPACE = "user.";
	
	public List<UserBoardDto> adminMain();
	public UserBoardDto selectOne(String user_id);
	public int join(UserBoardDto dto);
	public int snsJoin(UserBoardDto dto);
	public UserBoardDto findInfo(String email);
	public int idCheck(String user_id);
	public int userUpdade(UserBoardDto dto);
	public UserBoardDto login(String user_id, String user_pw);
	public int transpw(UserBoardDto dto);
	

}

package com.bob.proj.model.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bob.proj.model.dto.UserBoardDto;;

public interface UserBoardBiz {
	
	public List<UserBoardDto> adminMain();
	public UserBoardDto selectOne(String user_id);
	public int join(UserBoardDto dto);
	public int snsJoin(UserBoardDto dto);	
	public UserBoardDto findInfo(String email);	
	public int idCheck(String user_id);
	public int userUpdate(UserBoardDto dto);
	public UserBoardDto login(String user_id, String user_pw);
	public int transpw(UserBoardDto dto);
	
	// 채팅유저목록(같은회사)
	public List<UserBoardDto> chatuser(String user_id);
	// 채팅-식당유저
	public UserBoardDto chatbob(UserBoardDto dto);

}

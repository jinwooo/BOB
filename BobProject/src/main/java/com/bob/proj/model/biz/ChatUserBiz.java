package com.bob.proj.model.biz;

import com.bob.proj.model.dto.ChatUserDto;

public interface ChatUserBiz {

	// 채팅방번호 확인
	public ChatUserDto roomNum(String user_id, String target_id);
	
	public int ChatUserInsert(ChatUserDto dto);
	public int ChatTargetInsert(ChatUserDto dto);
	
}

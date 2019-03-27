package com.bob.proj.model.dao;

import com.bob.proj.model.dto.ChatUserDto;

public interface ChatUserDao {

	String NAMESPACE = "chat.";
	
	public ChatUserDto roomNum(String user_id, String target_id);

	public int ChatUserInsert(ChatUserDto dto);

	public int ChatTargetInsert(ChatUserDto dto);

}

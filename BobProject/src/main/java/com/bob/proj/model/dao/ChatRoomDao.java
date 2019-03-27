package com.bob.proj.model.dao;

import com.bob.proj.model.dto.ChatUserDto;

public interface ChatRoomDao {

	String NAMESPACE = "chat.";
	
	public int RoomInsert(ChatUserDto dto);
}

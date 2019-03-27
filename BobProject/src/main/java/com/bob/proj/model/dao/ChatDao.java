package com.bob.proj.model.dao;

import java.util.List;

import com.bob.proj.model.dto.ChatDto;

public interface ChatDao {

	String NAMESPACE = "chat.";
	
	public List<ChatDto> chatList(int ch_userno);
	public int chatInsert(ChatDto dto);
	
}

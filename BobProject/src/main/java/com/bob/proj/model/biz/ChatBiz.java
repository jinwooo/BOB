package com.bob.proj.model.biz;

import java.util.List;

import com.bob.proj.model.dto.ChatDto;

public interface ChatBiz {

	public List<ChatDto> chatList(int ch_userno);
	public int chatInsert(ChatDto dto);
	
	
}

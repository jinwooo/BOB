package com.bob.proj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.proj.model.dao.ChatDao;
import com.bob.proj.model.dto.ChatDto;

@Service
public class ChatBizImpl implements ChatBiz{

	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatDto> chatList(int ch_userno) {
		return dao.chatList(ch_userno);
	}

	@Override
	public int chatInsert(ChatDto dto) {
		return dao.chatInsert(dto);
	}

}

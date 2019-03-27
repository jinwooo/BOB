package com.bob.proj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.proj.model.dao.ChatRoomDao;
import com.bob.proj.model.dto.ChatRoomDto;
import com.bob.proj.model.dto.ChatUserDto;

@Service
public class ChatRoomBizImpl implements ChatRoomBiz{

	@Autowired
	private ChatRoomDao dao;
	
	@Override
	public List<ChatRoomDto> RoomList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int RoomInsert(ChatUserDto dto) {
		return dao.RoomInsert(dto);
	}

}

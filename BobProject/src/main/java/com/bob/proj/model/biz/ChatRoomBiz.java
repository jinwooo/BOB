package com.bob.proj.model.biz;

import java.util.List;

import com.bob.proj.model.dto.ChatRoomDto;
import com.bob.proj.model.dto.ChatUserDto;

public interface ChatRoomBiz {

	public List<ChatRoomDto> RoomList();
	public int RoomInsert(ChatUserDto dto);
}

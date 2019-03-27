package com.bob.proj.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.proj.model.dao.ChatUserDao;
import com.bob.proj.model.dto.ChatUserDto;

@Service
public class ChatUserBizImpl implements ChatUserBiz{

	@Autowired
	private ChatUserDao dao;
	
	@Override
	public ChatUserDto roomNum(String user_id, String target_id) {
		// TODO Auto-generated method stub
		return dao.roomNum(user_id, target_id);
	}

	@Override
	public int ChatUserInsert(ChatUserDto dto) {
		// TODO Auto-generated method stub
		return dao.ChatUserInsert(dto);
	}

	@Override
	public int ChatTargetInsert(ChatUserDto dto) {
		// TODO Auto-generated method stub
		return dao.ChatTargetInsert(dto);
	}

}

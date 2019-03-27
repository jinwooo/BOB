package com.bob.proj.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.ChatRoomDto;
import com.bob.proj.model.dto.ChatUserDto;

@Repository
public class ChatRoomDaoImpl implements ChatRoomDao{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public int RoomInsert(ChatUserDto dto) {
		
		int res = 0;
		
		try {
			res = sqlsession.insert(NAMESPACE+"RoomInsert", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("채팅방 생성 실패");
		}
		return res;
	}

}

package com.bob.proj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.ChatDto;

@Repository
public class ChatDaoImpl implements ChatDao{

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public List<ChatDto> chatList(int ch_roomno) {
		
		List<ChatDto> list = new ArrayList<>();
		
		list = sqlsession.selectList(NAMESPACE+"chatList", ch_roomno);
		
		return list;
	}

	@Override
	public int chatInsert(ChatDto dto) {
		
		int res = 0;
		
		try {
			res = sqlsession.insert(NAMESPACE+"chatInsert", dto);
			
		} catch (Exception e) {
			System.out.println("chatInsert error");
			e.printStackTrace();
		}
		
		return res;
	}

}

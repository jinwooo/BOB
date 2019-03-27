package com.bob.proj.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.ChatUserDto;

@Repository
public class ChatUserDaoImpl implements ChatUserDao {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public ChatUserDto roomNum(String user_id, String target_id) {
		
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("target_id", target_id);
		
		ChatUserDto res = null;
		
		try {
			res = sqlsession.selectOne(NAMESPACE+"roomNum", map);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("roomNum error");
		}
		return res;
	}

	@Override
	public int ChatUserInsert(ChatUserDto dto) {
		
		int res = 0;
		
		try {
			res = sqlsession.insert(NAMESPACE+"ChatUserInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChatUserInsert error");
		}
		return res;
	}

	@Override
	public int ChatTargetInsert(ChatUserDto dto) {
		
		int res = 0;
		
		try {
			res = sqlsession.insert(NAMESPACE+"ChatTargetInsert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("ChatTargetInsert error");
		}
		return res;
	}
	
	

}

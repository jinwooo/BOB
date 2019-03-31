package com.bob.proj.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bob.proj.model.dto.UserBoardDto;


@Repository
public class UserBoardDaoImpl implements UserBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


	
	@Override
	public List<UserBoardDto> adminMain() {
		
		List<UserBoardDto> list = new ArrayList<UserBoardDto>();
		
//		list = sqlSession.selectList(NAMESPACE+"adminMain");
		
		return list;
	}
	
	@Override
	public UserBoardDto selectOne(String user_id) {
		UserBoardDto dto = new UserBoardDto();
		
		try {
		dto = sqlSession.selectOne(NAMESPACE+"selectOne",user_id);
		}catch(Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int join(UserBoardDto dto) {
		int res = 0;
		
		try {
		res = sqlSession.insert(NAMESPACE+"join",dto);
		}catch (Exception e){
			System.out.println("join error");
			e.printStackTrace();
			
		}
		return res;
	}

	@Override
	public int snsJoin(UserBoardDto dto) {
		int res = 0;
		
		try {
//			res = sqlSession.insert(NAMESPACE+"snsJoin",dto);
		}catch(Exception e) {
			System.out.println("snsJoin error");
			e.printStackTrace();
		}
		
		return res;
	}



	@Override
	public UserBoardDto findInfo(String user_email) {
		UserBoardDto dto = new UserBoardDto();
		
		try {
		dto = sqlSession.selectOne(NAMESPACE+"findinfo",user_email);			
		}catch(Exception e) {
			System.out.println("findInfo error");
			e.printStackTrace();
		}
		
		return dto;
	}



	@Override
	public int idCheck(String user_id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"idCheck", user_id);
		}catch(Exception e) {
			System.out.println("idCheck error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int userUpdade(UserBoardDto dto) {

		return 0;
	}


	@Override
	public UserBoardDto login(String user_id, String user_pw) {
		UserBoardDto user = null;	
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		
		try {
		 user = sqlSession.selectOne(NAMESPACE+"login",map);
		} catch (Exception e) {
			System.out.println("login error");
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public int transpw(UserBoardDto dto) {

		int res = 0;
		try {
		res = sqlSession.update(NAMESPACE + "transpw", dto);
	} catch (Exception e) {
		System.out.println("login error");
		e.printStackTrace();
	}
		
		return res;
	}

	@Override
	public List<UserBoardDto> chatuser(String user_id) {
		
		List<UserBoardDto> list = new ArrayList<>();
		
		list = sqlSession.selectList("chat.ChatUserList", user_id);
		
		return list;
	}

	@Override
	public UserBoardDto chatuser(UserBoardDto dto) {
		
		UserBoardDto res = new UserBoardDto();
		
		res = sqlSession.selectOne("chat.ChatBob", dto);
		
		return res;
	}

	

}

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
	public int confirm(String user_id) {
		int res = 0;
		
		try {
//			res = sqlSession.insert(NAMESPACE+"confirm",user_id);
		}catch(Exception e) {
			System.out.println("confirm error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public UserBoardDto findInfo(String user_email) {
		UserBoardDto dto = new UserBoardDto();
		
		try {
//			dto = sqlSession.selectOne(NAMESPACE+"findInfo",user_email);			
		}catch(Exception e) {
			System.out.println("findInfo error");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int updatePw(String user_id, String user_pw) {
		int res = 0;
		
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		
		try {
//			res = sqlSession.update(NAMESPACE+"updatePw",map);
		}catch(Exception e) {
			System.out.println("update error");
			e.printStackTrace();
		}
	
		
		return res;
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
	public int changeInfo(UserBoardDto dto) {
		int res= 0;
		
		/*Map<String, String> map = new HashMap<String,String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		map.put("user_name", user_name);
		map.put("user_email", user_email);
		map.put("user_phone", user_phone);
		map.put("user_addr", user_addr);
		*/
		try {
//			res = sqlSession.update(NAMESPACE+"login",map);
		}catch(Exception e){
			System.out.println("login error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int manageUser(String user_id, String user_grade) {
		int res = 0;
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("user_id", user_id);
		map.put("user_grade", user_grade);
		
		try {
//			res = sqlSession.selectOne(NAMESPACE+"login",map);
		}catch(Exception e) {
			System.out.println("login error");
			e.printStackTrace();
		}
	
		return res;
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

	

}

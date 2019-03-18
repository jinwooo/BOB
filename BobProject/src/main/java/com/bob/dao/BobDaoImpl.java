package com.bob.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.bob.proj.dto.BobDto;

public class BobDaoImpl implements BobDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BobDto> adminMain() {
		
		List<BobDto> list = new ArrayList<BobDto>();
		
		list = sqlSession.selectList(NAMESPACE+"adminMain");
		
		return list;
	}

	@Override
	public BobDto selectOne(String user_id) {
		BobDto dto = new BobDto();
		
		try {
		dto = sqlSession.selectOne(NAMESPACE+"selectOne",user_id);
		}catch(Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int join(BobDto dto) {
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
	public int snsJoin(BobDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"snsJoin",dto);
		}catch(Exception e) {
			System.out.println("snsJoin error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public BobDto login(String user_id) {
		BobDto dto = new BobDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"login",user_id);
		}catch(Exception e) {
			System.out.println("login error");
			e.printStackTrace();
			
		}
		
		return dto;
	}

	@Override
	public int confirm(String user_id) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"confirm",user_id);
		}catch(Exception e) {
			System.out.println("confirm error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public BobDto findInfo(String user_email) {
		BobDto dto = new BobDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"findInfo",user_email);			
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
			res = sqlSession.update(NAMESPACE+"updatePw",map);
		}catch(Exception e) {
			System.out.println("update error");
			e.printStackTrace();
		}
	
		
		return res;
	}

	@Override
	public BobDto idCheck(String dto) {
		BobDto res = new BobDto();
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"idCheck",dto);
		}catch(Exception e) {
			System.out.println("idCheck error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int changeInfo(String user_id, String user_pw, String user_name, String user_email, String user_phone, String user_addr) {
		int res= 0;
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("user_id", user_id);
		map.put("user_pw", user_pw);
		map.put("user_name", user_name);
		map.put("user_email", user_email);
		map.put("user_phone", user_phone);
		map.put("user_addr", user_addr);
		
		try {
			res = sqlSession.update(NAMESPACE+"login",map);
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
			res = sqlSession.selectOne(NAMESPACE+"login",map);
		}catch(Exception e) {
			System.out.println("login error");
			e.printStackTrace();
		}
	
		return res;
	}

}

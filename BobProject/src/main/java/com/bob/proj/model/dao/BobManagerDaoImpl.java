package com.bob.proj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.BobManagerDto;

@Repository
public class BobManagerDaoImpl implements BobManagerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BobManagerDto> selectList(String user_id) {
		List<BobManagerDto> list = new ArrayList<BobManagerDto>();
		System.out.println("NAMESPACE : " + NAMESPACE);
		list = sqlSession.selectList(NAMESPACE+"selectList",user_id);
		
		return list;
	}


}

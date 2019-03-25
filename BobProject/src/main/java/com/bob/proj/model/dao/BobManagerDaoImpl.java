package com.bob.proj.model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.BobManagerDto;

@Repository
public class BobManagerDaoImpl implements BobManagerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BobManagerDto> selectList(String user_id, String bm_date) {
		List<BobManagerDto> list = new ArrayList<BobManagerDto>();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id", user_id);
		map.put("bm_date", bm_date);
	
		System.out.println("NAMESPACE : " + NAMESPACE);
		
		list = sqlSession.selectList(NAMESPACE+"selectList", map);

		return list;
	}


}

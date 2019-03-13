package com.bob.proj.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<NoticeDto> selectList() {
		
		List<NoticeDto> list = new ArrayList<NoticeDto>();
		
		list = sqlSession.selectList(NAMESPACE+"selectList");
		
		return list;
	}

	@Override
	public NoticeDto selectOne(String user_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(NoticeDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(NoticeDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

}

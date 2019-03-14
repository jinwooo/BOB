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
		
		List<NoticeDto> notice_list = new ArrayList<NoticeDto>();
		
		notice_list = sqlSession.selectList(NAMESPACE+"selectList");
		
		return notice_list;
	}

	@Override
	public NoticeDto selectOne(int n_no) {
		
		NoticeDto dto = new NoticeDto();
		
		dto=sqlSession.selectOne(NAMESPACE+"selectone",n_no);
		
		return dto;
	}

	@Override
	public int insert(NoticeDto dto) {
		int res = 0 ;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			System.out.println("insert error");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int update(NoticeDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			System.out.println("update error");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int n_no) {
		int res = 0 ;
		
		try {
			res = sqlSession.update(NAMESPACE+"delete",n_no);
		} catch (Exception e) {
			System.out.println("delete error");
			e.printStackTrace();
		}
		
		return res;
	}

}

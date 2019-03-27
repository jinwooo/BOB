package com.bob.proj.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.Criteria;
import com.bob.proj.model.dto.SearchCriteria;
import com.bob.proj.model.dto.s_BoardDto;

@Repository
public class s_BoardDaoImpl implements s_BoardDao {
	
	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "s_boardMapper";
	
	@Override
	public void write(s_BoardDto dto) throws Exception {
		sql.insert(namespace+".write",dto);
		
	}

	@Override
	public s_BoardDto read(int bno) throws Exception {
		s_BoardDto res = sql.selectOne(namespace + ".read", bno);
		
		return res;
	}

	@Override
	public void update(s_BoardDto dto) throws Exception {
		
		sql.update(namespace + ".update", dto);
		
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
		
	}

	@Override
	public List<s_BoardDto> list() throws Exception {
		// TODO Auto-generated method stub
		return sql.selectList(namespace+".list");
	}

	@Override
	public List<s_BoardDto> listPage(Criteria cri) throws Exception {
		return sql.selectList(namespace+".listPage",cri);
	}

	@Override
	public int listCount() throws Exception {
		return sql.selectOne(namespace+".listCount");
	}

	@Override
	public List<s_BoardDto> listSearch(SearchCriteria scri) throws Exception {
		List<s_BoardDto> res = sql.selectList(namespace+".listSearch",scri);
		
		return res;
	}

	@Override
	public int countSearch(SearchCriteria srci) throws Exception {
		return sql.selectOne(namespace+".countSearch",srci);
	}

}

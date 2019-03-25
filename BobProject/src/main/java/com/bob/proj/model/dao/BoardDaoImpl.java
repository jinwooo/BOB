package com.bob.proj.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.BoardDto;
import com.bob.proj.model.dto.Criteria;
import com.bob.proj.model.dto.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao {

	//마이바티스
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "boardMapper";
	
	@Override
	public void write(BoardDto dto) throws Exception {
		sql.insert(namespace+".write",dto);
		
	}

	@Override
	public BoardDto read(int bno) throws Exception {
		
		BoardDto res = sql.selectOne(namespace + ".read", bno);
		
		return res;
	}

	@Override
	public void update(BoardDto dto) throws Exception {
		sql.update(namespace + ".update", dto);
		
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);

	}

	@Override
	public List<BoardDto> list() throws Exception {
	
		
		return sql.selectList(namespace+".list");
	}

	@Override
	public List<BoardDto> listPage(Criteria cri) throws Exception {
		
		
		
		return sql.selectList(namespace+".listPage",cri);
	}

	@Override
	public int listCount() throws Exception {
		return sql.selectOne(namespace+".listCount");
	}

	//목록 페이징 검색
	@Override
	public List<BoardDto> listSearch(SearchCriteria scri) throws Exception {
		
		List<BoardDto> res = sql.selectList(namespace+".listSearch",scri);
	
		return res;
	}

	//검색 결과 갯수
	@Override
	public int countSearch(SearchCriteria srci) throws Exception {
		return sql.selectOne(namespace+".countSearch",srci);
	}

}

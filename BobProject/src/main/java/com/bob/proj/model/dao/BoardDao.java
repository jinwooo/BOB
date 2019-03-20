package com.bob.proj.model.dao;

import java.util.List;

import com.bob.proj.model.dto.BoardDto;
import com.bob.proj.model.dto.Criteria;
import com.bob.proj.model.dto.SearchCriteria;

public interface BoardDao {
	
	//작성
	public void write(BoardDto dto) throws Exception;
	
	//조회
	public BoardDto read(int bno) throws Exception;
	
	//수정
	public void update(BoardDto dto) throws Exception;
	
	//삭제
	public void delete(int bno) throws Exception;
	
	//목록
	public List<BoardDto> list() throws Exception;
	
	//목록 + 페이징
	public List<BoardDto> listPage(Criteria cri) throws Exception;
	
	//게시물 총 갯수
	public int listCount() throws Exception;
	
	//목록 + 페이징 + 검색
	public List<BoardDto> listSearch(SearchCriteria scri) throws Exception;
	
	//검색 결과 갯수
	public int countSearch(SearchCriteria srci) throws Exception;
}

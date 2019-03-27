package com.bob.proj.model.dao;

import java.util.List;

import com.bob.proj.model.dto.Criteria;
import com.bob.proj.model.dto.SearchCriteria;
import com.bob.proj.model.dto.s_BoardDto;


public interface s_BoardDao {

	//작성
		public void write(s_BoardDto dto) throws Exception;
		
		//조회
		public s_BoardDto read(int bno) throws Exception;
		
		//수정
		public void update(s_BoardDto dto) throws Exception;
		
		//삭제
		public void delete(int bno) throws Exception;
		
		//목록
		public List<s_BoardDto> list() throws Exception;
		
		//목록 + 페이징
		public List<s_BoardDto> listPage(Criteria cri) throws Exception;
		
		//게시물 총 갯수
		public int listCount() throws Exception;
		
		//목록 + 페이징 + 검색
		public List<s_BoardDto> listSearch(SearchCriteria scri) throws Exception;
		
		//검색 결과 갯수
		public int countSearch(SearchCriteria srci) throws Exception;
}

package com.bob.proj.model.biz;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bob.proj.model.dao.BoardDao;
import com.bob.proj.model.dto.BoardDto;
import com.bob.proj.model.dto.Criteria;
import com.bob.proj.model.dto.ReplyDto;
import com.bob.proj.model.dto.SearchCriteria;

@Repository
public class BoardBizImpl implements BoardBiz {

	@Inject
	private BoardDao dao;
	
	@Override
	public void write(BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		dao.write(dto);
	}

	@Override
	public BoardDto read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public void update(BoardDto dto) throws Exception {
		dao.update(dto);
		
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BoardDto> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<BoardDto> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public List<BoardDto> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}

	@Override
	public int countSearch(SearchCriteria srci) throws Exception {
		return dao.countSearch(srci);
	}
	
	
}

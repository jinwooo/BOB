package com.bob.proj.model.biz;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bob.proj.model.dao.s_BoardDao;
import com.bob.proj.model.dto.Criteria;
import com.bob.proj.model.dto.SearchCriteria;
import com.bob.proj.model.dto.s_BoardDto;

@Repository
public class s_BoardBizImpl implements s_BoardBiz {

	@Inject
	private s_BoardDao dao;
	
	@Override
	public void write(s_BoardDto dto) throws Exception {
		// TODO Auto-generated method stub
		dao.write(dto);
	}

	@Override
	public s_BoardDto read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public void update(s_BoardDto dto) throws Exception {
		
		dao.update(dto);
		
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<s_BoardDto> list() throws Exception {
		return dao.list();
	}

	@Override
	public List<s_BoardDto> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}

	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}

	@Override
	public List<s_BoardDto> listSearch(SearchCriteria scri) throws Exception {
		return dao.listSearch(scri);
	}

	@Override
	public int countSearch(SearchCriteria srci) throws Exception {
		return dao.countSearch(srci);
	}

}

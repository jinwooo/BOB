package com.bob.proj.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bob.proj.model.dao.NoticeDao;
import com.bob.proj.model.dto.NoticeDto;

@Service
public class NoticeBizImpl implements NoticeBiz {

	@Autowired
	private NoticeDao dao;
	
	@Override
	public List<NoticeDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public NoticeDto selectOne(int n_no) {
		// TODO Auto-generated method stub
		return dao.selectOne(n_no);
	}

	@Override
	public int insert(NoticeDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public int update(NoticeDto dto) {
		// TODO Auto-generated method stub
		return dao.update(dto);
	}

	@Override
	public int delete(int n_no) {
		// TODO Auto-generated method stub
		return dao.delete(n_no);
	}

}

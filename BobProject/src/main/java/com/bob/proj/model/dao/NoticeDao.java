package com.bob.proj.model.dao;

import java.util.List;

import com.bob.proj.model.dto.NoticeDto;

public interface NoticeDao {

	String NAMESPACE = "bob.";
	
	public List<NoticeDto> selectList();
	public NoticeDto selectOne(int n_no);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(int n_no);
}

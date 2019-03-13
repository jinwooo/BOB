package com.bob.proj.model.biz;

import java.util.List;

import com.bob.proj.model.dto.NoticeDto;

public interface NoticeBiz {

	
	public List<NoticeDto> selectList();
	public NoticeDto selectOne(String user_id);
	public int insert(NoticeDto dto);
	public int update(NoticeDto dto);
	public int delete(String user_id);
}

package com.bob.proj.model.biz;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bob.proj.model.dao.s_ReplyDao;
import com.bob.proj.model.dto.s_ReplyDto;


@Repository
public class s_ReplyBizImpl implements s_ReplyBiz{

	@Inject
	private s_ReplyDao dao;
	
	//댓글조회
	@Override
	public List<s_ReplyDto> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(s_ReplyDto dto) throws Exception {
		dao.writeReply(dto);		
	}

	@Override
	public s_ReplyDto readReplySelect(int rno) throws Exception {
		return dao.readReplySelect(rno);
	}

	@Override
	public void replyUpdate(s_ReplyDto dto) throws Exception {
		dao.replyUpdate(dto);
		
	}

	@Override
	public void replyDelete(s_ReplyDto dto) throws Exception {
		dao.replyDelete(dto);
		
	}

}

package com.bob.proj.model.biz;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.bob.proj.model.dao.ReplyDao;
import com.bob.proj.model.dto.ReplyDto;

@Repository
public class ReplyBizImpl implements ReplyBiz {
	
	@Inject
	private ReplyDao dao;
	
	//댓글조회
	@Override
	public List<ReplyDto> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyDto dto) throws Exception {
		dao.writeReply(dto);		
	}

	@Override
	public ReplyDto readReplySelect(int rno) throws Exception {
		return dao.readReplySelect(rno);
	}

	@Override
	public void replyUpdate(ReplyDto dto) throws Exception {
		dao.replyUpdate(dto);
		
	}

	@Override
	public void replyDelete(ReplyDto dto) throws Exception {
		dao.replyDelete(dto);
		
	}

}

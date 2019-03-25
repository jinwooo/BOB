package com.bob.proj.model.biz;

import java.util.List;

import com.bob.proj.model.dto.ReplyDto;

public interface ReplyBiz {

	//댓글조회
	public List<ReplyDto> readReply(int bno) throws Exception;
	
	//댓글 작성
	public void writeReply(ReplyDto dto) throws Exception;
	
	//특정 댓글 조회
	public ReplyDto readReplySelect(int rno) throws Exception;
		
	//댓글 수정
	public void replyUpdate(ReplyDto dto) throws Exception;
		
	//댓글 삭제
	public void replyDelete(ReplyDto dto) throws Exception;
}

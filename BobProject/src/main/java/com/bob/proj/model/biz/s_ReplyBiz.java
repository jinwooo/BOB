package com.bob.proj.model.biz;

import java.util.List;

import com.bob.proj.model.dto.s_ReplyDto;


public interface s_ReplyBiz {

	//댓글조회
		public List<s_ReplyDto> readReply(int bno) throws Exception;
		
		//댓글 작성
		public void writeReply(s_ReplyDto dto) throws Exception;
		
		//특정 댓글 조회
		public s_ReplyDto readReplySelect(int rno) throws Exception;
			
		//댓글 수정
		public void replyUpdate(s_ReplyDto dto) throws Exception;
			
		//댓글 삭제
		public void replyDelete(s_ReplyDto dto) throws Exception;
}

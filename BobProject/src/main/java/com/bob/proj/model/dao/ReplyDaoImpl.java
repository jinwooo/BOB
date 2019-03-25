package com.bob.proj.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bob.proj.model.dto.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	//마이바티스
	@Inject
	private SqlSession sql;
	
	private static String namespace = "replyMapper";
	
	//댓글 조회
	@Override
	public List<ReplyDto> readReply(int bno) throws Exception {
		return sql.selectList(namespace+".readReply",bno);
	}

	//댓글 작성
	@Override
	public void writeReply(ReplyDto dto) throws Exception {
		sql.insert(namespace+".writeReply",dto);
	}

	//특정 댓글조회 
	@Override
	public ReplyDto readReplySelect(int rno) throws Exception {
		return sql.selectOne(namespace+".readReplySelect",rno);
	}

	//댓글 수정
	@Override
	public void replyUpdate(ReplyDto dto) throws Exception {
		sql.update(namespace+".updateReply",dto);
		
	}

	@Override
	public void replyDelete(ReplyDto dto) throws Exception {
		sql.delete(namespace+".deleteReply",dto);
		
	}

}

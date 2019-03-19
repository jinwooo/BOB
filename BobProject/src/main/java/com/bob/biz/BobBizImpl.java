package com.bob.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.bob.dao.BobDao;
import com.bob.proj.dto.BobDto;

public class BobBizImpl implements BobBiz {

	@Autowired
	private BobDao dao;
	
	@Override
	public List<BobDto> adminMain() {
		return dao.adminMain();
	}

	@Override
	public BobDto selectOne(String user_id) {
		return dao.selectOne(user_id);
	}

	@Override
	public int join(BobDto dto) {
		return dao.join(dto);
	}

	@Override
	public int snsJoin(BobDto dto) {
		return dao.snsJoin(dto);
	}

	@Override
	public BobDto login(String user_id) {
		return dao.login(user_id);
	}

	@Override
	public int confirm(String user_id) {
		return dao.confirm(user_id);
	}

	@Override
	public BobDto findInfo(String email) {
		return dao.findInfo(email);
	}

	@Override
	public int updatePw(String user_id, String user_pw) {
		return dao.updatePw(user_id, user_pw);
	}

	@Override
	public BobDto idCheck(String dto) {
		return dao.idCheck(dto);
	}

	@Override
	public int changeInfo(String user_id, String user_pw, String user_name, String user_email, String user_phone,
			String user_addr) {
		return dao.changeInfo(user_id, user_pw, user_name, user_email, user_phone, user_addr);
	}

	
	@Override
	public int manageUser(String user_id, String user_grade) {

		return dao.manageUser(user_id, user_grade);
	}

}

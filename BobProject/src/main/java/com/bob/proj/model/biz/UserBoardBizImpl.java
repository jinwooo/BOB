package com.bob.proj.model.biz;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.bob.proj.model.dao.UserBoardDao;
import com.bob.proj.model.dto.UserBoardDto;

@Service
public class UserBoardBizImpl implements UserBoardBiz {
	
	@Autowired(required=true)
	private BCryptPasswordEncoder passwordEncoder;

	
	@Autowired
	private UserBoardDao UserBoardDao;
	
	@Override
	public List<UserBoardDto> adminMain() {
		return UserBoardDao.adminMain();
	}

	@Override
	public UserBoardDto selectOne(String user_id) {
		return UserBoardDao.selectOne(user_id);
	}

	@Override
	public int join(UserBoardDto dto) {
		String encPassword = passwordEncoder.encode(dto.getUser_pw());
		 dto.setUser_pw(encPassword);
		
		return UserBoardDao.join(dto);
	}

	@Override
	public int snsJoin(UserBoardDto dto) {
		return UserBoardDao.snsJoin(dto);
	}


	@Override
	public int confirm(String user_id) {
		return UserBoardDao.confirm(user_id);
	}

	@Override
	public UserBoardDto findInfo(String email) {
		return UserBoardDao.findInfo(email);
	}

	@Override
	public int updatePw(String user_id, String user_pw) {
		return UserBoardDao.updatePw(user_id, user_pw);
	}

	@Override
	public int idCheck(String user_id) {
		return UserBoardDao.idCheck(user_id);
	}

	@Override
	public int changeInfo(UserBoardDto dto) {
		return UserBoardDao.changeInfo(dto);
	}

	
	@Override
	public int manageUser(String user_id, String user_grade) {

		return UserBoardDao.manageUser(user_id, user_grade);
	}

	@Override
	public UserBoardDto login(String user_id, String user_pw) {
		String pw = UserBoardDao.selectOne(user_id).getUser_pw();
		  System.out.println("암호화 비밀번호"+pw);
		  String rawPw = user_pw;
		  System.out.println("비밀번호"+rawPw);
		  if(passwordEncoder.matches(rawPw, pw)) {
			  System.out.println("비밀번호 일치");
			  return UserBoardDao.login(user_id, pw);
		  }else {
			  System.out.println("비밀번호 불일치");   
			  return null;
		  }  
		
		
	}




}

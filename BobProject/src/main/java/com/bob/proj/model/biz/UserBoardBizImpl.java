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
	public UserBoardDto findInfo(String email) {
		UserBoardDto dto = UserBoardDao.findInfo(email);
		
		if(dto != null) {		
			System.out.println("성공");
			return dto;			
		}else {
			System.out.println("실패");
			return null;
		}
		
		
	}



	@Override
	public int idCheck(String user_id) {
		return UserBoardDao.idCheck(user_id);
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

	@Override
	public int userUpdate(UserBoardDto dto) {
		return 0;
	}

	@Override
	public int transpw(UserBoardDto dto) {
		
		UserBoardDto user = UserBoardDao.selectOne(dto.getUser_id());
		String encPassword = passwordEncoder.encode(dto.getUser_pw());
		user.setUser_pw(encPassword);	
		
		return UserBoardDao.transpw(user);
	}

	@Override
	public List<UserBoardDto> chatuser(String user_id) {
		// TODO Auto-generated method stub
		return UserBoardDao.chatuser(user_id);
	}

	@Override
	public UserBoardDto chatbob(UserBoardDto dto) {
		// TODO Auto-generated method stub
		return UserBoardDao.chatuser(dto);
	}

}

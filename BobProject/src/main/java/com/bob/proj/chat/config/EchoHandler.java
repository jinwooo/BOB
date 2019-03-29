package com.bob.proj.chat.config;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bob.proj.model.dao.ChatDao;
import com.bob.proj.model.dto.ChatDto;

public class EchoHandler extends TextWebSocketHandler {

	SqlSession sqlsession;

	@Inject
	private ChatDao dao;

	private List<WebSocketSession> sessionList = new ArrayList<>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);

	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// httpsession -> websocketsession
//		Map<String, Object> map = session.getAttributes();
//		String user_id = (String) map.get("user_id");
//		System.out.println("로그인 한 아이디 : " + user_id);
//		System.out.println(user_id + " : " + message.getPayload());

		// message json으로 변환
		ChatDto convertMsg = ChatDto.convertMessage(message.getPayload());

		String user_id = convertMsg.getUser_id();
		int ch_roomno = convertMsg.getCh_roomno();
		String ch_msg = convertMsg.getCh_msg();

		ChatDto chatdto = new ChatDto();
		chatdto.setUser_id(user_id);
		chatdto.setCh_roomno(ch_roomno);
		chatdto.setCh_msg(ch_msg);

		// message 보내기
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(user_id + "|" + ch_msg));
		}

		// message DB insert
		if (chatdto != null) {
			dao.chatInsert(chatdto);
		}
	}
}

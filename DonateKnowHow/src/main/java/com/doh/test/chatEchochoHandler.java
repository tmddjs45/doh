package com.doh.test;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.*;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.doh.domain.MemberDTO;

public class chatEchochoHandler extends TextWebSocketHandler {
	List<WebSocketSession> sessions = new ArrayList<>();
	@Override
	 public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		 System.out.println("afterafterConnectionEstablished : "+session);
		 sessions.add(session);
	 }
	@Override
	 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		System.out.println("##여기 들어옴??"+message);
		for (WebSocketSession sess: sessions) {
			sess.sendMessage(new TextMessage(message.getPayload()));
			 System.out.println("####handlerText message" +session+" : "+message.getPayload());
		}
		 System.out.println("handlerText## message" +session+" : "+message);
	 }

	@Override 
	 public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessions.remove(session);
		 System.out.println("afterConnectionClosed "+session+" : "+status);
		 
	 }
	




}

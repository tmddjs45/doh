package com.doh.domain;

import lombok.Data;

@Data
public class EmailDTO {
	private String senderNickname;//발신자 닉네임
	private String senderMail; //발신자 이메일
	private String receiveMail; //수신자 이메일
	private String subject; //제목
	private String message; //내용
}

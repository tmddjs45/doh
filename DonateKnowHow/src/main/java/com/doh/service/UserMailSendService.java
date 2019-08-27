package com.doh.service;

import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.doh.domain.MemberVO;
import com.doh.mapper.MemberMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserMailSendService {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberMapper mapper;
	
	
	private boolean lowerCheck;
	private int size;
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
 
	public void mailSendWithUserKey(String email, HttpServletRequest request) {
		MemberVO member = new MemberVO();
		String key = getKey(false, 20);
		member.setEmail(email);
		member.setConfirm_key(key);
		mapper.confirm_key_alter(member);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>D'oh 비빌번호 찾기</h2><br></br>"
				+"다음 하이퍼링크를 눌러 방문하시면 비밀번호를 다시 설정하실 수 있습니다.<br><br>"
				+"<p><a style='font-size:30px;' href='http://localhost:8080/alter_password?key="+key+"&email="+email+"'> Donate Know How </a></p>";
		
		try {
			mail.setSubject("[D'oh] 비빌번호 찾기 이메일입니다.","utf-8");
			mail.setText(htmlStr,"utf-8","html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		}catch(Exception e){
			
		}
	}
}

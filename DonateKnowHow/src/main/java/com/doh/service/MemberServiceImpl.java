package com.doh.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.doh.domain.MemberVO;
import com.doh.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	private static BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
	
	@Override
	public void signup(MemberVO vo) {
		vo.setPassword(bcrypt.encode(vo.getPassword())); //Encode
		log.info("## Service: "+vo);
		mapper.signup(vo);
		mapper.signup_auth(vo.getEmail());
	}

	@Override
	public MemberVO checkemail(String email) {
		MemberVO member = mapper.searchMember(email);
		return member;
	}

	@Override
	public MemberVO checknickname(String nickname) {
		MemberVO member = mapper.checknickname(nickname);
		return member;
	}

}

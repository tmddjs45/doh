package com.doh.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doh.domain.MemberDTO;
import com.doh.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.java.Log;

@Log
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public MemberDTO login(String email, String pwd) {	
			MemberDTO member = mapper.searchMember(email);
			
			if(member.getPassword().equals(pwd)) {
				log.info(" # Access ----");
				member.setPassword("");
				return member;
			}else {
				log.info("# Not Access ----");
				return null;
			}
	}

	@Override
	public void signup(MemberDTO dto) {
		mapper.signup(dto);
	}

	@Override
	public MemberDTO checkemail(String email) {
		MemberDTO member = mapper.searchMember(email);
		return member;
	}

}

package com.doh.service;

import com.doh.domain.MemberDTO;

public interface MemberService {
	
	MemberDTO login(String email, String pwd);
	void signup(MemberDTO dto);
	MemberDTO checkemail(String email);
}

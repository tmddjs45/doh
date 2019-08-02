package com.doh.service;


import com.doh.domain.MemberVO;

public interface MemberService {
	
	void signup(MemberVO vo);
	MemberVO checkemail(String email);
	MemberVO checknickname(String nickname);
}

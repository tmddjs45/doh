package com.doh.mapper;


import com.doh.domain.MemberVO;

public interface MemberMapper {

	MemberVO read(String email); //login
	
	void signup(MemberVO vo); //sign up
	void signup_auth(String email);
	MemberVO searchMember(String email);
	MemberVO checknickname(String nickname);
	
}

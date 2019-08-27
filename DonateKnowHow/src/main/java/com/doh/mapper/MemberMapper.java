package com.doh.mapper;


import java.util.ArrayList;


import com.doh.domain.MemberVO;

public interface MemberMapper {

	MemberVO read(String email); //login
	void signup(MemberVO vo); //sign up
	void signup_auth(String email);
	MemberVO searchMember(String email);
	MemberVO checknickname(String nickname);
	ArrayList boardcount(int m_no);
	ArrayList replycount(int m_no);
	int answercount(int m_no);
	void profile_update(MemberVO member);
	void confirm_key_alter(MemberVO member);
	void alter_password(MemberVO member);
	
}

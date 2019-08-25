package com.doh.service;


import java.util.ArrayList;

import com.doh.domain.MemberVO;

public interface MemberService {
	
	void signup(MemberVO vo);
	MemberVO checkemail(String email);
	MemberVO checknickname(String nickname);
	ArrayList countinfo(int m_no);
	boolean profile_update(String nickname, String password, String currentPassword);
}

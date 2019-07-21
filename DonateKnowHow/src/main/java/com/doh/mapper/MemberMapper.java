package com.doh.mapper;

import com.doh.domain.MemberDTO;

public interface MemberMapper {
	MemberDTO searchMember(String email);
	void signup(MemberDTO dto);
	MemberDTO checknickname(String nickname);
}

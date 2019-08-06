package com.doh.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private int m_no;
	private String email;
	private String nickname;
	private String password;
	private boolean enabled;
	private Date jdate;
	
	private List<AuthVO> authList;

}

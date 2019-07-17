package com.doh.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDTO {
	
	private int m_no;
	private String email;
	private String nickname;
	private String password;
	private byte authority;
	private Date jdate;

}

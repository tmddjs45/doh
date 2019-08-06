package com.doh.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class FBoardDTO {
	private int f_no;
	private String f_title;
	private String f_content;
	private Date f_rdate;
	private int f_readnum;
	private int m_no;
	private int fc_count;
	
	private String nickname;	//mysql 조인해서 member 테이블의 nickname을 가져오기 위해서 추가했습니다!
}

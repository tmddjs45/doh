package com.doh.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QReplyVO {
	private int q_no;	// 글번호
	private int a_no;	// 댓글번호
	private int m_no;	// 맴버번호
	
	private String nickname;
	private String email;
	private String a_content;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date a_rdate;
	private int a_check;
}

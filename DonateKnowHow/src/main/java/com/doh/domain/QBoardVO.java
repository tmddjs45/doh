package com.doh.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QBoardVO {
	private int q_no;
	private int m_no;
	private String nickname;
	private String email;
	private String q_title;
	private String q_content;
	private Date q_rdate;
	private int q_count;
}

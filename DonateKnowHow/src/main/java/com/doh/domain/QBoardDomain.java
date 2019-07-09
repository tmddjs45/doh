package com.doh.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QBoardDomain {
	private int qno;
	private int m_seq;
	private String nicname;
	private String email;
	private String q_title;
	private String q_content;
	private Date q_date;
	private int q_count;
}

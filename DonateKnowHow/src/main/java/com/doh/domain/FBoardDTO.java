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
}

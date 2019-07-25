package com.doh.domain;

import java.sql.Date;

import lombok.Data;


@Data
public class CBoardDTO {
	private int c_no;
	private int m_no;
	private String c_title;
	private String c_content;
	private Date c_rdate;
	

}

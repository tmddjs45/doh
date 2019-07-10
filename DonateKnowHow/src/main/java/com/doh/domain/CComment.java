package com.doh.domain;
import java.util.Date;

import lombok.Data;

@Data
public class CComment {
	private int cr_no;
	private int c_no;
	private int m_no;
	private String cr_content;
	private Date cr_rdate;

}

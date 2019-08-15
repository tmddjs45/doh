package com.doh.domain;

import lombok.Data;

@Data
public class FCommentDTO {
	private int fc_no;
	private String fc_content;
	private String fc_rdate;
	private String fc_udate;
	private int m_no;
	private int f_no;
	
	private String nickname;
}

package com.doh.domain;

import lombok.Data;

@Data
public class LectureDTO {
	private int lecture_no;
	private String lecture_title;
	private String lecture_content;
	private String lecture_code;
	private String lecture_name;
}

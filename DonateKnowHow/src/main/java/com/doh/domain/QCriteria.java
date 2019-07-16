package com.doh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QCriteria {
	private int page = 0;
	private int pageNum = 10;
	
	private int pageStart = 1;
	private int pageEnd;
	
	private int first;
	private int last;
	public QCriteria(int num, int total) {
		if(num!=1) {
			page = (10 * num) - pageNum;
		}
		pageEnd = ( total / 10 ) + 1;
	}
	
	
}

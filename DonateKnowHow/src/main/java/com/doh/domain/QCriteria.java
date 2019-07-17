package com.doh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QCriteria {
	private int page;
	private int pageNum = 10;
	
	private int pageStart;
	private int pageEnd;
	private float pageReal;
	
	private int pre;
	private int next;
	
	private int num;
	public QCriteria(int num, int total) {
		if(num != 1) {
			page = ( pageNum * num ) - pageNum;
		}
		
		pageEnd = (int) (Math.ceil( pageNum / pageNum )) * pageNum ;
		pageReal = (float) (Math.ceil( total / pageNum ));	
		pageStart = (int)pageEnd - 9 ;

	}
	
}

package com.doh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QCriteria {
	
	private int pageStart;
	private int pageNum;	// 한 페이지에서 몇개의 데이터를 보여줄 지
	
	public QCriteria() {
		this(1,10);
	}
	
	public QCriteria(int pageStart, int pageNum) {
		this.pageStart = pageStart;
		this.pageNum = pageNum;
	}
}

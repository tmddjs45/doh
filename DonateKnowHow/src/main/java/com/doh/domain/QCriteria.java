package com.doh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QCriteria {
	
	// pageNum과 amount값을 같이 전달하는 클래스
	
	private int pageStart;
	private int pageNum;	// 한 페이지에서 몇개의 데이터를 보여줄 지
	
	public QCriteria() { // 생성자를 통해 기본값을 한페이지당 10개로 지정
		this(1,10);
	}
	
	public QCriteria(int pageStart, int pageNum) {
		this.pageStart = pageStart;
		this.pageNum = pageNum;
	}
}

package com.doh.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QBoardPageVO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private QCriteria cr;
	
	public QBoardPageVO(QCriteria cr, int total) {
		this.cr = cr;
		this.total = total;
		this.endPage = (int) (Math.ceil(cr.getPageStart() / 10.0)) * 10 ;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / cr.getPageNum()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}

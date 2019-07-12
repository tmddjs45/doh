package com.doh.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class QBoardPageVO {
	
	private int startPage;
	private int endPage;
					//이전,다음
	private boolean prev, next;
	
	private int total;
	private QCriteria cr;	//페이지에서 보여주는 데이터수(pageNum), 현재페이지번호(pageStart)가 들어있음
	
	public QBoardPageVO(QCriteria cr, int total) {
		this.cr = cr;
		this.total = total;
//							Math.ceil:소수점을 올림으로 처리
		this.endPage = (int) (Math.ceil(cr.getPageStart() / 10.0)) * 10 ;
		this.startPage = this.endPage - 9;
		
//			total(전체데이터수) 통해서 realEnd가 몇번까지 되는지 계산
		int realEnd = (int) (Math.ceil((total * 1.0) / cr.getPageNum()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
//			prev(이전)의 경우 startPage가 1보다 큰 경우 존재하도록
		this.prev = this.startPage > 1;
//			realEnd가 endPage(끝번호)보다 큰 경우에만 존재
		this.next = this.endPage < realEnd;
	}
}

package com.doh.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QCriteria {
	private int page;
	private int pageNum = 10; 	
	private int num;
	private int total;		
	private int pageStart; 
	private int pageEnd; 	
	private int pageTotal;	
	private boolean pre, next;
	
	
	public QCriteria(int num, int total) {
		this.num = num;
		this.total = total;
		
		if(num != 1) {
			page = ( pageNum * num ) - pageNum;
		}
		
		pageTotal = (int) (Math.ceil( total / pageNum )) ;
		pageStart = (int) ((( num - 1 ) / pageNum ) * pageNum ) + 1 ;

		if( total % pageTotal == 0 ) {
			pageEnd = pageStart + ( pageTotal - 1);
		}else {
			pageEnd = ( pageStart + ( pageTotal - 1)) + 1;
		}
		
		this.pre = pageStart > 1 ;
		this.next = pageEnd > pageTotal;
	}
	
	public String makeQuery(int num) {
		UriComponents uri = UriComponentsBuilder.newInstance()
												.queryParam("page", page)
												.queryParam("pageNum", this.getPageNum())
												.build()
												.encode();
		return uri.toString();
	}
}

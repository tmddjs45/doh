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
	private int pageView = 5;
	private int num;
	private int total;
	private int pageStart;
	private int pageEnd; 
	private int pageTotal;
	private int pageReal;	
	
	private boolean pre, next;
	
	
	public QCriteria(int num, int total) {
		this.num = num;
		this.total = total;
		
		if(num != 1) {
			page = ( pageView * num ) - pageView;
		}
		
		pageTotal = ( total / pageView ) ;
		pageEnd = (int) (Math.ceil(num / (double) pageView) * pageView);
		pageReal = (int) (Math.ceil( total / (double) pageView ));
		pageStart = ( pageEnd - pageView ) + 1 ;
	    if (pageEnd > pageReal) {
	    	pageEnd = pageReal;
	    }
		
		this.pre = num > 5 ;
		this.next = pageEnd < pageReal;
	}
	
	public String makeQuery(int num) {
		UriComponents uri = UriComponentsBuilder.newInstance()
												.queryParam("num", num)
												.queryParam("pageView", this.getPageView())
												.build();
		return uri.toString();
	}
}

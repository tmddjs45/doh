package com.doh.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriBuilder;
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
	
	private String searchType;
	private String keyword;
	
	public QCriteria(int num, int total, String searchType, String keyword){
		this.num = num;
		this.total = total;
		this.searchType = searchType;
		this.keyword = keyword;
		
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
		UriComponentsBuilder uri = UriComponentsBuilder.newInstance()
												.queryParam("num", num)
												.queryParam("pageView", this.getPageView());
			if (searchType!=null) {
				uri
					.queryParam("searchType", this.getSearchType())
					.queryParam("keyword", this.getKeyword());
			}
			
			
		return uri.build().encode().toString();
	}
	
}

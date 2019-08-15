package com.doh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CCriteria {
	private int pageNum; //현재 페이지
	private int totalCount; // 게시물총수
	private int totalPage;// 총 페이지수
	private int startPage;//블럭의 시작 페이지
	private int endPage;//블럭 끝 페이지
	private int pageCount=10;//블럭의 갯수
	private int calcCount;
	private int listCount=10;
	
	
	
	
	public CCriteria(int pageNum, int totalCount) {
		this.pageNum = pageNum;
		this.totalCount = totalCount;
		totalPage = (int) (Math.ceil(totalCount /10));   // 페이지당 10개의 리스트 출력예정
		if(pageNum > totalPage) {	
			pageNum = totalPage;
		}
		startPage = ((pageNum-1)/pageCount)*pageCount +1;	
		endPage = startPage+pageCount-1;
		
		if(endPage > totalPage) {	
			endPage = totalPage;	
		}
		
		calcCount = pageNum*listCount-listCount;
		if(calcCount<0) {
			calcCount=0;
		}
		System.out.println("##ccriteria  listcount"+listCount+"calcCount : "+calcCount);
		
	}
}

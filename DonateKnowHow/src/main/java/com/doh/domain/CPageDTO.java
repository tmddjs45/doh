package com.doh.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString

public class CPageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private CCriteria cri;
	
	public CPageDTO(CCriteria cri, int total) {
		if(cri.getPageNum()==0)
		{
			System.out.println("cpageDTO"+cri.getPageNum());
			this.endPage=10;
		}else {
			this.endPage = (int) (Math.ceil(cri.getPageNum()/10.0))*10;
		}
		this.cri= cri;
		this.total= total;
		
		this.startPage = this.endPage-9;
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		if(realEnd<this.endPage) {
			this.endPage=realEnd;
		}
		this.prev = this.startPage>1;
		this.next = this.endPage<realEnd;
		
	}

}

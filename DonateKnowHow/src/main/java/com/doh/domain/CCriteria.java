package com.doh.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CCriteria {
	private int pageNum;
	private int amount;
	
	public CCriteria() {
		this(0,10);
	}
	public CCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}

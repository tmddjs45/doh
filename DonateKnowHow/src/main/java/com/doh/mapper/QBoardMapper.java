package com.doh.mapper;

import java.util.List;

import com.doh.domain.QBoardDomain;


public interface QBoardMapper {
	List<QBoardDomain> list();		//select
	void insert(QBoardDomain qbd);
	QBoardDomain content(int qno);
	boolean delete(int qno);
}

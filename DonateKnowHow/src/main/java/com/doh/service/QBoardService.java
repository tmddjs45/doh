package com.doh.service;

import java.util.List;

import com.doh.domain.QBoardDomain;


public interface QBoardService {
	List<QBoardDomain> listImpl();
	void insertImpl(QBoardDomain qbd);
	QBoardDomain contentImpl(int qno);
	boolean deleteImpl(int qno);
}

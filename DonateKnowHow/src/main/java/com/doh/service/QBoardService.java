package com.doh.service;

import java.util.List;

import com.doh.domain.QBoardVO;
import com.doh.domain.QCriteria;



public interface QBoardService {
	List<QBoardVO> listImpl();
	void insertImpl(QBoardVO vo);
	QBoardVO contentImpl(int q_no);
	boolean deleteImpl(int q_no);
	void deleteAImpl(int q_no);
	
	QBoardVO updateGetImpl(int q_no);
	void updateImpl(QBoardVO vo);
	
	// paging
	List<QBoardVO> getListImpl(QCriteria cr);
	int listCountImpl();
	
	List<QBoardVO> getListSearchImpl(QCriteria cr);
	int searchCountImpl(QCriteria cr);
	
	int cookieImpl(int q_no);
	
	int checkListImpl(int q_no);
}

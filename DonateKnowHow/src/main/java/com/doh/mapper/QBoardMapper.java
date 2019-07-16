package com.doh.mapper;

import java.util.List;

import com.doh.domain.QCriteria;
import com.doh.domain.QBoardVO;

public interface QBoardMapper {
	List<QBoardVO> list();		//select
	void insert(QBoardVO vo);
	QBoardVO content(int q_no);
	boolean delete(int q_no);
	QBoardVO updateGet(int q_no);
	void update(QBoardVO vo);
	
	//paging
	List<QBoardVO> paging(QCriteria cr);
	int listCount();
}

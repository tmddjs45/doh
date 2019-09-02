package com.doh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doh.domain.QBoardVO;
import com.doh.domain.QCriteria;
import com.doh.mapper.QBoardMapper;


@Service("dohService")
//@Repository
public class QBoardServiceImpl implements QBoardService {
	@Autowired
	private QBoardMapper mapper;
		
	@Override
	public List<QBoardVO> listImpl() {
		List<QBoardVO> list = mapper.list();	
		return list;
	}
	
	@Override
	public void insertImpl(QBoardVO vo) {
		mapper.insert(vo);
	}
	
	@Override
	public QBoardVO contentImpl(int q_no){
		return mapper.content(q_no);
	}
	
	@Override
	public boolean deleteImpl(int q_no) {
		return mapper.delete(q_no);
	}
	
	@Override
	public void deleteAImpl(int q_no) {
		mapper.deleteA(q_no);
	}
	
	
	@Override
	public QBoardVO updateGetImpl(int q_no) {
		return mapper.updateGet(q_no);
	}
	
	@Override
	public void updateImpl(QBoardVO vo) {
		mapper.update(vo);
	}
	
	@Override
	public List<QBoardVO> getListImpl(QCriteria cr){
		return mapper.paging(cr);
	}
	
	@Override
	public int listCountImpl() {
		return mapper.listCount();
	}
	
	@Override	// 검색
	public List<QBoardVO> getListSearchImpl(QCriteria cr){
		return mapper.listSearch(cr);
	}
	
	@Override
	public int searchCountImpl(QCriteria cr) {
		cr.setTotal(mapper.searchCount(cr));
		int getTotal = cr.getTotal();
		return getTotal;
	}
	
	@Override
	public int cookieImpl(int q_no) {
		return mapper.cookie(q_no);
	}
	
	@Override
	public int checkListImpl(int q_no) {
		return mapper.checkList(q_no);
	}
	
}

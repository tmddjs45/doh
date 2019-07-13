package com.doh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
	public QBoardVO updateGetImpl(int q_no) {
		return mapper.updateGet(q_no);
	}
	
	@Override
	public void updateImpl(QBoardVO vo) {
		mapper.update(vo);
	}
	
	// 페이징
	@Override
	public List<QBoardVO> getListImpl(QCriteria cr){
		return mapper.listPaging(cr);
	}
	
	@Override
	public int listCountImpl() {
		return mapper.listCount();
	}
}

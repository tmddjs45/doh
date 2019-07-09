package com.doh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.doh.domain.QBoardDomain;
import com.doh.mapper.QBoardMapper;




@Service("dohService")
//@Repository
public class QBoardServiceImpl implements QBoardService {
	@Autowired
	private QBoardMapper mapper;
		
	@Override
	public List<QBoardDomain> listImpl() {
		List<QBoardDomain> list = mapper.list();
		
		return list;
	}
	
	@Override
	public void insertImpl(QBoardDomain qbd) {
		mapper.insert(qbd);
	}
	
	@Override
	public QBoardDomain contentImpl(int qno){
		return mapper.content(qno);
	}
	
	@Override
	public boolean deleteImpl(int qno) {
		return mapper.delete(qno);
	}

}

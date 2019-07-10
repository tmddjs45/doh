package com.doh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doh.domain.CBoardDTO;
import com.doh.mapper.CBoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log
@Service
@AllArgsConstructor
public class CBoardServiceImpl implements CBoardService {
	@Setter(onMethod_=@Autowired)
	private CBoardMapper mapper;

	@Override
	public void insert(CBoardDTO cbdto) {
	mapper.insert(cbdto);
	}

	@Override
	public CBoardDTO read(int c_no) {

		return mapper.read(c_no);
	}

	@Override
	public boolean update(CBoardDTO cbdto) {
	
		return mapper.update(cbdto)==1;
	}

	@Override
	public boolean delete(int c_no) {
	
		return mapper.delete(c_no)==1;
	}

	@Override
	public List<CBoardDTO> getList() {
		log.info("service##getlist--");
		return mapper.getList();
	}

}

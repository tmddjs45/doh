package com.doh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.doh.domain.FBoardDTO;
import com.doh.mapper.FBoardMapper;
import com.doh.mapper.FBoardPageMaker;

import lombok.extern.java.Log;

@Log
@Service
public class FBoardServiceImpl implements FBoardService {
	@Inject
	private FBoardMapper fboardMapper;

	@Override
	public List<FBoardDTO> getList(FBoardPageMaker fpm) {
		log.info("################### FBoardServiceImpl public List<FBoardDTO> getList(FBoardPageMaker fpm)");
		return fboardMapper.getList(fpm);
	}

	@Override
	public int getTotalCount() {
		return fboardMapper.getTotalCount();
	}
}

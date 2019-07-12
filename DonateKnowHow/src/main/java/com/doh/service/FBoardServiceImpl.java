package com.doh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.doh.domain.FBoardDTO;
import com.doh.mapper.FBoardMapper;

import lombok.extern.java.Log;

@Log
@Service
public class FBoardServiceImpl implements FBoardService {
	@Inject
	private FBoardMapper fboardMapper;

	@Override
	public List<FBoardDTO> getList() {
		return fboardMapper.getList();
	}

}

package com.doh.service;

import java.util.List;

import com.doh.domain.FBoardDTO;
import com.doh.mapper.FBoardPageMaker;

public interface FBoardService {
	public List<FBoardDTO> getList(FBoardPageMaker fpm);
	public int getTotalCount();
}

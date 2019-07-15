package com.doh.mapper;

import java.util.List;

import com.doh.domain.FBoardDTO;

public interface FBoardMapper {
	public List<FBoardDTO> getList(FBoardPageMaker fpm);
	public int getTotalCount();
}

package com.doh.service;

import java.util.List;
import com.doh.domain.CBoardDTO;;


public interface CBoardService {
	public void insert(CBoardDTO cbdto);
	public CBoardDTO read(int c_no);
	public boolean update(CBoardDTO cbdto);
	public boolean delete(int c_no);
	public List<CBoardDTO> getList();
	

}

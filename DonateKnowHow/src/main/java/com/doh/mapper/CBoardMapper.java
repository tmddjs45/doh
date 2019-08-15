package com.doh.mapper;
import java.util.List;
import com.doh.domain.CBoardDTO;
import com.doh.domain.CCriteria;

public interface CBoardMapper {
	public List<CBoardDTO> getList(CCriteria cr);
	public void insert(CBoardDTO cbdto);
	public CBoardDTO read(int c_no);
	public int delete(int c_no);
	public int update(CBoardDTO cbdto);
	public int totalCount();

}

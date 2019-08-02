package com.doh.mapper;
import java.util.List;
import com.doh.domain.CBoardDTO;

public interface CBoardMapper {
	public List<CBoardDTO> getList();
	public void insert(CBoardDTO cbdto);
	public CBoardDTO read(int c_no);
	public int delete(int c_no);
	public int update(CBoardDTO cbdto);

}

package com.doh.service;

import java.util.List;

import com.doh.domain.LectureDTO;

public interface LectureService {
	public List<LectureDTO> selectList(LectureDTO dto);
	public void insert(LectureDTO dto);
	public LectureDTO selectContent(LectureDTO dto);
	public void delete(LectureDTO dto);
	public void update(LectureDTO dto);
	
	public int getMiniNum(LectureDTO dto);
	public int getMaxiNum(LectureDTO dto);
}

package com.doh.mapper;

import java.util.List;

import com.doh.domain.LectureDTO;

public interface LectureMapper {
	public List<LectureDTO> selectList(LectureDTO dto);
	public void insert(LectureDTO dto);
	public LectureDTO selectContent(LectureDTO dto);
	public void delete(LectureDTO dto);
	public void update(LectureDTO dto);
}

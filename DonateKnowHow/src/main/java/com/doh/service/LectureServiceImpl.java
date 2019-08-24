package com.doh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.doh.domain.LectureDTO;
import com.doh.mapper.LectureMapper;

@Service
public class LectureServiceImpl implements LectureService {

	@Inject
	private LectureMapper mapper;
	
	@Override
	public List<LectureDTO> selectList(LectureDTO dto) {
		return mapper.selectList(dto);
	}

	@Override
	public void insert(LectureDTO dto) {
		mapper.insert(dto);
	}
	
	@Override
	public void delete(LectureDTO dto) {
		mapper.delete(dto);
	}

	@Override
	public void update(LectureDTO dto) {
		mapper.update(dto);
	}

	@Override
	public LectureDTO selectContent(LectureDTO dto) {
		return mapper.selectContent(dto);
	}

	@Override
	public int getMiniNum(LectureDTO dto) {
		List<LectureDTO> list = mapper.selectList(dto);
		int num = 0;
		int num2;
		for(int i=0; i<list.size(); i++) {
			if(i==0) num = list.get(i).getLecture_no();
			num2 = list.get(i).getLecture_no();
			if(num >= num2) {
				num = num2;
			}
		}
		return num;
	}

	@Override
	public int getMaxiNum(LectureDTO dto) {
		List<LectureDTO> list = mapper.selectList(dto);
		int num = 0;
		int num2;
		for(int i=0; i<list.size(); i++) {
			if(i==0) num = list.get(i).getLecture_no();
			num2 = list.get(i).getLecture_no();
			if(num <= num2) {
				num = num2;
			}
		}
		return num;
	}
}

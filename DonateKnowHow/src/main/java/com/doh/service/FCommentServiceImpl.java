package com.doh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.doh.domain.FCommentDTO;
import com.doh.mapper.FCommentMapper;

@Service
public class FCommentServiceImpl implements FCommentService {
	
	@Inject
	FCommentMapper mapper;

	@Override
	public void insertReply(FCommentDTO dto) {
		mapper.insertReply(dto);
	}

	@Override
	public List<FCommentDTO> getReplyList(int f_no) {
		return mapper.getReplyList(f_no);
	}
}

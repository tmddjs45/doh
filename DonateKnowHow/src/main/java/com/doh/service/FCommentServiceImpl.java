package com.doh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.doh.domain.FCommentDTO;
import com.doh.mapper.FBoardPageMaker;
import com.doh.mapper.FCommentMapper;

import lombok.extern.java.Log;

@Log
@Service
public class FCommentServiceImpl implements FCommentService {
	
	@Inject
	FCommentMapper mapper;
	//댓글을 입력하는 메서드
	@Override
	public void insertReply(FCommentDTO dto) {
		mapper.insertReply(dto);
	}
	//댓글 리스트를 보여주는 메서드
	@Override
	public List<FCommentDTO> getReplyList(int f_no, FBoardPageMaker replyPageMaker) {
		return mapper.getReplyList(f_no, replyPageMaker);
	}
	//댓글 총 갯수 구하는 메서드
	@Override
	public int getReplyTotalCount(int f_no) {
		return mapper.getReplyTotalCount(f_no);
	}
	//댓글을 삭제하는 메서드
	@Override
	public void deleteReply(FCommentDTO dto) {
		mapper.deleteReply(dto);
	}
}

package com.doh.service;

import java.util.List;

import com.doh.domain.FCommentDTO;

public interface FCommentService {
	//댓글 입력 메서드
	public void insertReply(FCommentDTO dto);
	
	//댓글 리스트 메서드
	public List<FCommentDTO> getReplyList(int f_no);
}

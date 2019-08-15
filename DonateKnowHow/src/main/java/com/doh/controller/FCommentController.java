package com.doh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.doh.domain.FCommentDTO;
import com.doh.service.FCommentService;

import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping("/fcomment/*")
public class FCommentController {

	@Inject
	FCommentService service;
	
	@PostMapping("insert")
	public void insert(FCommentDTO dto) {
		dto.setM_no(1); //임의로 멤버 번호 1을 넣음... 머지하면 반드시 수정 바람!
		service.insertReply(dto);
	}
	
	@RequestMapping("list")
	public List<FCommentDTO> list(int f_no) {
		log.info("댓글 댓글 댓글!");
		List<FCommentDTO> replyList = service.getReplyList(f_no);
		return replyList;
	}
}

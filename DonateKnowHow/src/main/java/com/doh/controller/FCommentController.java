package com.doh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.doh.domain.CustomUser;
import com.doh.domain.FCommentDTO;
import com.doh.mapper.FBoardPageMaker;
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
		Object pricipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(pricipal.equals("anonymousUser")) return;	//시큐리티 username이 익명사용자이면 댓글이 쓰여지지 않게 그냥 리턴합니다!
		if(dto.getFc_content() == null) return;	//댓글 내용이 null이면 댓글이 쓰여지지 않게 그냥 리턴 시킵니다
		CustomUser customUser = (CustomUser)pricipal;
		int m_no = customUser.getMember().getM_no();
		dto.setM_no(m_no);
		service.insertReply(dto);
	}
	@PostMapping("delete")
	public void delete(FCommentDTO dto) {
		service.deleteReply(dto);
	}
	
	@RequestMapping("list")
	public List<FCommentDTO> list(int f_no, Integer replyPageNum) {
		if(replyPageNum==null) replyPageNum = 1;
		int replyTotalCount = service.getReplyTotalCount(f_no);
		FBoardPageMaker replyPageMaker = new FBoardPageMaker(replyPageNum, replyTotalCount);
		List<FCommentDTO> replyList = service.getReplyList(f_no,replyPageMaker);
		return replyList;
	}
	@RequestMapping("replyPaging")
	public FBoardPageMaker replyPaging(int f_no, Integer replyPageNum) {
		if(replyPageNum==null) replyPageNum = 1;
		int replyTotalCount = service.getReplyTotalCount(f_no);
		FBoardPageMaker replyPageMaker = new FBoardPageMaker(replyPageNum, replyTotalCount);
		log.info("\n replyPageMaker의 시작 페이지 : \n"+replyPageMaker.getStartPage());
		log.info("\n replyPageMaker의 끝 페이지 : \n"+replyPageMaker.getEndPage());
		return replyPageMaker;
	}
}

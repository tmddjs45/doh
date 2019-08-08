package com.doh.controller;


import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.doh.domain.QBoardVO;
import com.doh.domain.QReplyVO;
import com.doh.service.QReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@RestController
@RequestMapping("qreply")
public class QReplyController {
	private QReplyService rservice;	

	@GetMapping("/all")
	public List<QReplyVO> replyList(int q_no, Model model){
		List<QReplyVO> rlist = rservice.replyImpl(q_no);
		model.addAttribute("reply", rlist);
		return rlist;
	}
	
	@PostMapping("/insert")
	public void replyInsert(int q_no, QReplyVO rvo) {
		rservice.insertRImpl(rvo);
		System.out.println("--- >> "+rvo);
	}

	@PostMapping("/delete")
	public void deleteR(int a_no) {
		log.info("###   넘어오는 a_no : "+a_no);
		rservice.deleteRImpl(a_no);
	}
}

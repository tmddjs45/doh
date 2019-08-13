package com.doh.controller;


import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.doh.domain.QBoardVO;
import com.doh.domain.QReplyVO;
import com.doh.service.QReplyService;
import lombok.AllArgsConstructor;


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
	public void insertR(int q_no, QReplyVO rvo) {
		rservice.insertRImpl(rvo);
	}
	
	@PostMapping("/update")
	public void updateR(int a_no, String a_content) {
		rservice.updateRImpl(a_no, a_content);
	}
	
	@PostMapping("/delete")
	public void deleteR(int a_no) {
		rservice.deleteRImpl(a_no);
	}
}

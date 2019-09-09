package com.doh.controller;


import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.doh.domain.CustomUser;
import com.doh.domain.QReplyVO;
import com.doh.service.QBoardService;
import com.doh.service.QReplyService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
@RequestMapping("qreply")
public class QReplyController {
	private QReplyService rservice;	

	@GetMapping("/all")
	public List<QReplyVO> replyList(int q_no, QReplyVO rvo){
		List<QReplyVO> rlist = rservice.replyImpl(q_no);
		return rlist;
	}
	
	@PostMapping("/insert")
	public void insertR(int q_no, QReplyVO rvo) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser customUser = (CustomUser)principal;
		int m_no = customUser.getMember().getM_no();
		rvo.setM_no(m_no);
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
	
	@GetMapping("/checkup")
	public void checkR(int a_no, QReplyVO rvo){
		int check = rvo.getA_check();
		if(check == 0) {
			System.out.println("## 채택가능   a_no : " + a_no + "\t / check : " + check);
			rservice.checkRImpl(a_no);
		}
	}
}

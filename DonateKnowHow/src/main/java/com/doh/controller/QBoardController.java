package com.doh.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doh.domain.QBoardVO;
import com.doh.domain.QCriteria;
import com.doh.service.QBoardService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("Qboard")
public class QBoardController {
	private QBoardService service;

	
	@RequestMapping("/list")
	public String list(Model model, @RequestParam(defaultValue="1") int num) {
		QCriteria cr = new QCriteria(num, service.listCountImpl());
		model.addAttribute("list", service.getListImpl(cr));
		model.addAttribute("cr", cr);
		return "Qboard/list";
	}

	@GetMapping("/Qinput")
	public String input() {
		return "Qboard/input";
	}
	
	@PostMapping("/Qinput")
	public String input(QBoardVO vo, RedirectAttributes rttr) {
		service.insertImpl(vo);
		rttr.addFlashAttribute("result", vo.getQ_no());
		return "redirect:list";
	}	
	
	@GetMapping("/content")
	public String content(@RequestParam int q_no, Model model, int num) {
		QCriteria cr = new QCriteria(num, service.listCountImpl());
		model.addAttribute("content", service.contentImpl(q_no));
		model.addAttribute("cr", cr);
		return "Qboard/content";
	}
	
	@GetMapping("/Qupdate")
	public String updateGet(@RequestParam("q_no") Integer q_no, QBoardVO vo, Model model) {
		model.addAttribute("list", service.updateGetImpl(q_no));
		return "Qboard/update";
	}
	
	@PostMapping("/Qupdate")
	public String update(QBoardVO vo, RedirectAttributes rttr) {
		service.updateImpl(vo);
		rttr.addFlashAttribute("result", vo.getQ_no());
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("q_no") int q_no, RedirectAttributes rttr) {
		if(service.deleteImpl(q_no)) {
			rttr.addFlashAttribute("result", "SUCCESS");
		}
		return "redirect:list";
	}
	
}

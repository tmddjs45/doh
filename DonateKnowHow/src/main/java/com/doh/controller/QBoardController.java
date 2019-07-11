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
import com.doh.service.QBoardService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Controller
@AllArgsConstructor
@NoArgsConstructor
@RequestMapping("qqq")
public class QBoardController {
	@Resource(name = "dohService")
	private QBoardService service;
	
	@RequestMapping("/list")
	public ModelAndView list() {
		List<QBoardVO> listGo = service.listImpl();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Qboard/list");
		mv.addObject("list",listGo);
//		System.out.println("----------------------LIST : " + listGo.get(0));
		return mv;
	}
	
	@GetMapping("/Qinput")
	public String input() {
		return "Qboard/input";
	}
	
	@PostMapping("/Qinput")
	public String input(QBoardVO vo, RedirectAttributes rttr) {
		System.out.println("--------------------inputVO : " + vo);
		service.insertImpl(vo);
		rttr.addFlashAttribute("result", vo.getQ_no());
		return "redirect:list";
	}	
	
	@GetMapping("/Qcontent")
	public ModelAndView content(@RequestParam("q_no") int q_no, Model model) {
		System.out.println("-------------------contentQno : " + q_no);
//		model.addAttribute("content", service.contentImpl(qno));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Qboard/content");
		mv.addObject("content", service.contentImpl(q_no));
		return mv;
	}
	
	@GetMapping("/Qupdate")
	public String updateGet(@RequestParam("q_no") Integer q_no, QBoardVO vo, Model model) {
		System.out.println("--------------------updateGET : " + vo.getQ_no());
		model.addAttribute("list", service.updateGetImpl(q_no));
		return "Qboard/update";
	}
	
	@PostMapping("/Qupdate")
	public String update(QBoardVO vo, RedirectAttributes rttr) {
		System.out.println("--------------------updateVO : " + vo);
//		if(service.updateImpl(vo)) {
//			rttr.addFlashAttribute("result", "SUCCESS");
//		}
		service.updateImpl(vo);
		rttr.addFlashAttribute("result", vo.getQ_no());
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("q_no") int q_no, RedirectAttributes rttr) {
		System.out.println("-------------------deleteQno : " + q_no);
		if(service.deleteImpl(q_no)) {
			rttr.addFlashAttribute("result", "SUCCESS");
		}
		return "redirect:list";
	}
	
	
}

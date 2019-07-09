package com.doh.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.annotation.Resource;
import javax.sound.midi.MidiDevice.Info;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doh.domain.QBoardDomain;
import com.doh.service.QBoardService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;


@Controller
@AllArgsConstructor
@NoArgsConstructor
@RequestMapping("/doh/*")
public class ListController {
	@Resource(name = "dohService")
	private QBoardService service;
	
	@GetMapping("/test")
	public String TEST() {
		return "/test/list_TEST";
	}
	
	@RequestMapping("/list")
	public ModelAndView list() {
		List<QBoardDomain> listGo = service.listImpl();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("list");
		mv.addObject("list",listGo);
//		System.out.println("----------------------LIST : " + listGo.get(0));
		return mv;
	}
	
	@GetMapping("/Qinput")
	public String input() {
		return "input";
	}
	
	@PostMapping("/Qinput")
	public String input(QBoardDomain qbd, RedirectAttributes rttr) {

		System.out.println("--------------------inputVO : " + qbd);
		service.insertImpl(qbd);
		rttr.addFlashAttribute("result", qbd.getQno());
		return "redirect:list";
	}	
	
	@GetMapping("/Qcontent")
	public ModelAndView Content(@RequestParam("qno") int qno, Model model) {
		System.out.println("-------------------contentQno : " + qno);
//		model.addAttribute("content", service.contentImpl(qno));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("content");
		mv.addObject("content", service.contentImpl(qno));
		return mv;
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("qno") int qno, RedirectAttributes rttr) {
		System.out.println("-------------------deleteQno : " + qno);
		if(service.deleteImpl(qno)) {
			rttr.addFlashAttribute("result", "SUCCESS");
		}
		return "redirect:list";
	}
	
	
}

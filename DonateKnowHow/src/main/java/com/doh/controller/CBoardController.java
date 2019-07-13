
package com.doh.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.doh.domain.CBoardDTO;
import com.doh.service.CBoardService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/cboard/*")
@AllArgsConstructor

public class CBoardController {
	@Setter(onMethod_=@Autowired)
	private CBoardService service;
	
	@RequestMapping("/list")
	public String list(Model model) {
		log.info("##list-----");
		model.addAttribute("list", service.getList());
		
		return "/Cboard/list";
	}
	@RequestMapping("/content")
	public String content(@RequestParam("c_no") int c_no, Model model) {
		log.info("##content----");
		System.out.println("cnoooooooooooooo"+c_no);
        model.addAttribute("list",service.read(c_no));
		return "/Cboard/content";
	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("c_no") int c_no, Model model) {
		log.info("##delete----");
		service.delete(c_no);	
		model.addAttribute("list", service.getList());
		return "Cboard/list";
	}
		
	@RequestMapping("/updateform")
	public String updateform(@RequestParam("c_no") int c_no, Model model) {
		log.info("##updateform-----");
		model.addAttribute("list", service.read(c_no));		
		return "Cboard/updateform";
	}
	@PostMapping("/update")
	public String update(@RequestParam("c_no") int c_no,CBoardDTO cbdto, Model model) {
		log.info("##update----");
		String c_title="ddd";
		
		service.update(cbdto);
		
		
		model.addAttribute("list",service.read(c_no));
		return "/Cboard/content";
		
	}
	@RequestMapping("/insertform")
	public String insertform() {
		
		return "/Cboard/insertform";
	}
	
	@RequestMapping("/insert")
	public String insert(Model model,CBoardDTO cbdto) {
		
		service.insert(cbdto);
		log.info("dddddddddddddddddddddddd"+cbdto);
		
		
		model.addAttribute("list", service.getList());
		return "/Cboard/list";
	}
	@RequestMapping("/stest")
	public String stest() {
		System.out.println("드러옴이잉이이");
		return "/Cboard/stest";
	}
	
	@RequestMapping("/sidtest")
	public String sidtest(@RequestParam("s_id") String s_id, Model model, HttpSession session) {
		System.out.println("pre sidtest"+s_id);
		session.setAttribute("s_id", s_id);
		String sss=(String)session.getAttribute("s_id");
		System.out.println(" sidtest : "+sss);
		model.addAttribute("list", service.getList());
		return "/sibal";
	}
	
	@RequestMapping("/sidcheck")
	public String sidcheck(HttpSession session) {
		String sid= (String)session.getAttribute("s_id");
		System.out.println("sidcheck : "+sid);
		
		return null;
	}
	
	@RequestMapping("/sibal")
	public String si(HttpSession session) {
		String si = (String)session.getAttribute("s_id");
		System.out.println("이건안되면 집감"+ si);
		return null;
	}
	@RequestMapping("/sremove")
	public String sremove(HttpSession session) {
		session.invalidate();
		return "";
	}
	
	
	
	
}

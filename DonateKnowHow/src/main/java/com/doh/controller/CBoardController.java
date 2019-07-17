
package com.doh.controller;

import java.io.InputStream;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.PageData;




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
import com.doh.domain.CCriteria;
import com.doh.domain.CPageDTO;
import com.doh.service.CBoardService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/cboard/*")
@AllArgsConstructor
@NoArgsConstructor

public class CBoardController {
	@Setter(onMethod_=@Autowired)
	private CBoardService service;

	
	@GetMapping("/list")
	public String list(Model model, CCriteria cri) {
		log.info("##list-----");
		log.info("##criiiiiiiiiiiiiiiiiiii"+cri);
		int total =service.getTotalCount(cri);
		model.addAttribute("pageMaker", new CPageDTO(cri, total));
		int critemp=cri.getPageNum();
		System.out.println(critemp*10);
		if(critemp==0) {
			cri.setPageNum(critemp*10);
		}else {
		cri.setPageNum((critemp-1)*10);
		}
		
		
		model.addAttribute("list", service.getList(cri));
			
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
	public String delete(@RequestParam("c_no") int c_no, Model model, CCriteria cri) {
		log.info("##delete----");
		service.delete(c_no);	
		model.addAttribute("list", service.getList(cri));
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
		
		
		model.addAttribute("list", service.getList(null));
		return "/Cboard/list";
	}
	@RequestMapping("/stest")
	public String stest() {
		System.out.println("드러옴이잉이이");
		return "/Cboard/stest";
	}
	
	
	@RequestMapping("/sidcheck")
	public String sidcheck(HttpSession session) {
		String sid= (String)session.getAttribute("s_id");
		System.out.println("sidcheck : "+sid);
		
		return null;
	}
	
	
	@RequestMapping("/sidtest")
	public String sidtest(@RequestParam("s_id") String s_id, Model model, HttpSession session) {
		System.out.println("pre sidtest"+s_id);
		session.setAttribute("s_id", s_id);
		String sss=(String)session.getAttribute("s_id");
		System.out.println(" sidtest : "+sss);
		
		return "/sibal";
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
	
	
	@RequestMapping("/conn")
	public String connect() {
		return "/Cboard/test";
	}
	
	
	
	
}

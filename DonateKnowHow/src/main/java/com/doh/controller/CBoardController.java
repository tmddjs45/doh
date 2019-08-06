
package com.doh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doh.domain.CBoardDTO;
import com.doh.service.CBoardService;
import com.doh.test.cpTest;

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

	
	@PostMapping("/modal")
	public String modal(@RequestParam("code") String code,@RequestParam("c_no") int c_no, Model model) {
		
		cpTest test = new cpTest();
		 test.saveJava(code);
		 model.addAttribute("list",service.read(c_no));
		
		model.addAttribute("result", test.saveJava(code));
		
		return "/Cboard/content";
		
	}
	@RequestMapping("/frame")
	public String frame(@RequestParam("c_no") int c_no, Model model) {
		log.info("##frame----");
		System.out.println("cnoooooooooooooo"+c_no);
        model.addAttribute("list",service.read(c_no));
		return "/Cboard/frame";
	}

	@RequestMapping("/savejava")
	public String savejava(@RequestParam("code")String code) {
		System.out.println(code+"------------------------------------------------");
		System.out.println("세이브자바들어옴");
		return code;
	}
	@RequestMapping(value="/compile", produces = "application/text; charset=utf8")
	public @ResponseBody String compile(@RequestParam("code")String code) {
		System.out.println("##compile---- : "+code);
		cpTest test = new cpTest();
		String result=test.saveJava(code);
		if(result.length()==0) {
			System.out.println("##compile result is null");
			result="compile err";
			return result;
		}else {
			System.out.println("##compile result is : "+result);
			return result;
		}
		
	}
	

}

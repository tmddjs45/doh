
package com.doh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public void list(Model model) {
		log.info("##list-----");
		model.addAttribute("list", service.getList());
		log.info("@@@@@@@@@@@@@@@@@@@@@@@"+service.getList());
	}

}

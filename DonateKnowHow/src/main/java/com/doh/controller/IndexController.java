package com.doh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log
@Controller
public class IndexController {
	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}
	@RequestMapping("/frame") // 기본프레임으로 접속합니다.
	public String frame() {
		return "frame";
	}
	
	@RequestMapping("/signup")
	public String signup() {
		return "/member/signup";
	}
	
	@PostMapping("/signup")
	public String memberJoin() {
		log.info("sdsdsd여기루 들어온데용!");
		return "index";
		
	}
	
}

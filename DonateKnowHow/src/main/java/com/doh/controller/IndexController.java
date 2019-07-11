package com.doh.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
}

package com.doh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path = "/error")
public class ErrorController {
	@GetMapping
	public String main() {
		return "errorpage/error";
	}
}

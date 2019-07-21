package com.doh.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.doh.domain.MemberDTO;
import com.doh.service.MemberService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log
@Controller
public class IndexController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value = "/")
	public String index() {
		return "index";
	}
	@RequestMapping("/frame") // 기본프레임으로 접속합니다.
	public String frame() {
		return "frame";
	}
	
	@RequestMapping("/signup")
	public String signupform() {
		return "/member/signup";
	}
	
	@PostMapping("/emailcheck")
	public void emailcheck(String email, HttpServletResponse response){
		log.info(email);
		MemberDTO member = service.checkemail(email);
		try {
			PrintWriter pw = response.getWriter();
			
			if(member!=null) {
				//null 이 아니면 이미 있어 사용 불가능한 Email.
				//JSon 파싱
				pw.print(false);
			}else {
				//null 이면 사용 가능한 Email.
				pw.print(true);
			}
		}catch(IOException io) {}
	}
	
	@PostMapping("/nickcheck")
	public void nicknamecheck(String nickname, HttpServletResponse response) {
		MemberDTO member = service.checknickname(nickname);
		try {
			PrintWriter pw = response.getWriter();
			
			if(member!=null) {
				//null 이 아니면 이미 있어 사용 불가능한 NickName.
				pw.print(false);
			}else {
				//null 이면 사용 가능한 NickName.
				pw.print(true);
			}
		}catch(IOException io) {}
	}
	
	@PostMapping("/signup")
	public String signup(MemberDTO dto) {
		service.signup(dto);
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session){
		log.info(dto.getEmail()+dto.getPassword());
		MemberDTO member = service.login(dto.getEmail() , dto.getPassword());
		session.setAttribute("member", member);
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
}

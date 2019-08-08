package com.doh.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.doh.domain.CustomUser;
import com.doh.domain.MemberVO;
import com.doh.service.MemberService;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Log4j
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
		Object pricipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser customUser = (CustomUser)pricipal;
		
		log.info("## Email : "+customUser.getMember().getEmail());
		log.info("## Nick : "+customUser.getMember().getNickname());
		log.info("## M_no : "+customUser.getMember().getM_no());

		return "frame";
	}
	
	@RequestMapping("/signup")
	public String signupform() {
		return "/member/signup";
	}
	
	@PostMapping("/signup")
	public String signup(MemberVO vo) {
		log.info("Controller VO: " + vo);
		service.signup(vo);
		return "redirect:/";
	}
	
	@PostMapping("/emailcheck")
	public void emailcheck(String email, HttpServletResponse response){
		log.info(email);
		MemberVO member = service.checkemail(email);
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
		MemberVO member = service.checknickname(nickname);
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
	
	@RequestMapping("/about")
	public String aboutDoh() {
		return "member/about";
	}
	
	@RequestMapping("/memberinfo")
	public String memberinfo(Model model) {
		Object pricipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser customUser = (CustomUser)pricipal;
		
		log.info("## 멤버 넘버 : "+customUser.getMember().getM_no());
		ArrayList<Integer> count = service.countinfo(customUser.getMember().getM_no());
		model.addAttribute("count",count);
		
		return "member/memberinfo";
	}
	
}

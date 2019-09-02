package com.doh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doh.domain.CustomUser;
import com.doh.domain.QBoardVO;
import com.doh.domain.QCriteria;
import com.doh.domain.QReplyVO;
import com.doh.service.QBoardService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("Qboard")
public class QBoardController {
	private QBoardService service;
	
	@GetMapping("/list")
	public String list(@RequestParam(defaultValue="1") int num, Model model, String searchType, String keyword) {
		QCriteria cr = new QCriteria(num, service.listCountImpl(), searchType, keyword);
		
		if(searchType==null) {
			List<QBoardVO> list = service.getListSearchImpl(cr);
			for(int i=0 ; i<list.size() ; i++) {
				int checknum = service.checkListImpl(list.get(i).getQ_no());
				list.get(i).setChecknum(checknum);
				model.addAttribute("list", list);
				model.addAttribute("cr", cr);
			}
		}else {
			QCriteria searchCr = new QCriteria(num, service.searchCountImpl(cr), searchType, keyword);
			List<QBoardVO> list = service.getListSearchImpl(searchCr);
			for(int i=0 ; i<list.size() ; i++) {
				int checknum = service.checkListImpl(list.get(i).getQ_no());
				list.get(i).setChecknum(checknum);
				model.addAttribute("list", list);
				model.addAttribute("cr", searchCr);
			}
		}
		return "Qboard/list";
	}

	@GetMapping("/input")
	public String inputGet() {
		return "Qboard/input";
	}
	
	@PostMapping("/input")
	public String input(QBoardVO vo, RedirectAttributes rttr) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser customUser = (CustomUser)principal;
		String nickname = customUser.getMember().getNickname();
		vo.setNickname(nickname);
		service.insertImpl(vo);
		QCriteria cr = new QCriteria(1, service.listCountImpl(), null, null);
		rttr.addAttribute("num", 1);
		rttr.addAttribute("pageView", cr.getPageView());
		rttr.addAttribute("q_no", vo.getQ_no());
		rttr.addFlashAttribute("result", "SUCCESS");
		return "redirect:list";
	}			
	
	@GetMapping("/content")
	public String content(HttpServletRequest request, HttpServletResponse response,
					@RequestParam int q_no, Model model, int num, QBoardVO vo, String searchType, String keyword) {
		QCriteria cr = new QCriteria(num, service.listCountImpl(), searchType, keyword);
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		CustomUser customUser = (CustomUser)principal;
//		System.out.println(customUser.getMember());
	
		model.addAttribute("content", service.contentImpl(q_no));
		model.addAttribute("cr", cr);
		
		Cookie cookies[] = request.getCookies();
		Cookie cookieCheck = null;
		if(cookies != null && cookies.length > 0) {
			for(int i=0 ; i < cookies.length ; i++) {
				if(cookies[i].getName().equals("cookie"+q_no)) {
					cookieCheck = cookies[i];
				}
			}
			if(vo != null) {
				if(cookieCheck == null) {
					System.out.println("\t\t\t\t\t ### 쿠키생성 ###");
					Cookie newCookie = new Cookie("cookie"+q_no, "|" + q_no + "|");
	                response.addCookie(newCookie);
	                service.cookieImpl(q_no);
				}else {
					String value = cookieCheck.getValue();
				}
			}
		}
		return "Qboard/content";
	}
	
	@GetMapping("/update")
	public String updateGet(@RequestParam("q_no") Integer q_no, QBoardVO vo, Model model, int num, String searchType, String keyword) {
		QCriteria cr = new QCriteria(num, service.listCountImpl(), searchType, keyword);
		model.addAttribute("list", service.getListImpl(cr));
		model.addAttribute("cr", cr);
		model.addAttribute("list", service.updateGetImpl(q_no));
		return "Qboard/update";
	}
	
	@PostMapping("/update")
	public String update(QBoardVO vo, RedirectAttributes rttr, int num, String searchType, String keyword) {
		service.updateImpl(vo);
		QCriteria cr = new QCriteria(num, service.listCountImpl(), searchType, keyword);
		rttr.addAttribute("num", cr.getNum());
		rttr.addAttribute("pageView", cr.getPageView());
		rttr.addAttribute("q_no", vo.getQ_no());
		rttr.addFlashAttribute("result", "SUCCESS");
		return "redirect:content";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("q_no") int q_no, RedirectAttributes rttr, int num, String searchType, String keyword) {
		service.deleteAImpl(q_no);
		if(service.deleteImpl(q_no)) {
			QCriteria cr = new QCriteria(num, service.listCountImpl(), searchType, keyword);
			
			rttr.addAttribute("num", cr.getNum());
			rttr.addAttribute("pageView", cr.getPageView());
		}
		return "redirect:list";
	}
	
}

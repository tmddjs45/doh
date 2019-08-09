package com.doh.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doh.domain.CustomUser;
import com.doh.domain.FBoardDTO;
import com.doh.mapper.FBoardPageMaker;
import com.doh.service.FBoardService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/fboard/*")
public class FBoardController {
	
	@Inject
	private FBoardService fboardService;

	//기본 리스트 페이지 컨트롤러
	@GetMapping("/list")
	public String list(String search, String select, Integer pageNum, Model model) {
		if(pageNum == null) pageNum = 1;
		if(search == null || search.equals("") || select==null || select.equals("")) {
			int totalCount = fboardService.getTotalCount();
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			List<FBoardDTO> fboardList = fboardService.getList(fpm);
			modelAddAttribute(null, null, null, null, fboardList, fpm, model);
			return "Fboard/Fboard";
		}else if(select.equals("title")) {
			int totalCount = fboardService.getTitleTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchTitle(fpm);
			modelAddAttribute(search, select, null, null, fboardList, fpm, model);
			return "Fboard/Fboard";
		}else if(select.equals("content")) {
			int totalCount = fboardService.getContentTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchContent(fpm);
			modelAddAttribute(search, select, null, null, fboardList, fpm, model);
			return "Fboard/Fboard";
		}else if(select.equals("TitleContent")) {
			int totalCount = fboardService.getTitleContentTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchTitleContent(fpm);
			modelAddAttribute(search, select, null, null, fboardList, fpm, model);
			return "Fboard/Fboard";
		}else if(select.equals("nickname")) {
			int totalCount = fboardService.getNicknameTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchNickname(fpm);
			modelAddAttribute(search, select, null, null, fboardList, fpm, model);
			return "Fboard/Fboard";
		}
		log.info("여기로 나왔다는 것은 오류입니다");
		return null;
	}
	
	//조회 페이지 컨트롤러
	@GetMapping("/content")
	public String content(int f_no, String search, String select, Integer pageNum, Model model, HttpServletRequest request, HttpServletResponse response) {
		if(pageNum == null) pageNum=1;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(principal.equals("anonymousUser")) {
			model.addAttribute("userEmail", "null");
		}else {
			CustomUser customUser = (CustomUser)principal;
			String email = customUser.getMember().getEmail();
			model.addAttribute("userEmail", email);
		}
		
		if(search == null || search.equals("") || select==null || select.equals("")) {
			FBoardDTO fboardContent = fboardService.getContent(f_no);
			fboardService.receiveReadnum(f_no, fboardContent, fboardService, request, response);
			fboardContent = fboardService.getContent(f_no);
			int totalCount = fboardService.getTotalCount();
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			List<FBoardDTO> fboardList = fboardService.getList(fpm);
			int maxiNum = fboardService.getPageListMaxiNum(fboardList);
			int miniNum = fboardService.getPageListMiniNum(fboardList, maxiNum);
			model.addAttribute("maxiNum", maxiNum);
			model.addAttribute("miniNum", miniNum);
			modelAddPrevNextNum(f_no, model);
			modelAddAttribute(null, null, pageNum, fboardContent, fboardList, fpm, model);
			return "Fboard/FboardContent";
		}else if(select.equals("title")) {
			FBoardDTO fboardContent = fboardService.getContent(f_no);
			fboardService.receiveReadnum(f_no, fboardContent, fboardService, request, response);
			fboardContent = fboardService.getContent(f_no);
			int totalCount = fboardService.getTitleTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchTitle(fpm);
			int maxiNum = fboardService.getPageListMaxiNum(fboardList);
			int miniNum = fboardService.getPageListMiniNum(fboardList, maxiNum);
			model.addAttribute("maxiNum", maxiNum);
			model.addAttribute("miniNum", miniNum);
			modelAddPrevNextNum(f_no, select, search, model);
			modelAddAttribute(search, select, pageNum, fboardContent, fboardList, fpm, model);
			return "Fboard/FboardContent";
		}else if(select.equals("content")) {
			FBoardDTO fboardContent = fboardService.getContent(f_no);
			fboardService.receiveReadnum(f_no, fboardContent, fboardService, request, response);
			fboardContent = fboardService.getContent(f_no);
			int totalCount = fboardService.getContentTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchContent(fpm);
			int maxiNum = fboardService.getPageListMaxiNum(fboardList);
			int miniNum = fboardService.getPageListMiniNum(fboardList, maxiNum);
			model.addAttribute("maxiNum", maxiNum);
			model.addAttribute("miniNum", miniNum);
			modelAddPrevNextNum(f_no, select, search, model);
			modelAddAttribute(search, select, pageNum, fboardContent, fboardList, fpm, model);
			return "Fboard/FboardContent";
		}else if(select.equals("TitleContent")) {
			FBoardDTO fboardContent = fboardService.getContent(f_no);
			fboardService.receiveReadnum(f_no, fboardContent, fboardService, request, response);
			fboardContent = fboardService.getContent(f_no);
			int totalCount = fboardService.getTitleContentTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchTitleContent(fpm);
			int maxiNum = fboardService.getPageListMaxiNum(fboardList);
			int miniNum = fboardService.getPageListMiniNum(fboardList, maxiNum);
			model.addAttribute("maxiNum", maxiNum);
			model.addAttribute("miniNum", miniNum);
			modelAddPrevNextNum(f_no, select, search, model);
			modelAddAttribute(search, select, pageNum, fboardContent, fboardList, fpm, model);
			return "Fboard/FboardContent";
		}else if(select.equals("nickname")) {
			FBoardDTO fboardContent = fboardService.getContent(f_no);
			fboardService.receiveReadnum(f_no, fboardContent, fboardService, request, response);
			fboardContent = fboardService.getContent(f_no);
			int totalCount = fboardService.getNicknameTotalCount(search);
			FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
			fpm.setSearch(search);
			List<FBoardDTO> fboardList = fboardService.searchNickname(fpm);
			int maxiNum = fboardService.getPageListMaxiNum(fboardList);
			int miniNum = fboardService.getPageListMiniNum(fboardList, maxiNum);
			model.addAttribute("maxiNum", maxiNum);
			model.addAttribute("miniNum", miniNum);
			modelAddPrevNextNum(f_no, select, search, model);
			modelAddAttribute(search, select, pageNum, fboardContent, fboardList, fpm, model);
			return "Fboard/FboardContent";
		}
		return null;
	}
	
	//게시물 삭제 컨트롤러
	@PostMapping("/delete")
	public String delete(int f_no, String search, String select, Integer pageNum) throws UnsupportedEncodingException {
		if(pageNum == null) pageNum = 1;
		if(search != null)search = URLEncoder.encode(search, "UTF-8");	//redirect시 한글 깨짐 방지! 이유는 파라미터 값이 URL이기 때문에 파라미터가 제대로 파싱되지 않기 때문입니다
		fboardService.deleteContent(f_no);
		if(!search.equals("") || !select.equals("")) {
			return "redirect:/fboard/list?search="+search+"&select="+select+"&pageNum="+pageNum;
		}
		return "redirect:/fboard/list?pageNum="+pageNum;
	}
	//게시물 입력폼 이동 컨트롤러
	@GetMapping("/write")
	public String writeForm() {
		return "Fboard/FboardWriteForm";
	}
	//게시물 등록 컨트롤러
	@PostMapping("/write")
	public String write(String f_title, String f_content) {
		Object pricipal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CustomUser customUser = (CustomUser)pricipal;
		int m_no = customUser.getMember().getM_no();
		fboardService.insertContent(f_title, f_content, m_no);
		return "redirect:/fboard/list";
	}
	//게시물 수정폼 이동 컨트롤러
	@PostMapping("/updateForm")
	public String updateForm(int f_no, String search, String select, Integer pageNum, Model model) {
		FBoardDTO fboardContent = fboardService.getContent(f_no);
		modelAddAttribute(search, select, pageNum, fboardContent, null, null, model);
		return "Fboard/FboardUpdateForm";
	}
	//게시물 수정 컨트롤러
	@PostMapping("/update")
	public String update(String f_title, String f_content, int f_no, String search, String select, Integer pageNum)  throws Exception{
		if(pageNum == null) pageNum = 1;
		if(search != null) search = URLEncoder.encode(search, "UTF-8");	//redirect시 한글 깨짐 방지! 이유는 파라미터 값이 URL이기 때문에 파라미터가 제대로 파싱되지 않기 때문입니다
		fboardService.updateContent(f_title, f_content, f_no);
		if(search.equals("") ||search == null || select.equals("") || select == null) {
			return "redirect:/fboard/content?f_no="+f_no+"&pageNum="+pageNum;
		}else {
			return "redirect:/fboard/content?f_no="+f_no+"&search="+search+"&select="+select+"&pageNum="+pageNum;
		}
	}
	
	
	
	
	
	//각종 모델을 add하는 것을 리팩토링
	public void modelAddAttribute(String search, String select, Integer pageNum, FBoardDTO fboardContent, List<FBoardDTO> fboardList, FBoardPageMaker fpm, Model model) {
		if(search != null) model.addAttribute("search", search);
		if(select != null) model.addAttribute("select", select);
		if(pageNum != null) model.addAttribute("pageNum", pageNum);
		if(fboardContent != null) model.addAttribute("fboardContent", fboardContent);
		if(fboardList != null) model.addAttribute("fboardList", fboardList);
		if(fpm != null) model.addAttribute("pageMaker", fpm);
	}
	public void modelAddPrevNextNum(int f_no, Model model) {
		int prevNum = fboardService.getPrevNum(f_no);
		int nextNum = fboardService.getNextNum(f_no);
		model.addAttribute("prevNum", prevNum);
		model.addAttribute("nextNum", nextNum);
	}
	//modelAddPrevNextNum 오버로딩
	public void modelAddPrevNextNum(int f_no, String select, String search, Model model) {
		int prevNum = fboardService.getSearchPrevNum(f_no, select, search);
		int nextNum = fboardService.getSearchNextNum(f_no, select, search);
		model.addAttribute("prevNum", prevNum);
		model.addAttribute("nextNum", nextNum);
	}
}

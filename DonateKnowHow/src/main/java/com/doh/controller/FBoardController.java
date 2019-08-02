package com.doh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@GetMapping("/list")
	public String list(Integer pageNum, Model model) {
		log.info("########################### FBoardController list()");
		if(pageNum == null) {
			pageNum = 1;
		}
		int totalCount = fboardService.getTotalCount();
		FBoardPageMaker fpm = new FBoardPageMaker(pageNum, totalCount);
		
		List<FBoardDTO> fboardList = fboardService.getList(fpm);
		model.addAttribute("fboardList", fboardList);

		
		model.addAttribute("pageMaker", fpm);
		return "Fboard/Fboard";
	}
}

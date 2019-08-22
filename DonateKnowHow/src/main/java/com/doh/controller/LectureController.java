package com.doh.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doh.domain.LectureDTO;
import com.doh.service.LectureService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/lecture/*")
public class LectureController {
	
	@Inject
	private LectureService service;
	
	@RequestMapping("/tutorial")
	public String tutorial(String command, LectureDTO dto, Model model) throws UnsupportedEncodingException {
		List<LectureDTO> lectureList = service.selectList(dto);
		model.addAttribute("lectureList", lectureList);
		int lecture_no = service.getMiniNum(dto);
		String lecture_name = dto.getLecture_name();
		if(!lecture_name.equals("")||lecture_name!=null) lecture_name = URLEncoder.encode(lecture_name, "UTF-8");
		String url = "lecture/"+lecture_name;
		log.info("lecture_name은? "+lecture_name);
		if(command == null) {
			if(lecture_no != 0) {
				return "redirect:/lecture/content?lecture_no="+lecture_no+"&lecture_name="+lecture_name;
			}
			return url;
		}else if(command.equals("make")) {
			log.info("작성 폼 접근");
			model.addAttribute("command", "make");
			return url;
		}
		return url;
	}
	@PostMapping("/write")
	public String write(LectureDTO dto) throws UnsupportedEncodingException {
		service.insert(dto);
		int lecture_no = service.getMaxiNum(dto);
		String lecture_name = dto.getLecture_name();
		lecture_name = URLEncoder.encode(lecture_name, "UTF-8");
		if(lecture_no != 0) {
			return "redirect:/lecture/content?lecture_no="+lecture_no+"&lecture_name="+lecture_name;
		}
		return "redirect:/lecture/tutorial";
	}
	@PostMapping("/modifyForm")
	public String modifyForm(LectureDTO dto, Model model) {
		List<LectureDTO> lectureList = service.selectList(dto);
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("command", "modify");
		LectureDTO oneContent = service.selectContent(dto);
		model.addAttribute("oneContent", oneContent);
		String url = "lecture/"+dto.getLecture_name();
		return url;
	}
	@PostMapping("/modify")
	public String modify(LectureDTO dto, Model model) throws UnsupportedEncodingException {
		List<LectureDTO> lectureList = service.selectList(dto);
		model.addAttribute("lectureList", lectureList);
		int lecture_no = dto.getLecture_no();
		String lecture_name = dto.getLecture_name();
		lecture_name = URLEncoder.encode(lecture_name, "UTF-8");
		service.update(dto);
		return "redirect:/lecture/content?lecture_no="+lecture_no+"&lecture_name="+lecture_name;
	}
	
	@PostMapping("/delete")
	public String delete(LectureDTO dto) throws UnsupportedEncodingException {
		service.delete(dto);
		int lecture_no = service.getMaxiNum(dto);
		String lecture_name = dto.getLecture_name();
		lecture_name = URLEncoder.encode(lecture_name, "UTF-8");
		if(lecture_no != 0) return "redirect:/lecture/content?lecture_no="+lecture_no+"&lecture_name="+lecture_name;
		return "redirect:/lecture/tutorial";
	}
	@GetMapping("/content")
	public String content(LectureDTO dto, Model model) {
		List<LectureDTO> lectureList = service.selectList(dto);
		model.addAttribute("lectureList", lectureList);
		LectureDTO oneContent = service.selectContent(dto);
		model.addAttribute("oneContent", oneContent);
		String url = "lecture/"+dto.getLecture_name();
		return url;
	}
}

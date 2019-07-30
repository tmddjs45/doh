package com.doh.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.doh.domain.FBoardDTO;
import com.doh.mapper.FBoardPageMaker;

public interface FBoardService {
	//리스트 관련 메서드들
	public List<FBoardDTO> getList(FBoardPageMaker fpm);
	public List<FBoardDTO> searchTitle(FBoardPageMaker fpm);
	public List<FBoardDTO> searchContent(FBoardPageMaker fpm);
	public List<FBoardDTO> searchTitleContent(FBoardPageMaker fpm);
	public List<FBoardDTO> searchNickname(FBoardPageMaker fpm);
	
	//페이징을 하기 위해 총 게시물 수 구하는 메서드들
	public int getTotalCount();
	public int getTitleTotalCount(String search);
	public int getContentTotalCount(String search);
	public int getTitleContentTotalCount(String search);
	public int getNicknameTotalCount(String search);
	
	//조회 페이지 관련 메서드
	public FBoardDTO getContent(int f_no);
	//현재 페이지 이전 글 숫자 구하는 메서드
	public int getPrevNum(int f_no);
	//현재 페이지 다음 글 숫자 구하는 메서드
	public int getNextNum(int f_no);
	//검색한 현재 페이지 이전 글 숫자 구하는 메서드
	public int getSearchPrevNum(int f_no, String select, String search);
	//검색한 현재 페이지 다음 글 숫자 구하는 메서드
	public int getSearchNextNum(int f_no, String select, String search);
	
	//이전 글 버튼을 누를때 페이징 이동을 위한 해당 페이지의 가장 작은 글번호 구하는 메서드
	public int getPageListMiniNum(List<FBoardDTO> fboardList, int maxiNum);
	//다음 글 버튼을 누를때 페이징 이동을 위한 해당 페이지의 가장 큰 글번호 구하는 메서드
	public int getPageListMaxiNum(List<FBoardDTO> fboardList);
	
	//조회수 업데이트(증가)시키기 위한 메서드들
	public void updateReadnum(int f_no);
	public void receiveReadnum(int f_no, FBoardDTO fboardContent, FBoardService fboardService, HttpServletRequest request, HttpServletResponse response);
	
	//게시물 삭제 메서드
	public void deleteContent(int f_no);
	//게시물 등록 메서드
	public void insertContent(String f_title, String f_content, int m_no);
	//게시물 수정 메서드
	public void updateContent(String f_title, String f_content, int f_no);
}

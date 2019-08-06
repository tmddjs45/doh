package com.doh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.doh.domain.FBoardDTO;

public interface FBoardMapper {
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
	public List<FBoardDTO> getPrevNum(int f_no);
	//현재 페이지 다음 글 숫자 구하는 메서드
	public List<FBoardDTO> getNextNum(int f_no);
	//검색한 현재 페이지 이전 글 숫자 구하는 메서드
	public List<FBoardDTO> getSearchPrevNum(@Param("f_no")int f_no, @Param("select")String select, @Param("search")String search);
	//검색한 현재 페이지 다음 글 숫자 구하는 메서드
	public List<FBoardDTO> getSearchNextNum(@Param("f_no")int f_no, @Param("select")String select, @Param("search")String search);
	//닉네임을 검색한 현재 페이지 이전 글 숫자 구하는 메서드
	public List<FBoardDTO> getSearchNicknamePrev(@Param("f_no")int f_no, @Param("select")String select, @Param("search")String search);
	//닉네임을 검색한 현재 페이지 다음 글 숫자 구하는 메서드
	public List<FBoardDTO> getSearchNicknameNext(@Param("f_no")int f_no, @Param("select")String select, @Param("search")String search);
	
	//조회수를 업데이트 해주는 메서드
	public void updateReadnum(int f_no);
	
	//게시물 삭제 메서드
	public void deleteContent(int f_no);
	
	//게시물 등록 메서드
	public void insertContent(@Param("f_title")String f_title, @Param("f_content")String f_content, @Param("m_no")int m_no);
	
	//게시물 수정 메서드
	public void updateContent(@Param("f_title")String f_title, @Param("f_content")String f_content, @Param("f_no")int f_no);
}

package com.doh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.doh.domain.FCommentDTO;

public interface FCommentMapper {
	//댓글 입력 메서드
	public void insertReply(FCommentDTO dto);
	
	//댓글 리스트 메서드
	public List<FCommentDTO> getReplyList(@Param("f_no") int f_no, @Param("replyPageMaker") FBoardPageMaker replyPageMaker);
	//댓글 총 갯수 구하는 메서드
	public int getReplyTotalCount(int f_no);
	
	//댓글 삭제하는 메서드
	public void deleteReply(FCommentDTO dto);
	//대댓글 삭제하는 메서드
	public void deleteAnswer(FCommentDTO dto);
	//댓글 수정하는 메서드
	public void updateReply(FCommentDTO dto);
}

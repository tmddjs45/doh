package com.doh.mapper;

import java.util.List;

import com.doh.domain.QReplyVO;

public interface QReplyMapper {
	List<QReplyVO> reply(int q_no);
	void insertR(QReplyVO rvo);
}

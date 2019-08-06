package com.doh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doh.domain.QReplyVO;
import com.doh.mapper.QReplyMapper;

@Service
public class QReplyServiceImpl implements QReplyService {
	@Autowired
	private QReplyMapper mapper;
	
	@Override
	public List<QReplyVO> replyImpl(int q_no){
		List<QReplyVO> reply = mapper.reply(q_no);
		return reply;
	}
	
	@Override
	public void insertRImpl(QReplyVO rvo) {
		mapper.insertR(rvo);
	}
}

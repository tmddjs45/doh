package com.doh.service;
import java.io.Serializable;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.doh.domain.MemberVO;
import com.doh.mapper.MemberMapper;

import lombok.extern.java.Log;

@Log
@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper mapper;
	private static BCryptPasswordEncoder bcrypt = new BCryptPasswordEncoder();
	
	@Override
	public void signup(MemberVO vo) {
		vo.setPassword(bcrypt.encode(vo.getPassword())); //Encode
		log.info("## Service: "+vo);
		mapper.signup(vo);
		mapper.signup_auth(vo.getEmail());
	}

	@Override
	public MemberVO checkemail(String email) {
		MemberVO member = mapper.searchMember(email);
		return member;
	}

	@Override
	public MemberVO checknickname(String nickname) {
		MemberVO member = mapper.checknickname(nickname);
		return member;
	}

	@Override
	public ArrayList countinfo(int m_no) {
		
		int boardSum = 0;
		int replySum = 0;
		ArrayList<Integer> sumcount = new ArrayList<Integer>();
		
		ArrayList boardcount = mapper.boardcount(m_no);
		ArrayList replycount = mapper.replycount(m_no);
		int answercount = mapper.answercount(m_no);
		
		for(int i=0; i<boardcount.size();i++) {
			log.info("#### 게시물 갯수 : "+boardcount.get(i));
			boardSum += (int)boardcount.get(i);
		}
		
		for(int j=0; j<replycount.size();j++) {
			log.info("#### 게시물 갯수 : "+replycount.get(j));
			replySum += (int)replycount.get(j);
		}
		
		sumcount.add(boardSum);
		sumcount.add(replySum);
		sumcount.add(answercount);
		return sumcount;
	}

}

package com.doh.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.doh.domain.FBoardDTO;
import com.doh.mapper.FBoardMapper;
import com.doh.mapper.FBoardPageMaker;

import lombok.extern.java.Log;

@Log
@Service
public class FBoardServiceImpl implements FBoardService {
	@Inject
	private FBoardMapper fboardMapper;
	
	//리스트 관련 메서드들
	@Override
	public List<FBoardDTO> getList(FBoardPageMaker fpm) {
		return fboardMapper.getList(fpm);
	}
	@Override
	public List<FBoardDTO> searchTitle(FBoardPageMaker fpm) {
		return fboardMapper.searchTitle(fpm);
	}
	@Override
	public List<FBoardDTO> searchContent(FBoardPageMaker fpm) {
		return fboardMapper.searchContent(fpm);
	}
	@Override
	public List<FBoardDTO> searchTitleContent(FBoardPageMaker fpm) {
		return fboardMapper.searchTitleContent(fpm);
	}
	@Override
	public List<FBoardDTO> searchNickname(FBoardPageMaker fpm) {
		return fboardMapper.searchNickname(fpm);
	}

	
	//페이징을 하기 위해 총 게시물 수 구하는 메서드들
	@Override
	public int getTotalCount() {
		return fboardMapper.getTotalCount();
	}
	@Override
	public int getTitleTotalCount(String search) {
		return fboardMapper.getTitleTotalCount(search);
	}
	@Override
	public int getContentTotalCount(String search) {
		return fboardMapper.getContentTotalCount(search);
	}
	@Override
	public int getTitleContentTotalCount(String search) {
		return fboardMapper.getTitleContentTotalCount(search);
	}
	@Override
	public int getNicknameTotalCount(String search) {
		return fboardMapper.getNicknameTotalCount(search);
	}
	
	
	//조회 페이지 관련 메서드
	@Override
	public FBoardDTO getContent(int f_no) {
		return fboardMapper.getContent(f_no);
	}
	//현재 페이지 이전 글 숫자 구하는 메서드
	@Override
	public int getPrevNum(int f_no) {
		List<FBoardDTO> prevList = fboardMapper.getPrevNum(f_no);
		int prevF_no = 0;
		for(int i=0; i<prevList.size(); i++) {
			if(f_no != prevList.get(i).getF_no()) {
				prevF_no = prevList.get(i).getF_no();
			}
		}
		return prevF_no;
	}
	//현재 페이지 다음 글 숫자 구하는 메서드
	@Override
	public int getNextNum(int f_no) {
		List<FBoardDTO> nextList = fboardMapper.getNextNum(f_no);
		int nextF_no = 0;
		for(int i=0; i<nextList.size(); i++) {
			if(f_no != nextList.get(i).getF_no()) {
				nextF_no = nextList.get(i).getF_no();
			}
		}
		return nextF_no;
	}
	//검색한 현재 페이지 이전 글 숫자 구하는 메서드
	@Override
	public int getSearchPrevNum(int f_no, String select, String search) {
		if(search == null) {
			search = "";
		}
		if(select.equals("TitleContent")) {
			select = "CONCAT(f_title,f_content)";
		}else if(select.equals("title")) {
			select = "f_title";
		}else if(select.equals("content")) {
			select = "f_content";
		}else if(select.equals("nickname")) {
			select = "m.nickname";
			List<FBoardDTO> searchNicknamePrev = fboardMapper.getSearchNicknamePrev(f_no, select, search);
			int nicknamePrevNum = 0;
			for(int i=0; i<searchNicknamePrev.size(); i++) {
				if(f_no != searchNicknamePrev.get(i).getF_no()) {
					nicknamePrevNum = searchNicknamePrev.get(i).getF_no();
				}
			}
			return nicknamePrevNum;
		}
		log.info("\n 검색한 현재 페이지 이전 글 숫자 구하는 메서드 \n"+f_no+"\n"+select+"\n"+search);
		List<FBoardDTO> searchPrevList = fboardMapper.getSearchPrevNum(f_no, select, search);
		int prevF_no = 0;
		for(int i=0; i<searchPrevList.size(); i++) {
			log.info(searchPrevList.get(i).getF_no()+"입니다 크크크");
			if(f_no != searchPrevList.get(i).getF_no()) {
				prevF_no = searchPrevList.get(i).getF_no();
			}
		}
		log.info("\n ************** getSearchPrevNum prevF_no : "+prevF_no);
		return prevF_no;
	}
	//검색한 현재 페이지 다음 글 숫자 구하는 메서드
	@Override
	public int getSearchNextNum(int f_no, String select, String search) {
		if(search == null) {
			search = "";
		}
		if(select.equals("TitleContent")) {
			select = "CONCAT(f_title,f_content)";
		}else if(select.equals("title")) {
			select = "f_title";
		}else if(select.equals("content")) {
			select = "f_content";
		}else if(select.equals("nickname")) {
			select = "m.nickname";
			List<FBoardDTO> searchNicknameNext = fboardMapper.getSearchNicknameNext(f_no, select, search);
			int nicknameNextNum = 0;
			for(int i=0; i<searchNicknameNext.size(); i++) {
				if(f_no != searchNicknameNext.get(i).getF_no()) {
					nicknameNextNum = searchNicknameNext.get(i).getF_no();
				}
			}
			return nicknameNextNum;
		}
		log.info("\n 검색한 현재 페이지 다음 글 숫자 구하는 메서드 \n"+f_no+"\n"+select+"\n"+search);
		List<FBoardDTO> searchNextNum = fboardMapper.getSearchNextNum(f_no, select, search);
		int nextF_no = 0;
		for(int i=0; i<searchNextNum.size(); i++) {
			if(f_no != searchNextNum.get(i).getF_no()) {
				nextF_no = searchNextNum.get(i).getF_no();
			}
		}
		log.info("\n ************** getSearchNextNum nextF_no : "+nextF_no);
		return nextF_no;
	}
	
	
	//다음 글 버튼을 누를때 페이징 이동을 위한 해당 페이지의 가장 큰 글번호 구하는 메서드
	@Override
	public int getPageListMaxiNum(List<FBoardDTO> fboardList) {
		int maxiNum = 0;
		for(int i=0; i<fboardList.size(); i++) {
			if(maxiNum < fboardList.get(i).getF_no()) {
				maxiNum = fboardList.get(i).getF_no();
			}
		}
		log.info("해당 리스트의 맥시넘은 \n"+maxiNum+"입니다 \n");
		return maxiNum;
	}
	//이전 글 버튼을 누를때 페이징 이동을 위한 해당 페이지의 가장 작은 글번호 구하는 메서드
	@Override
	public int getPageListMiniNum(List<FBoardDTO> fboardList, int maxiNum) {
		int miniNum = maxiNum;
		for(int i=0; i<fboardList.size(); i++) {
			if(miniNum > fboardList.get(i).getF_no()) {
				miniNum = fboardList.get(i).getF_no();
			}
		}
		log.info("해당 리스트의 미니넘은 \n"+miniNum+"입니다 \n");
		return miniNum;
	}
	
	//조회수 업데이트(증가)하기 위한 메서드
	@Override
	public void updateReadnum(int f_no) {
		fboardMapper.updateReadnum(f_no);
	}
	@Override
	public void receiveReadnum(int f_no, FBoardDTO fboardContent, FBoardService fboardService,
			HttpServletRequest request, HttpServletResponse response) {
		
		//request의 쿠키들을 가져옵니다
		Cookie[] cookies = request.getCookies();
		//비교하기 위해 새로운 쿠키를 만들었습니다
		Cookie CheckCookie = null;
		
		//쿠키가 있을 경우
		if(cookies !=null && cookies.length>0) {
			for(int i=0; i<cookies.length; i++) {
				log.info("쿠키 이름들..."+cookies[i].getName());
				//cookies의 name중에서 cookie+f_no와 일치하는 쿠키를 CheckCookie에 넣어줌
				if(cookies[i].getName().equals("cookie"+f_no)) {
					log.info("처음 쿠키가 생성한 뒤 들어옴");
					CheckCookie = cookies[i];
				}
			}
		}
		if(fboardContent != null) {
			log.info("해당 상세 페이지로 넘어감");
			
			// 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함
			if(CheckCookie == null) {
				log.info("쿠키 없음");
				
				//쿠키 생성(이름, 값)
				Cookie newCookie = new Cookie("cookie"+f_no, "|" + f_no + "|");
				// 쿠키 추가
                response.addCookie(newCookie);
                // 쿠키를 추가 시키고 조회수 증가시킴
                fboardService.updateReadnum(f_no);
                log.info("조회 수 증가");
			}else {
				log.info("쿠키 있음");
				
				//쿠키 값 받아옴
				String value = CheckCookie.getValue();
				log.info("쿠키 값 : "+value);
			}
		}
	}
	//게시물 삭제 메서드
	@Override
	public void deleteContent(int f_no) {
		fboardMapper.deleteContent(f_no);
	}
	//게시물 등록 메서드
	@Override
	public void insertContent(String f_title, String f_content, int m_no) {
		//제목의 글자가 데이터베이스의 바이트 한도를 넘어설 때를 대비해서 로직을 짰습니다
		//어느 정도 글자를 넘어서면 그 글자 utf-8형식으로 잘라내고 뒤에 "..."을 붙이는 로직입니다 
		String title = f_title;
		//인터넷에서는 한글이 2바트씩 차지한다했는데 여기서는 3바이트씩 차지함...
		//여기서 이 천재인 장현은 의문입니다... 분명 Mysql에서는 f_title의 varchar(60)으로 잡아놨는데... 어쨰서 60이상이어도 500에러가 안뜨는지... 
		//그랬더니 100? 110바이트가 넘어서면 500에러가 뜹니다 
		log.info("제목의 바이트 수 : "+title.getBytes().length);
		//getBytes().length는 해당 객체의 byte수를 구할 수 있습니다!
		if(title.getBytes().length >= 90) { //제목이 만약 90바이트 이상이라면 (mysql에서는 varchar(60)이지만 무슨 이유에서인지 에러가 안뜨므로 90으로 지정)
			StringBuffer storedStr = new StringBuffer(90);	//StringBuffer의 파라미터 안에 숫자를 담을 수 있는데 초기 용량을 90바이트로 지정한것입니다!(일명 안전장치 입니다)
			int count = 0;	//하나하나의 문자 바이트 자체를 카운트 하기 위해 만든 변수입니다
			//제목 title의 하나하나의 문자를 문자 배열로 변환하는 작업입니다
			for(char ch : title.toCharArray()) {
				count += String.valueOf(ch).getBytes().length;	//해당 하는 문자가 1바이트면 +1 , 2바이트면 +2, 3바이트면 +3으로 카운트에 저장합니다
				if(count >= 90) break;	//만약 카운트가 90이상이라면 break로 반복문을 빠져나갑니다
				storedStr.append(ch);	//90이 찰때까지 문자를 StringBuffer 객체에 차곡차곡 담습니다
			}
			//스트링 객체 같은 경우 toString 메서드는 문자열 그 자체를 반환하므로 지금까지 저장된 storedStr에다가 "..." 을 붙인 뒤 title에 대입합니다
			title = storedStr.toString() + "...";
		}
		fboardMapper.insertContent(title, f_content, m_no);
	}
	//게시물 수정 메서드
	@Override
	public void updateContent(String f_title, String f_content, int f_no) {
		log.info("수정데이터의 제목 이름은 "+f_title);
		log.info("수정데이터의 내용 이름은 "+f_content);
		log.info("수정데이터의 글번호 이름은 "+f_no);
		fboardMapper.updateContent(f_title, f_content, f_no);
	}
}

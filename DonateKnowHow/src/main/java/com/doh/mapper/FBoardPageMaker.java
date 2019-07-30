package com.doh.mapper;

import lombok.Getter;
import lombok.extern.java.Log;

@Log
@Getter
public class FBoardPageMaker {

	//  <페이징에 필요한 변수>
	private int totalCount;	//  전체 게시물 갯수
	private int totalPage;	//	전체 페이지 수
	private int listCount = 15;	//  한 페이지당 출력되는 게시글 갯수 (일단은 10으로 초기화!)
	private int pageNum = 1;	//  현재 페이지 번호 (디폴트 1로 잡는다... 아마 컨트롤러에서 1로 받기 때문에 의미는 없지만)
	private int pageCount = 10;	//	하단에(한 섹션 당) 보여지는 페이지 번호 갯수 (일단은 10으로 지정)
	private int startPage;	//  현재 페이지 블록의 시작 페이지
	private int endPage; 	//  현재 페이지 블록의 마지막 페이지
	
	private int calcCount;	//Mysql Limit OffSet에 전달하기 위해 만든 변수(쉽게 말해 즉, Index를 계산합니다)
	
	private String search;
	
	public FBoardPageMaker(int pageNum, int totalCount) {	//전체 페이지 수를 계산하는 메소드
		this.totalCount = totalCount;
		this.pageNum = pageNum;
		totalPage = totalCount / listCount;	// ex) 173 (총 게시글 수) / 10(한 페이지 게시글 갯수) => 17.3 즉 17페이지
		if(totalCount%listCount > 0) {			// 	   하지만 나머지 게시글이 3개가 더 있으므로 
			totalPage++;						//	   +1을 하여 총 18페이지로 구성하게 만듭니다! 
		}
		if(pageNum > totalPage) {	//만약 사용자가 URL로 pageNum을 마지막 페이지 숫자보다 더 큰 숫자로 접근 했을 때
			pageNum = totalPage;	//강제로 마지막 페이지로 지정해둡니다
		}
		startPage = ((pageNum-1)/pageCount)*pageCount +1;	//현재페이지-1 / 섹션 페이지 갯수 * 섹션 페이지 갯수 +1
		//만약 현재 페이지(pageNum)가 11~20 사이에 있다면 우리가 얻고 싶은건 11입니다. 
		//그냥 간단히 생각해서 무슨 연산을 하든 무조건 11이 나오도록 계산식을 만들면 됩니다  (단! 1~10은 1, 21~30은 21, 31~40은 31..... 이런식으로 모든 페이지 블록에서 원하는 값이 나와야겠죠)
		
		endPage = startPage+pageCount-1;
		//startPage를 구했다면 endPage는 구하기 쉽습니다! startPage에다가 listCount를 더하고 1를 빼주기만 하면 되죠!
		
		if(endPage > totalPage) {	//endPage가 totalPage보다 크다면 예를 들어 게시물이 97페이지밖에 없는데 100페이지까지 보여지겠죠? 그러면 안되겠쥬? 
			endPage = totalPage;	//그래서 endPage가 totalPage보다 크다면 totalPage를 대입시켜줍니다
		}
		
		//MySQL의 Limit offset에 계산해서 넣기 위해 만든 식입니다!
		//index 개념으로 이해하시면 될거같습니다!
		//그럼 첫번째 인덱스는 무조건 0부터 시작해서 listCount만큼 증가해야겠죠?
		calcCount = pageNum*listCount-listCount;
		
		log.info("\nFBoardPageMaker의 시작 페이지는 "+startPage+"입니다\n");
		log.info("\nFBoardPageMaker의 끝 페이지는 "+endPage+"입니다\n");
		
		//이 If문은 search로 인해 totalCount가 0일때, 위 로직으로 인해 PageNum이 0이 되므로 calCount가 음수(-10)가 되어버립니다
		//calcCount가 0보다 이하면 Limit Offset에 음수가 들어가게 되므로 오류 방지 차원에서 넣었습니다
		if(calcCount<0) {
			calcCount=0;
		}
	}

	public void setSearch(String search) {
		this.search = search;
	}
}

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboard.css"></link>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboardContent.css"></link>
	<style type="text/css">
		html{
			overflow-x: hidden;
		}
		body{
			font-family: 'Nanum Gothic', sans-serif;
		}
		.replyInput{
			position: relative;
			margin-top: 10%;
			left: 50%
		}
		.replyIn{
			position: relative;
			right: 40%;
		}
		#btnReply{
			margin: 0px;
			height: 80px;
			width: 8%;
			float: left;
			background-color: #2E2E2E;
			color: white;
			border-radius: 10px;
			cursor: pointer;
		}
		.replytext{
			height: 80px;
			width: 60%;
			float: left;
			border: 2px solid #D8D8D8;
			border-radius: 10px;
			padding: 10px;
			margin-bottom: 3%;
			position: relative;
			z-index: 1;
		}
		#replyTable{
			margin-top: 1%;
			table-layout: fixed;
		}
		#replyTable th{
			text-align:left;
			border-bottom: none;
			width:50px;
		}
		#replyTable td{
			text-align:left;
			word-break: break-all;
		}
		td{
			padding: 10px;
		}
		.btn.white{
			background-color: white;
			color: black;
		}
		.btn.white:hover{
			background-color: #2E2E2E;
			color: white;
		}
		*:focus {
    		outline: none;
		}
		pre{
			font-family: 'Nanum Gothic', sans-serif;
			margin:0;
			white-space: pre-wrap;
		}
		#replyModify{ min-height: 37px; overflow: hidden; font-size: 12px; font-family: 'Nanum Gothic', sans-serif; margin:5 0 0 0;}
		.blockBtn{
			background-color: #FFFFFF;
			color: #D8D8D8;
			border: 1px solid #D8D8D8;
			border-radius: 10px;
			font-size: 10px;
			margin: 0;
			padding: 5px 10px;
		}
	</style>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	<div class="container">
		<div></div>
		<div class="content">
			<!-- 상세 페이지 테이블입니다! -->
			<table style="box-shadow: 1px 1px 10px 1px #D8D8D8;">
				<tr>
					<td style="text-align: left;">${fboardContent.f_title}</td>
					<td style="text-align: right;">${fboardContent.f_rdate}</td>
				</tr>	
				<tr>
					<td style="text-align: left;">${fboardContent.nickname}</td>
					<td style="text-align: right;">조회수: ${fboardContent.f_readnum}</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left; padding: 50 20 50 20; border-bottom: none;">${fboardContent.f_content}</td>
				</tr>
			</table>
			
			
			<!-- 이전글 목록 다음글 a태그 입니다! -->
			<c:choose>
				<c:when test='${search != null && select != null}'>	<!-- 검색 값이 없다면 해당 구문 실행 -->
					<c:if test="${prevNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${prevNum}&search=${search}&select=${select}&pageNum=${prevNum >= miniNum ? pageNum : pageNum+1}" style="width: 20%;">이전 글</a>
					</c:if>
					<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageNum}" style="width: 32%;">목록</a>
					<c:if test="${nextNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${nextNum}&search=${search}&select=${select}&pageNum=${nextNum > maxiNum ? pageNum-1 : pageNum}" style="width: 20%;">다음 글</a>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${prevNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${prevNum}&pageNum=${prevNum >= miniNum ? pageNum : pageNum+1}" style="width: 20%;">이전 글</a>
					</c:if>
					<a class="btn silver" href="${path}/fboard/list?pageNum=${pageNum}" style="width: 32%;">목록</a>
					<c:if test="${nextNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${nextNum}&pageNum=${nextNum > maxiNum ? pageNum-1 : pageNum}" style="width: 20%;">다음 글</a>
					</c:if>
				</c:otherwise> 
			</c:choose>
			<hr>
			<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${pinfo.username eq fboardContent.email}">
					<button class="btn update" type="button" style="width: 10%; margin-left: 60%;">수정</button>
					<button class="btn delete" style="width: 10%;">삭제</button>
				</c:if>
			</sec:authorize>
			<!-- 모달 창 만드는 부분 -->
			<div class="modalchang gone">
				<div class="modalchang_overlay"></div>
				<div class="modalchang_content">
					<h2>해당 게시물을 정말 삭제하시겠습니까?</h2>
					<form method="post" action="/fboard/delete" style="display: inline-block;">
						<input type="hidden" name="f_no" value="${fboardContent.f_no}">
						<input type="hidden" name="search" value="${search}">
						<input type="hidden" name="select" value="${select}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<button class="btn">Yes</button>
					</form>
					<button class="btn" id="closeBtn">No</button>
				</div>
			</div>
			
			<div id="replyDiv" class="replyInput">
				<div class="replyIn">
					<!-- 로그인시 나타나게 하는 시큐리티 문법 -->
					<sec:authorize access="isAuthenticated()">
						<textarea class="replytext" id="replytext" placeholder="댓글을 남겨주세요" spellcheck = 'false'></textarea>
						<button id="btnReply" type="button">댓글쓰기</button>
					</sec:authorize>
					<!-- 비로그인시 나타나게 하는 시큐리티 문법 -->
					<sec:authorize access="isAnonymous()">
						<textarea class="replytext" id="replytextBtn" placeholder="로그인 후에 댓글을 남길 수 있습니다..." readonly></textarea>
						<button id="btnReply" type="button">댓글쓰기</button>
					</sec:authorize>
				</div>
			</div>
			<!-- 비로그인시 텍스트에리어 누르면 로그인창 뜨게 만드는 스크립트 -->
			<script type="text/javascript">
				const openBtn2 = document.getElementById("replytextBtn");
				openBtn2.addEventListener("click", openModal);
			</script>
			
			<!-- 이 부분은 AJAX로 처리합니다 -->
			<table id="replyTable">
			</table>
			<div id="replyPagePlace">
				
			</div>
			
			
			<table>
				<tr>
					<td style="width: 10%;">번호</td>
					<td style="width: 45%;">제목</td>
					<td style="width: 20%;">작성자</td>
					<td style="width: 15%;">날짜</td>
					<td style="width: 10%;">조회</td>
				</tr>
				<c:forEach items="${fboardList}" var="list">
				<tr>
					<td class="bno">${list.f_no}</td>
					<c:choose>
						<c:when test='${search==null || search.equals("") || select==null || select.equals("")}'>
							<td style="text-align: left; padding: 0 20 0 20;"><a class="titleLink" href="${path}/fboard/content?f_no=${list.f_no}&pageNum=${pageMaker.pageNum}">${list.f_title}</a>
								<c:if test="${list.fc_count>0}">
									<span style="color: red;"> (${list.fc_count})</span>
								</c:if>
							</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; padding: 0 20 0 20;"><a class="titleLink" href="${path}/fboard/content?f_no=${list.f_no}&search=${search}&select=${select}&pageNum=${pageMaker.pageNum}">${list.f_title}</a>
								<c:if test="${list.fc_count>0}">
									<span style="color: red;"> (${list.fc_count})</span>
								</c:if>
							</td>
						</c:otherwise>
					</c:choose>
					
					<td>${list.nickname}</td>
					<td>${list.f_rdate}</td>
					<td>${list.f_readnum}</td>
				</tr>
				</c:forEach>
			</table>
			<div>
				<form action="/fboard/list" method="get">
					<input type="text" name="search"/>
					<input type="submit" value="Submit"/>
				<select name="select">
					<option value="title" selected="selected">제목</option>
				    <option value="content">내용</option>
				    <option value="TitleContent">제목+내용</option>
				    <option value="nickname">작성자</option>
				</select>
					<sec:authorize access="isAuthenticated()">
						<a class="write" href="${path}/fboard/write">✎ 쓰기</a>
					</sec:authorize>
					<input type="hidden" name="pageNum" value=1>
				</form>
			</div>
			<c:choose>
				<c:when test='${search==null || search.equals("") || select==null || select.equals("")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("title")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("content")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("TitleContent")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("nickname")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
			</c:choose>
			
		</div>
	</div>
	
	<script>
		var height = 0;	//수정 할때 댓글content의 높이를 구하는 변수 (textarea 높이를 적용시키기 위해서)
		
		
		$(function(){
			listReply();	//먼저 JSP가 시작하기 전에 비동기로 댓글리스트 한 페이지(15개)를 가져옵니다 파라미터는 undefind입니다
			listReplyPaging();	//먼저 JSP가 시작하기 전에 비동기로 페이징 계산을 합니다
			$("#btnReply").click(function(){	//댓글 쓰기를 누르면
				reply();	//비동기로 글을 쓰는 메서드입니다
			});
		});
		function reply(){	//비동기 댓글 쓰기
			var fc_content = $("#replytext").val();	//댓글 textarea의 내용을 가져와 변수 fc_content에 담습니다
			var f_no = "${fboardContent.f_no}";	//기본 컨트롤러단에서 포워딩 한 자원(게시글 번호)을 EL을 사용하여 변수 f_no로 담습니다
			var param = {"fc_content":fc_content, "f_no":f_no};	//fc_content(댓글내용),f_no(게시글 번호)를 자바스크립트 오브젝트(JSON) 형태로 변수 param에 저장합니다
			$.ajax({	//제이쿼리 ajax 함수
				type: "post",	//post 형식으로,
				url: "${path}/fcomment/insert",	// ( /fcomment는 RestController에 있습니다[AJAX용])
				data: param,	// JSON을 데이터에 담아보냅니다
				success: function(){	//데이터가 성공적으로 전달되었다면
					listReply();	//listReply() 함수를 실행합니다 (참고로 listReply()는 AJAX를 활용하여 비동기적으로 댓글리스트를 뽑는 함수입니다)
				}
			});
			$("#replytext").val('');	//작업이 모두 끝났으면 textarea를 깔끔하게 청소합니다
		}
		function replyAnswer(num, parentNum){
			var fc_content = $("#replyResponse").val();
			var f_no = "${fboardContent.f_no}";
			var param = {"fc_parent":parentNum, "fc_content":fc_content, "f_no":f_no};
			$.ajax({
				type: "post",
				url: "${path}/fcomment/insert",
				data: param,
				success: function(){
					listReply2(num);
				}
			});
		}
		function listReply(num){
			if(num != undefined){
				$('html, body').animate({
	     			scrollTop: $('#replyDiv').offset().top
				}, 500);
			}
			if(num == undefined) num = 1;	//num의 값이 undefined이면 1로 지정해서 첫페이지의 리스트를 뽑게 만듭니다
			$.ajax({
				type: "get",	//겟 방식으로 게시글 번호와 파라미터로 받은 num을 /fcomment/list?에 보냅니다
				url: "${path}/fcomment/list?f_no=${fboardContent.f_no}&replyPageNum="+num,	//마찬가지로 RestController단에 접근합니다
				//get 방식은 post 방식이 아니기 때문에 data가 없습니다
				success: function(replyList){	//성공시 리턴 받은 객체를 파라미터로 받고 익명함수를 바로 실행합니다
					const conUserEmail = '<c:out value="${userEmail}"/>';
					console.log("현재 당신이 접속한 아이디는 "+conUserEmail);
					console.log(replyList);	
					var output="";	//지정해둔 영역으로 보낼 문자열을 만들고 초기화합니다
					for(var i in replyList){	//ex)for(int i : replyList){...}(향상된 for문)과 비슷하다
						if(replyList[i].fc_parent == null){	//대댓글이 아닌 댓글이라면
							output += "<thead>";
							output += "<tr>";
							output += "<th style='font-size:15px;'>"+replyList[i].nickname+"<th>";
							output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
							output += "</tr>";
							output += "<tr>";
							output += "<td colspan='3' style='border-bottom: none; font-size:13px;'><pre>"+replyList[i].fc_content+"</pre></td>";
							output += "</tr>";
							output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
							output += "<button class='btn' style='font-size: 10px;' onclick='listReply2("+num+","+replyList[i].fc_no+",\"답글\")'>답글</button></sec:authorize></td>";
							output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
							if(conUserEmail == replyList[i].email){
								output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
								output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
							}
							output += "</sec:authorize></td></tr>";
							output += "</thead>";
						}else{	//대댓글이라면
							output += "<thead>";
							output += "<tr>";
							output += "<th style='font-size:15px; padding-left:30px;'>💬"+replyList[i].nickname+"<th>";
							output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
							output += "</tr>";
							output += "<tr>";
							output += "<td colspan='3' style='border-bottom: none; font-size:13px; padding-left:6%;'><pre>"+replyList[i].fc_content+"</pre></td>";
							output += "</tr>";
							output += "<tr><td colspan='3' style='padding:5; text-align:right;'><sec:authorize access='isAuthenticated()'>";
							if(conUserEmail == replyList[i].email){
								output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
								output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
							}
							output += "</sec:authorize></td></tr>";
							output += "</thead>";
						}	
					}
					$("#replyTable").html(output); //id가 replyTable인 영역에 output이라는 완성시킨 문자열을 html코드로 보낸다 
				}
			});
			listReplyPaging(num);	//마무리로 다시 페이징을 계산한다 (이유는 댓글이 계속 생겨날때 비동기로 페이지가 늘어나게 하기 위함이다)
		}
		
		function listReply2(num, fc_no, command){	//삭제 시 현재 페이지를 유지하기 위해서 listReply2를 따로 만듬
			console.log("command 값은 ? "+ command);
			if(num == undefined) num = 1;	//num의 값이 undefined이면 1로 지정해서 첫페이지의 리스트를 뽑게 만듭니다
			$.ajax({
				type: "get",	//겟 방식으로 게시글 번호와 파라미터로 받은 num을 /fcomment/list?에 보냅니다
				url: "${path}/fcomment/list?f_no=${fboardContent.f_no}&replyPageNum="+num,	//마찬가지로 RestController단에 접근합니다
				//get 방식은 post 방식이 아니기 때문에 data가 없습니다
				success: function(replyList){	//성공시 리턴 받은 객체를 파라미터로 받고 익명함수를 바로 실행합니다
					const conUserEmail = '<c:out value="${userEmail}"/>';
					var output="";	//지정해둔 영역으로 보낼 문자열을 만들고 초기화합니다
					if(fc_no == undefined){		//댓글번호가 정의되어지지 않았을 때 (기본 리스트나 삭제버튼으로 왔을 때)
						for(var i in replyList){	//ex)for(int i : replyList){...}(향상된 for문)과 비슷하다
							if(replyList[i].fc_parent == null){
								output += "<thead>";
								output += "<tr>";
								output += "<th style='font-size:15px;'>"+replyList[i].nickname+"<th>";
								output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
								output += "</tr>";
								output += "<tr>";
								output += "<td colspan='3' style='border-bottom: none; font-size:13px;'><pre>"+replyList[i].fc_content+"</pre></td>";
								output += "</tr>";
								output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
								output += "<button class='btn' style='font-size: 10px;' onclick='listReply2("+num+","+replyList[i].fc_no+",\"답글\")'>답글</button></sec:authorize></td>";
								output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
								if(conUserEmail == replyList[i].email){
									output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
									output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
								}
								output += "</sec:authorize></td></tr>";
								output += "</thead>";
							}else{
								output += "<thead>";
								output += "<tr>";
								output += "<th style='font-size:15px; padding-left:30px;'>💬"+replyList[i].nickname+"<th>";
								output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
								output += "</tr>";
								output += "<tr>";
								output += "<td colspan='3' style='border-bottom: none; font-size:13px; padding-left:6%;'><pre>"+replyList[i].fc_content+"</pre></td>";
								output += "</tr>";
								output += "<tr><td colspan='3' style='padding:5; text-align:right;'><sec:authorize access='isAuthenticated()'>";
								if(conUserEmail == replyList[i].email){
									output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
									output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
								}
								output += "</sec:authorize></td></tr>";
								output += "</thead>";
							}
						}
					}else{	//댓글번호가 정의되어 있으면 (수정 버튼 또는 답글 버튼으로 넘어왔다는 뜻)
						for(var i in replyList){	//ex)for(int i : replyList){...}(향상된 for문)과 비슷하다
							if(replyList[i].fc_parent == null){
								output += "<thead>";
								output += "<tr>";
								output += "<th style='font-size:15px;'>"+replyList[i].nickname+"<th>";
								output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
								output += "</tr>";
								output += "<tr>";
								if(command == '수정'){
									if(fc_no == replyList[i].fc_no){	//파라미터로 넘어온 댓글번호와 리스트중에 댓글번호가 같으면
										console.log("... 대댓글 번호 맞냐?"+replyList[i].fc_no);
										output += "<td colspan='3' style='border-bottom: none; font-size:13px; padding:0;'><pre><textarea onkeydown='resize(this)' onkeyup='resize(this)' class='replytext' id='replyModify' style='width:100%;' spellcheck = 'false'>"+replyList[i].fc_content+"</textarea></pre></td>";
										output += "</tr>";
										output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
										output += "</sec:authorize></td>";
										output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
										if(conUserEmail == replyList[i].email){
											output += "<button class='btn' style='font-size: 10px;' onclick='updateReply("+num+","+fc_no+")'>완료</button>";
											output += "<button class='btn' style='font-size: 10px;' onclick='listReply2("+num+")'>취소</button>";
										}
										output += "</sec:authorize></td></tr>";
										output += "</thead>";
									}else{
										output += "<td colspan='3' style='border-bottom: none; font-size:13px;'><pre>"+replyList[i].fc_content+"</pre></td>";
										output += "</tr>";
										output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
										output += "<button class='btn' style='font-size: 10px;' onclick='listReply2("+num+","+replyList[i].fc_no+",\"답글\")'>답글</button></sec:authorize></td>";
										output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
										if(conUserEmail == replyList[i].email){
											output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
											output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
										}
										output += "</sec:authorize></td></tr>";
										output += "</thead>";
									}
								}else if(command == '답글'){
									if(fc_no == replyList[i].fc_no){	//파라미터로 넘어온 댓글번호와 리스트중에 댓글번호가 같으면
										output += "<td colspan='3' style='border-bottom: none; font-size:13px;'><pre>"+replyList[i].fc_content+"</pre></td>";
										output += "</tr>";
										output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
										output += "<button class='blockBtn' disabled>답글</button></sec:authorize></td>";
										output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
										if(conUserEmail == replyList[i].email){
											output += "<button class='blockBtn' disabled>수정</button>";
											output += "<button class='blockBtn' disabled>삭제</button>";
										}
										output += "</sec:authorize></td></tr>";
										output += "</thead>";
									}else{
										output += "<td colspan='3' style='border-bottom: none; font-size:13px;'><pre>"+replyList[i].fc_content+"</pre></td>";
										output += "</tr>";
										output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
										output += "<button class='btn' style='font-size: 10px;' onclick='listReply2("+num+","+replyList[i].fc_no+",\"답글\")'>답글</button></sec:authorize></td>";
										output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
										if(conUserEmail == replyList[i].email){
											output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
											output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
										}
										output += "</sec:authorize></td></tr>";
										output += "</thead>";
									}
									if(fc_no == replyList[i].fc_no){
										output += "<thead><tr>";
										output += "<td style='border-bottom:none; font-size: 40px; padding:0; text-align:center;'>💬</td>";
										output += "<td colspan='2' style='border-bottom: none; font-size:13px; padding:0;'><pre><textarea onkeydown='resize(this)' onkeyup='resize(this)' id='replyResponse' class='replytext' style='width:100%; margin:0; height:37px; overflow:hidden;' spellcheck = 'false' placeholder='답글을 작성하세요'></textarea></pre></td>";
										output += "<tr>";
										output += "<td style='padding:5;'></td>";
										output += "<td colspan='2' style='padding:5;'>";
										output += "<button class='btn' style='font-size:10px;' onclick='replyAnswer("+num+","+replyList[i].fc_no+")'>작성</button>";
										output += "<button class='btn' style='font-size:10px;' onclick='listReply2("+num+")'>취소</button>";
										output += "</td>";
										output += "</tr>";
										output += "</tr></thead>";
									}
								}else{
									output += "<td colspan='3' style='border-bottom: none; font-size:13px;'><pre>"+replyList[i].fc_content+"</pre></td>";
									output += "</tr>";
									output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
									output += "<button class='btn' style='font-size: 10px;' onclick='listReply2("+num+","+replyList[i].fc_no+",\"답글\")'>답글</button></sec:authorize></td>";
									output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
									if(conUserEmail == replyList[i].email){
										output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
										output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
									}
									output += "</sec:authorize></td></tr>";
									output += "</thead>";
								}
							
							}else{
								if(fc_no == replyList[i].fc_no){	//파라미터로 넘어온 댓글번호와 리스트중에 댓글번호가 같으면
									console.log("... 대댓글 번호 맞냐?"+replyList[i].fc_no);
									output += "<thead>";
									output += "<tr>";
									output += "<th style='font-size:15px; padding-left:30px;'>💬"+replyList[i].nickname+"<th>";
									output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
									output += "</tr>";
									output += "<tr>";
									output += "<td colspan='3' style='border-bottom: none; font-size:13px; padding:0; padding-left:6%;'><pre><textarea onkeydown='resize(this)' onkeyup='resize(this)' class='replytext' id='replyModify' style='width:100%;' spellcheck = 'false'>"+replyList[i].fc_content+"</textarea></pre></td>";
									output += "</tr>";
									output += "<tr><td style='padding:5;'><sec:authorize access='isAuthenticated()'>";
									output += "</sec:authorize></td>";
									output += "<td colspan='2' style='text-align: right; padding:5;'><sec:authorize access='isAuthenticated()'>";
									if(conUserEmail == replyList[i].email){
										output += "<button class='btn' style='font-size: 10px;' onclick='updateReply("+num+","+fc_no+")'>완료</button>";
										output += "<button class='btn' style='font-size: 10px;' onclick='listReply2("+num+")'>취소</button>";
									}
									output += "</sec:authorize></td></tr>";
									output += "</thead>";
								}else{
									output += "<thead>";
									output += "<tr>";
									output += "<th style='font-size:15px; padding-left:30px;'>💬"+replyList[i].nickname+"<th>";
									output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
									output += "</tr>";
									output += "<tr>";
									output += "<td colspan='3' style='border-bottom: none; font-size:13px; padding-left:6%;'><pre>"+replyList[i].fc_content+"</pre></td>";
									output += "</tr>";
									output += "<tr><td colspan='3' style='padding:5; text-align:right;'><sec:authorize access='isAuthenticated()'>";
									if(conUserEmail == replyList[i].email){
										output += "<button class='btn' style='font-size: 10px;' onmouseenter='getHeight(this)' onclick='listReply2("+num+","+replyList[i].fc_no+",\"수정\")'>수정</button>";
										output += "<button class='btn' style='font-size: 10px;' onclick='deleteReply("+replyList[i].fc_no+","+num+")'>삭제</button>";
									}
									output += "</sec:authorize></td></tr>";
									output += "</thead>";
								}
								
							}
						}
					}
					$("#replyTable").html(output); //id가 replyTable인 영역에 output이라는 완성시킨 문자열을 html코드로 보낸다 
					var replyTextarea = $("#replyModify");
					var val = replyTextarea.val();
					replyTextarea.focus().val("").val(val);	//이걸 하면 커서가 마지막으로 간다
					console.log("높이의 값은?"+height);
					$("#replyModify").css("height", height+"px");
				}
			});
			listReplyPaging(num);	//마무리로 다시 페이징을 계산한다 (이유는 댓글이 계속 삭제될때 페이지가 줄어들게 하기 위함이다)
		}
		function resize(obj) {	//댓글의 textarea의 글이 범위를 넘어설 때 마다 자동으로 크기를 조정시키기 위한 함수
			obj.style.height = "1px";
		  	obj.style.height = (12+obj.scrollHeight)+"px";
		}
		function getHeight(obj){
			height = $(obj).parent().parent().prev().height();
		}
		
		
		function deleteReply(replyNum,num){
			console.log("야이야이야이야이 deleteReply의 댓글 넘버 값은? "+replyNum);
			console.log("야이 deleteReply의 페이지 값은? "+num);
			var fc_no = replyNum;
			var param = {"fc_no":fc_no};
			$.ajax({
				type: "post",
				url: "${path}/fcomment/delete",
				data: param,
				success: function(){
					listReply2(num);
				}
			});
		}
		function updateReply(num, fc_no){
			if(num == undefined) num = 1;
			var fc_content = $("#replyModify").val();
			var param = {"fc_no":fc_no, "fc_content":fc_content};
			$.ajax({
				type: "post",
				url: "${path}/fcomment/modify",
				data: param,
				success: function(){
					listReply2(num);
				}
			});
		}
		function listReplyPaging(num){	//댓글 페이징을 하기 위한 함수 
			if(num == undefined) num = 1;	//파라미터로 받은 숫자가 udefined이면 1페이지가 출력되게 1로 기본값 설정
			$.ajax({
				type: "get",
				url: "${path}/fcomment/replyPaging?f_no=${fboardContent.f_no}&replyPageNum="+num,
				success: function(replyPaging){	//get방식으로 호출해서 리턴 받든 객체를 파라미터에 담고 익명함수를 실행시킵니다
					console.log(replyPaging);
					var outPage = "";	//listReply와 마찬가지로 html코드로 보낼 문자열 변수
					var replyStartPage = Number(replyPaging.startPage);	//객체(페이징 처리 오브젝트)의 시작페이지를 변수 replyStartPage에 담습니다
					var replyEndPage = Number(replyPaging.endPage);	//객체(페이징 처리 오브젝트)의 끝 페이지를 변수 replyEndPage에 담습니다
					var replyTotalPage = Number(replyPaging.totalPage);	//객체(페이징 처리 오브젝트)의 총 페이지를 변수 replyTotalPage에 담습니다
					console.log("섹션페이지 첫 페이지넘버는 "+replyStartPage);
					console.log("섹션페이지 끝 페이지넘버는"+replyEndPage);
					console.log("제일 끝 페이지넘버는 "+replyTotalPage);
					
					for(var i=replyStartPage; i<=replyEndPage; i++){	//섹션 시작페이지부터 섹션 끝 페이지까지 알맞은 페이지 숫자를 뽑기 위해서 반복문을 돌립니다
						if(replyEndPage>1){		//섹션의 끝 페이지가 1보다 더 클 때만 발동되게 조건을 줘서 페이지가 2개 이상일때만 처음 버튼과 이전 버튼이 만들어지게 합니다
							if(i==replyStartPage){	//이 조건은 아예 처음 시작할 때(위의 for문을 보면 알겠지만, var i를 replyStartPage로 초기화하자나요... 그러니깐 아예 처음부터라는 거죠)
								//처음 버튼과 이전 버튼을 각각 하나씩만 생성하게 하기 위해서 준 조건입니다
								outPage += "<button class='btn white' onclick='listReply(";
								outPage += 1;	//1를 파라미터로 지정해서 첫 번째 페이지를 리스트를 뽑게 합니다 
								outPage += ")'>";
								outPage += "↩↩";
								outPage += "</button>";
								if(replyStartPage>1){	//시작 페이지가 1(즉, 첫 번째 섹션 페이지라는 뜻)보다 클 때만, (그러니깐 1~10페이지 섹션에서는 아래 작업을 하지 않습니다!)
									//시작 페이지가 1보다 클 때만, 이전 버튼을 생성합니다
									outPage += "<button class='btn white' onclick='listReply(";
									outPage += (replyStartPage-1);	//섹션의 시작페이지보다 -1를 하면 한단계 아래의 섹션의 끝페이지로 이동합니다
									outPage += ")'>";
									outPage += "↩";
									outPage += "</button>";
								}
							}
							outPage += "<button class='btn white num' onclick='listReply(";
							outPage += i;	//반복문을 돌려 섹션 시작페이지부터 섹션 끝페이지까지의 숫자를 받고 listReply(num), num 파라미터에 값을 할당합니다
							//그렇다면, listReply(num) 함수는 파라미터로 숫자를 받고 알맞은 리스트를 비동기로 보여줍니다
							outPage += ")'>";
							outPage += i;	//사용자에게 눈에 보이게 버튼 겉에 숫자를 새깁니다
							outPage += "</button>";
							if(i==replyEndPage){	//다음 버튼과 끝 버튼을 하나씩만 생성하기 위해서 반복문 변수 i가 섹션의 끝 페이지와 같으면 조건문 실행을 하게 했습니다
								if(replyEndPage<replyTotalPage){	//섹션의 끝 페이지가 총 페이지보다 작을 때 까지 다음 버튼을 보이게 하기 위해서 if조건을 걸어줍니다
									//예를 들어 77페이지가 총 페이지인데 섹션의 끝 페이지가 80일테니 80<77은 거짓이므로 아래 구문은 실행되지 않겠죠?
									outPage += "<button class='btn white' onclick='listReply(";
									outPage += (replyEndPage+1);	//버튼을 클릭시 섹션 끝페이지+1를 하여 끝페이지의 다음페이지로 넘어가게 합니다
									outPage += ")'>";
									outPage += "↪";
									outPage += "</button>";
								}
								outPage += "<button class='btn white' onclick='listReply(";
								outPage += replyTotalPage;	//버튼을 클릭시 총 페이지의 숫자를 파라미터로 listReply(num)을 실행합니다
								outPage += ")'>";
								outPage += "↪↪";
								outPage += "</button>";
							}
						}
					}
					$("#replyPagePlace").html(outPage);	//완성된 문자열을 id가 replyPagePlace인 영역에 html코드로 보냅니다
					if(num == 1){
						var nowBtn = $(".btn.white.num:contains('"+num+"')");
						$(nowBtn).css( 'color', 'white' );
						$(nowBtn).css( 'background-color', 'black' );
						var tenBtn = $(".btn.white.num:contains('10')");
						$(tenBtn).css( 'color', 'black' );
						$(tenBtn).css( 'background-color', 'white' );
						$(tenBtn).hover(function() {
							$(tenBtn).css( 'color', 'white' );
							$(tenBtn).css( 'background-color', '#2E2E2E' );
						}, function(){
							$(tenBtn).css( 'color', 'black' );
							$(tenBtn).css( 'background-color', 'white' );
						});
					}else{
						var nowBtn = $(".btn.white.num:contains('"+num+"')");
						$(nowBtn).css( 'color', 'white' );
						$(nowBtn).css( 'background-color', 'black' );
					}
				}
			});
		}
	</script>
	<%@include file="../includes/footer.jsp" %>
</body>
<script src="${path}/resources/js/fboard/fboard.js"></script>
<script src="${path}/resources/js/fboard/fboardContent.js"></script>
</html>

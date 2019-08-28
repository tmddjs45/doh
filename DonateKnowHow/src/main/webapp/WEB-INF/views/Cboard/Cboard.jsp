<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/frame.css"></link>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>

</style>
<body style="text-align: center;">
	<%@include file= "../includes/header.jsp" %>
				<!--  	<button class="Btn" type="button" onclick="aa()" style="border: none; border-radius: 10px;">버튼입니당!</button>-->
		<div class = "cb-container">
			<div class="cb-list">
			<table border='1' width='600' align='center' cellpadding='2'>
			<tr>
				<th align='center' width='10%'>글번호</th>
				<th align='center' width='15%'>작성자</th>
				<th align='center' width='15%'>제목</th>
				<th align='center' width='15%'>작성일</th>
			</tr>
			
			<c:forEach items="${list}" var = "board">
			<tr>
				<th align='center' width='10%'><c:out value="${board.c_no}"/></th>
				<th align='center' width='15%'><c:out value="${board.nickname}"/></th>
				<th align='center' width='15%'><a href="content?c_no=${board.c_no}"><c:out value="${board.c_title}"/></a></th>
				<th align='center' width='15%'><c:out value="${board.c_rdate}"/></th>
			</tr>
			</c:forEach>
		</table>
			</div>
			<div class="cb-serch">
			
			serch
			</div>
			<div class="cb-paging">
					<c:if test="${cr.startPage>1}">
						<a href="${path}/cboard/list?pageNum=1">처음</a>
						<a href="${path}/cboard/list?pageNum=${cr.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${cr.startPage}" end="${cr.endPage}">
						<a  href="${path}/cboard/list?pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${cr.endPage<cr.totalPage}">
						<a href="${path}/cboard/list?pageNum=${cr.endPage+1}">다음</a>
						<a href="${path}/cboard/list?pageNum=${cr.totalPage}">끝</a>
					</c:if>
			</div>
			<div class="cb-crudbtn">
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.member.nickname"
					var="nickname" />
				<a href="${path}/cboard/insertform">작성</a>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
			</sec:authorize>
		</div>
		</div>	
	<%@include file="../includes/footer.jsp" %>
	<%@include file="../includes/openS.jsp" %>
</body>
<script>
	function aa(){
		//document.querySelector('.Btn').innerHTML="버튼아니지롱";
		$('.Btn').text("하잉");
	}
</script>
<!--  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>D'oh</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/cboard/cboardList.css"></link>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
</style>
<body>
	<%@include file="../includes/header.jsp"%>

	<div class="cb-container">
		<div class="empty_left"></div>
		
		<div class="cb-list">
			<table>
				<thead>
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 45%;">제목</th>
						<th style="width: 20%;">작성자</th>
						<th style="width: 15%;">날짜</th>
						<th style="width: 10%;">조회</th>
					</tr>
				</thead>

				<c:forEach items="${list}" var="board">
				<tbody>
					<tr>
						<td><c:out value="${board.c_no}" /></td>
						<td class="list-title"><a href="content?c_no=${board.c_no}"><c:out value="${board.c_title}" /></a></td>
						<td><c:out value="${board.nickname}" /></td>
						<td><c:out value="${board.c_rdate}" /></td>
						<td><c:out value="0" /></td>
					</tr>
				</tbody>
				</c:forEach>
			</table>

			<div class="cb-search">
				<form name="searchForm" action="" method="post">
					<select name="select">
						<option value="title" selected="selected">제목</option>
					    <option value="content">내용</option>
					    <option value="TitleContent">제목+내용</option>
					    <option value="nickname">작성자</option>
					</select>
					<input type="text" name="search" onkeyup="cboardSearchEnterKey()"/>
					<button class="searchBtn" type="button" onclick="cboardSearchBtn()"></button>
					<a class="write" href="#">✎ 쓰기</a>
					<input type="hidden" name="pageNum" value=1>
				</form>
			</div>
			
									<!-- ##### Pagination Start ##### -->
			<div class="cb-paging">
			
				<c:if test="${cr.startPage>1}">
					<a class ="first-btn" href="${path}/cboard/list?pageNum=1">처음</a>
					<a class ="prev-btn" href="${path}/cboard/list?pageNum=${cr.startPage-1}">이전</a>
				</c:if>
				<ul>
				<c:forEach var="num" begin="${cr.startPage}" end="${cr.endPage}">
					<li><a class="pagination_btn" href="${path}/cboard/list?pageNum=${num}">${num}</a></li>
				</c:forEach>
				</ul>
				<c:if test="${cr.endPage<cr.totalPage}">
					<a class ="next-btn" href="${path}/cboard/list?pageNum=${cr.endPage+1}">다음</a>
					<a class ="end-btn" href="${path}/cboard/list?pageNum=${cr.totalPage}">끝</a>
				</c:if>
				
			</div>
									<!-- ##### Pagination End ##### -->
		</div>
		
		<div class="empty_right"></div>
	</div>


	<%@include file="../includes/footer.jsp"%>
</body>
<script>
	function aa() {
		//document.querySelector('.Btn').innerHTML="버튼아니지롱";
		$('.Btn').text("하잉");
	}
	
	const firstPage = "list"
	let currentPageLink = document.URL;
	console.log(currentPageLink);
	currentPageLink = currentPageLink.substr(currentPageLink.lastIndexOf("/")+1);
	console.log(currentPageLink);
		
	let page = document.querySelectorAll('.pagination_btn');
	console.log(page);
	console.log(page[1].getAttribute('href'));
		
	if(currentPageLink == firstPage ){
		page[0].style.color ="red";
		page[0].style.fontSize = "22px";
		page[0].style.fontWeight = "900";
	}

	for(let i=0; i<page.length;i++){
		realPageLink = "/cboard/"+currentPageLink;
		
		if(realPageLink === page[i].getAttribute('href')){
			page[i].style.color ="red";
			page[i].style.fontSize = "22px";
			page[i].style.fontWeight = "900";
		}
	}

	function cboardSearchEnterKey(){
		if (window.event.keyCode == 13) {
			cboardSearchBtn();
	    }
	}
		
	function cboardSearchBtn(){
		alert("준비중입니다. :) ");
	}
</script> -->

</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboard.css"></link>
	<style type="text/css">
		td{
			padding-top: 10px;
			padding-bottom: 10px;
		}
	</style>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	<div class="container">
		<div></div>
		<div class="content">
			<table>
				<tr>
					<th style="width: 10%;">번호</th>
					<th style="width: 45%;">제목</th>
					<th style="width: 20%;">작성자</th>
					<th style="width: 15%;">날짜</th>
					<th style="width: 10%;">조회</th>
				</tr>
				<c:forEach items="${fboardList}" var="list">
				<tr>
					<td>${list.f_no}</td>
					<c:choose>
						<c:when test='${search==null || search.equals("") || select==null || select.equals("")}'>
							<td style="text-align: left; padding: 0 20 0 20;"><a class="titleLink" href="${path}/fboard/content?f_no=${list.f_no}&pageNum=${pageMaker.pageNum}">${list.f_title}</a>
								<!-- 댓글 갯수 제목 옆에 붙이기 -->
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
				<form name="searchForm" action="/fboard/list" method="get">
					<select name="select">
						<option value="title" selected="selected">제목</option>
					    <option value="content">내용</option>
					    <option value="TitleContent">제목+내용</option>
					    <option value="nickname">작성자</option>
					</select>
					<input type="text" name="search" onkeyup="fboardSearchEnterKey()"/>
<!-- 					<input type="submit" value="Submit"/> -->
					<button class="searchBtn" type="button" onclick="fboardSearchBtn()"></button>
				
					<a class="write" href="${path}/fboard/write">✎ 쓰기</a>
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
		<div></div>
	</div>
	<%@include file="../includes/footer.jsp" %>
<script>
	
	function fboardSearchEnterKey(){
		if (window.event.keyCode == 13) {
			fboardSearchBtn();
	    }
	}
	
	function fboardSearchBtn(){
		searchForm.submit();
	}

</script>
</body>
<script src="${path}/resources/js/fboard/fboard.js"></script>
</html>

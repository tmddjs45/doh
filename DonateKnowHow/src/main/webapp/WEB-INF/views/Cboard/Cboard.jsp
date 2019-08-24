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
</html>

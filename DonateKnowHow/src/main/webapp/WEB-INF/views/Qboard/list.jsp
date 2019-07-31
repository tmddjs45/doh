<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<style type="text/css">
ul {
	text-align: center;
}

li {
	display: inline-block;
	list-style-type: none;
	margin: 5px;
}

#qtable tr {
	align: center;
}
</style>
<title>LIST</title>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div align='center'>
		<a>총 질문 N 개</a> <input name="serch" type="text">검색 <a
			href="input"> 글쓰기 </a>
	</div>
	<c:forEach items="${list}" var="qboard">
		<table id='qtable' border='1' width='600' align='center'>
			<br />
			<tr>
				<!-- 제목 -->
				<td colspan='4'><c:out value='${qboard.q_title}' /></a></td>
			</tr>
			<tr>
				<!-- 내용 -->
				<td colspan='4'><c:out value='${qboard.q_content}' /></td>
			</tr>
			<tr>
				<!-- 채택 글씨 비활성화(회색) 되어있다가 채택 시 활성화(노란색?금색?) -->
				<td rowspan='3' width='20%'>답변유무?</td>
				<!-- 닉네임 -->
				<td rowspan='3' width='50%'><c:out value='${qboard.nickname}' /></td>
			<tr>
				<!-- 날짜 -->
				<td><c:out value='${qboard.q_rdate}' /></td>
			</tr>
			<tr>
				<!-- 조회수 -->
				<td><c:out value='${qboard.q_count}' /></td>
			</tr>
			<tr>
				<td><a href="content${cr.makeQuery(cr.num)}&q_no=${qboard.q_no}">Q_no
						:: <c:out value='${qboard.q_no}' /></td>
			</tr>
			</tr>
		</table>
	</c:forEach>
	<hr width='600' size='2' noshade>
	</table>
	<table border='1' width='600' align='center' cellpadding='2' />
	<!--  페이징  -->
	<div align='center'>
		<c:if test='${cr.pre}'>
			<a href='list${cr.makeQuery(cr.pageStart-1)}'> <span aria-hidden='true'>이전</span>
			</a>
		</c:if>
		<c:forEach var='num' begin='${cr.pageStart}' end='${cr.pageEnd}'>
			<li class="paginate_button ${cr.pageView == num ? "active":""}">
				<a href="list${cr.makeQuery(num)}">${num}</a>
			</li>
		</c:forEach>
		<c:if test='${cr.next}'>
			<a href='list${cr.makeQuery(cr.pageEnd+1)}'> <span
				aria-hidden='true'>다음</span>
			</a>
		</c:if>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
		$(document).ready(function() {
			$('.paginate_button a').on('click', function(e) {
				e.preventDefault();
				submit();
			});
		});
	</script>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>
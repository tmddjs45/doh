<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
	<title>Q & A</title>
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
</head>

<body>
	<%@include file="../includes/header.jsp"%>
	
	<div align='center'>
		<a>질문 ${cr.total} 개</a> <input name="serch" type="text">검색 <a
			href="input"> 글쓰기 </a>
	</div>
	<c:forEach items="${list}" var="list">
		<table id='qtable' border='1' width='600' align='center'>
			<br />
			<tr>
				<td rowspan='3' width='20%'>Q_no :: <c:out value='${list.q_no}' /></td>
			<tr>
				<td colspan='3'><a href="content${cr.makeQuery(cr.num)}&q_no=${list.q_no}">
												<c:out value='${list.q_title}' /></a></td>
			</tr>
			<tr>
				<td colspan='3'><c:out value='${list.q_content}' /></td>
			</tr>
			<tr>
				<td rowspan='3' width='20%'>답변유무?</td>
				<td rowspan='3' width='50%'><c:out value='${list.nickname}' /></td>
			<tr>
				<td><c:out value='${list.q_rdate}' /></td>
			</tr>
			<tr>
				<td><c:out value='${list.q_count}' /></td>
			</tr>
			</tr>
		</table>
	</c:forEach>
	
	<hr width='600' size='2' noshade style="margin-top: 20px;">
	
	<!--  페이징  -->
	<div align='center'>
		<c:if test='${cr.pre}'>
			<a href='list${cr.makeQuery(cr.pageStart-1)}'> <span
				aria-hidden='true'>이전</span>
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
	
	<%@include file="../includes/footer.jsp"%>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
		$(document).ready(function() {
			$('.paginate_button a').on('click', function(e) {
				e.preventDefault();
				$(this).submit();
			});
		});
</script>
</html>
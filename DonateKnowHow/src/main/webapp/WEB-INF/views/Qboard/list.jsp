<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>Q & A</title>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/css/qboard/qboardList.css"></link>
</head>
<body>
	<%@include file="../includes/header.jsp"%>


	<div class="wrapper">
		<div class="empty_left"></div>
		<div class="content">
			<div class="searchLine" align='center'>
				<label>${cr.total} Questions</label> <input name="serch" type="text"
					onkeyup="searchEnterKey()" />
				<button class="searchBtn" type="button" onclick="searchBtn()"></button>
			</div>

			<c:forEach items="${list}" var="list">
				<div class="boardQA">
					<div class="boardQA-info">
						<div><c:out value='${list.q_no}' /></div>
						<img src="${path}/resources/img/checking.png">
						<div>views:&nbsp;&nbsp;<c:out value='${list.q_count}' /></div>
					</div>
					
					<div class="boardQA-content">
						<h3><a href="content${cr.makeQuery(cr.num)}&q_no=${list.q_no}"><c:out value='${list.q_title}' /></a></h3>
						<div><c:out value='${list.nickname}' />testNick</div>
						<div><c:out value='${list.q_content}'/>Test 쓰는글란입니다Test글란입니다Te글란입니다Te글란입니다Te글란입니다Te글란입니다Te글란입니다Te 쓰는글란입니다Test 쓰는글란입니다Test 쓰는글란입니다Test 쓰는글란입니다.</div>
						<div><c:out value='${list.q_rdate}' /></div>
					</div>
				</div>
			
<!-- 				<table id='qtable' border='1' width='600' align='center'> -->
<!-- 					<br /> -->
<!-- 					<tr> -->
<%-- 						<td rowspan='3' width='20%'>Q_no :: <c:out --%>
<%-- 								value='${list.q_no}' /></td> --%>
<!-- 					<tr> -->
<!-- 						<td colspan='3'><a -->
<%-- 							href="content${cr.makeQuery(cr.num)}&q_no=${list.q_no}"> <c:out --%>
<%-- 									value='${list.q_title}' /></a></td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<td colspan='3'><c:out value='${list.q_content}' /></td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td rowspan='3' width='20%'>답변유무?</td> -->
<%-- 						<td rowspan='3' width='50%'><c:out value='${list.nickname}' /></td> --%>
<!-- 					<tr> -->
<%-- 						<td><c:out value='${list.q_rdate}' /></td> --%>
<!-- 					</tr> -->
<!-- 					<tr> -->
<%-- 						<td><c:out value='${list.q_count}' /></td> --%>
<!-- 					</tr> -->
<!-- 					</tr> -->
<!-- 				</table> -->
			</c:forEach>

			<hr width='600' size='2' noshade style="margin-top: 20px;">

			<!--  페이징  -->
			<div class="pagination">
				<c:if test='${cr.pre}'>
					<a href='list${cr.makeQuery(cr.pageStart-1)}'> <span
						aria-hidden='false'>이전</span>
					</a>
				</c:if>
				<c:forEach var='num' begin='${cr.pageStart}' end='${cr.pageEnd}'>
					<li class="paginate_button ${cr.pageView == num ? "active":""}">
						<a href="list${cr.makeQuery(num)}">${num}</a>
					</li>
				</c:forEach>
				<c:if test='${cr.next}'>
					<a href='list${cr.makeQuery(cr.pageEnd+1)}'>다음</a>
				</c:if>
			</div>

		</div>
		<div class="empty_right"></div>
	</div>



	<%@include file="../includes/footer.jsp"%>
<script>

	const searchEnterKey = () =>{
		if (window.event.keyCode == 13) {
			searchBtn();
	    }
	}
	
	function searchBtn(){
		alert("준비중입니다. :) ");
	}
</script>
</body>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
		$(document).ready(function() {
			$('.paginate_button a').on('click', function(e) {
				e.preventDefault();
				$(this).submit();
			});
		
		});
		
</script>
</html>
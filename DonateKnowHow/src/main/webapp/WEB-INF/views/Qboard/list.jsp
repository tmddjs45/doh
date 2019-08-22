<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
					onkeyup="qboardSearchEnterKey()" />
				<button class="searchBtn" type="button" onclick="qboardSearchBtn()"></button>
			</div>

			<c:forEach items="${list}" var="list">
				<div class="boardQA">
					<div class="boardQA-info">
						<div><c:out value='${list.q_no}' /></div>
						<img src="${path}/resources/img/checking.png">
						<div>views:&nbsp;&nbsp;<c:out value='${list.q_count}' /></div>
					</div>
					
					<div class="boardQA-content">
						<div><c:out value='${list.q_rdate}' /></div>
	                 	<h3><a href="content${cr.makeQuery(cr.num)}&q_no=${list.q_no}"><c:out value='${list.q_title}' /></a></h3>
	                  	<div><c:out value='${list.nickname}' /></div>
	                  	<c:choose>
		                    <c:when test="${ fn : length(list.q_content) > 120 }">
		                    	<div><c:out value='${fn:substring(list.q_content,0,119)}'/>...</div>
		                    </c:when>
		                    <c:otherwise>
		                    	<div><c:out value="${list.q_content}"/></div>
		                    </c:otherwise>
	                  	</c:choose>
              		</div>
				</div>
			</c:forEach>


			<!--  페이징  -->
			<div class="pagination">
				<c:if test='${cr.pre}'>
					<a class="prev-btn"href='list${cr.makeQuery(cr.pageStart-1)}'>이전</a>
				</c:if>
				<ul>
				<c:forEach var='num' begin='${cr.pageStart}' end='${cr.pageEnd}'>
					<li>
						<a class="pagination_btn" href="list${cr.makeQuery(num)}">${num}</a>
					</li>
				</c:forEach>
				</ul>
				<c:if test='${cr.next}'>
					<a class="next-btn" href='list${cr.makeQuery(cr.pageEnd+1)}'>다음</a>
				</c:if>
			</div>

		</div>
		<div class="empty_right"></div>
	</div>

	<%@include file="../includes/footer.jsp"%>
	
<script>	
	const firstPage = "list"
	let currentPageLink = document.URL;
	console.log(currentPageLink);
	currentPageLink = currentPageLink.substr(currentPageLink.lastIndexOf("/")+1);
	console.log(currentPageLink);
	
	let page = document.querySelectorAll('.pagination_btn');
	console.log(page);
	
	if(currentPageLink == firstPage ){
		page[0].style.color ="red";
		page[0].style.fontSize = "22px";
		page[0].style.fontWeight = "900";
	}

	for(let i=0; i<page.length;i++){
			
		if(currentPageLink === page[i].getAttribute('href')){
			page[i].style.color ="red";
			page[i].style.fontSize = "22px";
			page[i].style.fontWeight = "900";
		}
	}

	function qboardSearchEnterKey(){
		if (window.event.keyCode == 13) {
			qboardSearchBtn();
	    }
	}
	
	function qboardSearchBtn(){
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
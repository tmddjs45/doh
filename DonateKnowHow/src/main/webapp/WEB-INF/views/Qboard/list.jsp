<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<title>Q & A</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/qboard/qboardList.css"></link>
</head>
<body>
	<%@include file="../includes/header.jsp"%>


	<div class="wrapper">
		<div class="empty_left"></div>
		
		<div class="content">
		
		<form class="searchForm">
			<div class="searchLine" align='center'>
				<select class="searchType" name="searchType">
					<option value="qTitle" <c:out value="${cr.searchType eq 'qTitle' ? 'selected' : '' }"/>>제목</option>
					<option value="qContent" <c:out value="${cr.searchType eq 'qContent' ? 'selected' : '' }"/>>내용</option>
					<option value="qTitleContent" <c:out value="${cr.searchType eq 'qTitleContent' ? 'selected' : '' }"/>>제목+내용</option>
					<option value="qNickname" <c:out value="${cr.searchType eq 'qNickname' ? 'selected' : '' }"/>>글쓴이</option>
				</select>
				<input name="keyword" type="text" onkeyup="qboardSearchEnterKey()" value="${cr.keyword}" placeholder="${cr.total} Questions"/>
				<button class="searchBtn" onclick="qboardSearchBtn()"></button>
				<sec:authorize access="isAuthenticated()"><a class="insertBtn" href="input">Write</a></sec:authorize>
		</div>
		</form>
			<c:forEach items="${list}" var="list">
			<input name="checknum" type="hidden" value="${list.checknum}" />
				<div class="boardQA">
					<div class="boardQA-info">
						<div><c:out value='${list.q_no}' /></div>
						<c:choose>
							<c:when test="${list.checknum == 1}">
								<img class="check-img" src="${path}/resources/img/checking.png">
							</c:when>
							<c:otherwise>
								<img class="check-img" src="${path}/resources/img/checking.png" style="filter: grayscale(100%)">
							</c:otherwise>
						</c:choose>
						
						<div>views:&nbsp;&nbsp;<c:out value='${list.q_readnum}' /></div>
					</div>
					<div class="boardQA-content">
						<h3><a href="content${cr.makeQuery(cr.num)}&q_no=${list.q_no}"><c:out value='${list.q_title}' /></a></h3>
						<div><c:out value='${list.nickname}' /></div>
						<div class="boardQA-text">
							<div>${list.q_content}</div>
						</div>
						<div class="boardQA-content-rdate"><c:out value='${list.q_rdate}' /></div>
					</div>
				</div>
			</c:forEach>

			<!--  페이징  -->
			<div class="pagination">
				<c:if test='${cr.pre}'>
					<a class="prev-btn" href='list${cr.makeQuery(cr.pageStart-1)}'>이전</a>
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
		var keywordVal = $('input[name="keyword"]').val();
		console.log("keyword --> " + keywordVal);
	 }
	 
	 
</script>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
		$(document).ready(function() {
			$('.paginate_button a').on('click', function(e) {
				e.preventDefault();
				$(this).submit();
			});
		});
</script>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>info</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/memberinfo.css"></link>
<script src="https://kit.fontawesome.com/f4af1ffa80.js"></script>
</head>
<body>
	<sec:authentication property="principal" var="principal"/>
	<%@include file="../includes/header.jsp"%>
	<div class="wrapper">
		<div class="empty"></div>
		
		<div class="content">
			<div class="info-wrapper">
				<h2><img src="${path}/resources/img/web-programming.png">&nbsp;Profile</h2>
				<div class="info-nick"><sec:authentication property="principal.member.nickname"/></div>
				<div class="info-email"><sec:authentication property="principal.username"/></div>
				
				<div class="tapper">
					<div class="tap">
						<div><i class="fas fa-file-signature"></i>&nbsp;게시물 수</div>
						<div class="board-count"><c:out value="${count.get(0)}"/></div>
					</div>
					<div class="tap">
						<div><i class="far fa-comment-dots"></i>&nbsp;댓글 수</div>
						<div class="reply-count"><c:out value="${count.get(1)}"/></div>
					</div>
					<div class="tap">
						<div><i class="fas fa-check-square"></i>&nbsp;채택 수</div>
						<div class="check-count"><c:out value="${count.get(2)}"/></div>
					</div>
				</div>
				<div class="info-edit">
					<a href="#"><label><i class="far fa-edit"></i>프로필 수정</label></a>
				</div>
			</div>
		</div>
		
		<div class="empty"></div>
	</div>
	<%@include file="../includes/footer.jsp"%>
</body>
</html>
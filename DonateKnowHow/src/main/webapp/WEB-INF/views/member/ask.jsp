<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Ask</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/memberinfo.css"></link>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ask.css"></link>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	
	<div class="wrapper">
		<div class="empty"></div>
		<div class="content">
			<div class="ask-board">
				<input placeholder="제목"/><br>
				<input placeholder="bit119@gmail.com"/><br>
				<input placeholder="보내는 사람"/><br>
				<textarea rows="1" cols="1"></textarea>
			</div>
		</div>
		<div class="empty"></div>
	</div>
	
	<%@include file="../includes/footer.jsp"%>
</body>
</html>
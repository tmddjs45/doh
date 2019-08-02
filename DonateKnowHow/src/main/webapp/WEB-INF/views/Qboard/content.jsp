<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	<center>
		<hr size='2' noshade>
		<h2>QnA__CONTENT</h2>
		<hr size='2' noshade>
		
			<table border='1' width='80%' align='center'>
				<tr align="center">
					<td width="10%">${content.q_no}</td>
					<td colspan="5">제목 :: ${content.q_title}</td>
				</tr>
				<tr align="center">
					<td colspan="4" width="10%">${content.nickname}</td>
					<td>view couunt :${content.q_count}</td>
					<td>${content.q_rdate}</td>
				</tr>
				<tr>
					<td colspan="6"><pre>${content.q_content}</pre></td>
				</tr>

<!-- 		REPLY -->
	<%@include file= "reply.jsp" %>
		<form role="form" method="post">
			<input type="hidden" name="num" value="${cr.num}">
			<input type="hidden" name="pageView" value="${cr.pageView}">
			<input type="hidden" name="q_no" value="${content.q_no}">
		</form>
		<b> 
			<a href='update${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>UPDATE</a> | 
			<a href='delete${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>DELETE</a> | 
			<a href='list${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>LIST</a>
		</b>
	</center>
	<%@include file="../includes/footer.jsp" %>
</body>
</html>
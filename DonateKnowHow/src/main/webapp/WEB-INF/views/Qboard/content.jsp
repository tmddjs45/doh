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
		<hr width='600' size='2' noshade>
		<h2>QnA__CONTENT</h2>
		<hr width='600' size='2' noshade>
		
		
			<table border='1' width='600' align='center' cellpadding='3'>
			
			
				<tr>
					<td width='100' align='center'>QNO</td>
					<td>${content.q_no}</td>
				</tr>
				<tr>
					<td align='center'>NICKNAME</td>
					<td>${content.nickname}</td>
				</tr>
				<tr>
					<td align='center'>TITLE</td>
					<td>${content.q_title}</td>
				</tr>
				<tr>
					<td align='center'>CONTENT</td>
					<td><pre>${content.q_content}</pre></td>
				</tr>
				
				
			</table>
		
		<hr width='600' size='2' noshade>
		
		<table border='1' width='600' align='center' cellpadding='3'>
			<tr>
				<td align='center' width='100'>REPLY</td>
				<td>덧글들어가는공간</td>
			</tr>
		</table>
		<hr width='600' size='2' noshade>	
		
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

		<hr width='600' size='2' noshade>
	</center>
	<%@include file="../includes/footer.jsp" %>
</body>
</html>
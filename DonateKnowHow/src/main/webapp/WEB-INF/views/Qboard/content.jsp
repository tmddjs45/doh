<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
</head>
<body>


	<meta charset='utf-8'>
	<center>
		<hr width='600' size='2' noshade>
		<h2>QnA__CONTENT</h2>
		&nbsp;&nbsp;&nbsp; <a href='Qinput'>INPUT</a>
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
					<td align='center'>EMAIL</td>
					<td>${content.email}</td>
				</tr>
				<tr>
					<td align='center'>TITLE</td>
					<td>${content.q_title}</td>
				</tr>
				<tr>
					<td align='center'>CONTENT</td>
					<td>${content.q_content}</td>
				</tr>
				
				
			</table>
		
		<hr width='600' size='2' noshade>
		<b> 
			<a href='Qupdate?q_no=${content.q_no}'>UPDATE</a> | <a
			href='delete?q_no=${content.q_no}'>DELETE</a> | <a href='list'>LIST</a>
		</b>
		<hr width='600' size='2' noshade>
	</center>



</body>
</html>
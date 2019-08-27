<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
	html,body{
		margin: 0;
		padding: 0;
	}
	
	.alter_form_div{
		margin: 30px auto;
		text-align: center;
		width:30%;
	}
	
	.alter_form_div .alter_label{
		margin: 20px;
		padding: 20px;
		font-size: 20px;
		text-align:left;
		border-bottom: 1px solid #d8d8d8;
	}
	.alter_form_div input{
		outline: none;
		border:1px solid #d8d8d8;
		border-radius: 50px;
		padding: 10px 30px;
		font-size:18px;
		margin: 20px;
		width:50%;
	}
	
	.alter_form_div button{
		width:50%;
		padding: 10px 30px;
		outline: none;
		border:none;
		border-radius: 50px;
		margin: 20px;
		background-color: gold;
	}
	
	.alter_form_div button:hover{
		background-color: yellow;
	}
</style>
</head>
<body>
<%@include file="../includes/header.jsp"%>
<div class="alter_form_div">
	<div class="alter_label">비밀번호 변경</div>
	<form action="/alter_password" method="Post">	
		<input name="alter_password" class="alter_password" type="password" placeholder="Password"/><br>
		<input class="alter_repeat_password" type="password" placeholder="Repeat-Password"/>
		<div>비밀번호를 재설정 해주세요.</div>
		<div>${compare}</div>
		<input name="alter_compare" type="hidden" value="${compare}"/>
		<input name="alter_email" type="hidden" value="${email}"/>
		<button type="button" onclick="submit()">변경</button>
	</form>
</div>
<%@include file="../includes/footer.jsp"%>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>

	<title>회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/frame.css"></link>
	<style>
		html, body{
			margin: 0;
		}	
	</style>
</head>
<body>
	<%@include file="../includes/header.jsp" %>
	
	<div class="content-temp">
		<div></div>
		
		<div class="content">
			<div class="signup-form">
				<div><h1>- 회원가입-</h1>이미지나 그런게 들어가겠지!</div>
				<div>
					<br>
					<form name="signupform" method="post" action="/signup">
						<span><label>E-mail</label></span> 
						<span><input type="email" name="email" placeholder="example@domain.com"></span>
						<span><button type="button" onclick="#">중복검사</button></span><br><br>
						<span><label>Password</label></span>
						<span><input type="password" name="password" placeholder="비밀번호"/></span><br><br>
						<button>submit</button>
					</form>
				</div>
				<div>3</div>
			</div>
		</div>
		
		<div></div>
	</div>
	
	<%@include file="../includes/footer.jsp" %>
</body>
</html>
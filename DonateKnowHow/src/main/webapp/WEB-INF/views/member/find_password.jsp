<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>

	html, body{
		margin:0;
		padding:0;
	}
	
	.find_pwd_div{
		margin: 0px auto;
		padding: 50px 40px;
		text-align: center;
		width:30%;
		
	}
	
	.find_pwd_div div:nth-child(1) {
		text-align: left;
		font-size: 18px;
		border-bottom: 1px solid #d8d8d8;
		padding: 10px 25px;
	}
	
	.find_pwd_div p{
		padding: 40px;
	}
	
	.find_pwd_div input{
		padding: 30px;
		width: 80%;
		height: 25px;
		border-radius: 50px;
		font-size :18px;
		border: 1px solid #d8d8d8;
		outline: none;
	}
	
	.find_btn{
		height: 18px;
		padding: 30px;
		outline: none;
		border-radius: 10px;
		font-size: 15px;
		border: none;
		background-color: gold;
		margin:50px;
		text-align: center;	
	}
	
	.find_btn:hover{
		background-color: yellow;
	
	}
		
</style>
</head>
<body>
<%@include file="../includes/header.jsp"%>
<div>
	<div class="find_pwd_div">
		<form name="find_form" action="find_password" method="POST">
			<div>비밀번호 찾기</div>
			<p>이메일 주소를 입력해주세요.</p>
			<input name="find_email" type="email" placeholder="Email" onkeyup="find_enterKey()"/>
			<button class="find_btn" type="button" onclick="find_submit()">비밀번호 찾기</button>
		</form>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>

<script>

	let findFlag = true;
	
	
	const find_enterKey = () =>{
		if (window.event.keyCode == 13) {
			find_submit();
        }
	}
	
	function find_submit(){
		
		if(findFlag){	
			document.find_form.submit();	
			alert("비밀번호를 새로 설정할 수 있는 URL을 이메일 주소로 전송했습니다."
					+" 혹시 메일이 안왔다면 스팸함을 확인해주세요. :) ");
			
		}else{
			alert("다시 한번 확인 해 주세요 :( ");
		}
	}
</script>
</body>
</html>
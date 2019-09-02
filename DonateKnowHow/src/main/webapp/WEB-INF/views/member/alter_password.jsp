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
		height: 66.8vh
	}
	
	.alter_form_div div{
		margin: 20px;
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
		color: #000;
		font-weight: 300;
	}
	
	.alter_form_div button:hover{
		background-color: #000;
		color:gold;
		cursor: pointer;
	}
	
</style>
</head>
<body>
<%@include file="../includes/header.jsp"%>
<div class="alter_form_div">
	<div class="alter_label">비밀번호 변경</div>
	<form name="alter_form" action="/alter_password" method="Post">	
		<input name="alter_password" class="alter_password" type="password" placeholder="4~16자 이내로 입력"/><br>
		<input class="alter_repeat_password" type="password" placeholder="Repeat-Password"/>
		<div class="alter-check" style="font-size: 12px;">비밀번호를 재설정 해주세요.</div>
		<input name="alter_compare" type="hidden" value="${compare}"/>
		<input name="alter_email" type="hidden" value="${email}"/>
		<button type="button" onclick="alter()">변경</button>
	</form>
</div>
<%@include file="../includes/footer.jsp"%>
<script>
	function alter(){
		
		if(alterFlag && alterPassword.value==alterRepeatPassword.value){
			document.alter_form.submit();
		}else{
			alert("다시 확인해주세요! :( ");
			alterPassword.style.border="1px solid #d8d8d8";
			alterPassword.style.transition="0.3s";
			alterRepeatPassword.style.border="1px solid #d8d8d8";
			alterRepeatPassword.style.transition="0.3s";
			alterCheck.innerHTML="비밀번호를 재설정 해주세요.";
			alterPassword.innerHTML="";
			alterRepeatPassword.innerHTML="";
			return false;
		}
	}

	const alterPassword = document.querySelector(".alter_password");
	const alterRepeatPassword = document.querySelector(".alter_repeat_password");
	const alterCheck = document.querySelector(".alter-check");
	let alterPasswordTimer;
	let alterFlag;
	
	alterPassword.addEventListener('input',function(){
		if(alterPasswordTimer){
			clearTimeout(alterPasswordTimer);
		}
		
		alterPasswordTimer = setTimeout(function(){
		
			if(alterPassword.value.length==0){
				alterPassword.style.border="2px solid red";
				alterPassword.style.transition="0.3s";
				alterCheck.innerHTML="빈칸이네요 :(";
				alterCheck.style.color="red";
				alterFlag=false;
			}else if(alterPassword.value.length > 16 || alterPassword.value.length < 4){
				alterPassword.style.border="2px solid red";
				alterPassword.style.transition="0.3s";
				alterCheck.innerHTML="길이가 올바르지 않아요 :(";
				alterCheck.style.color="red";
				alterFlag=false;
			}else{
				alterPassword.style.border="2px solid #7CFC00";
				alterPassword.style.transition="0.3s";
			}
				
		},1000);
	});
				
				
	alterRepeatPassword.addEventListener('input',function(){
		if(alterPasswordTimer){
			clearTimeout(alterPasswordTimer);
		}
		
		alterPasswordTimer = setTimeout(function(){
			
			if(alterPassword.value==alterRepeatPassword.value){
				alterRepeatPassword.style.border="2px solid #7CFC00";
				alterRepeatPassword.style.transition="0.3s";
				alterCheck.innerHTML="일치합니다 :) ";
				alterCheck.style.color="green";
				alterFlag=true;
			}else{
				alterRepeatPassword.style.border="2px solid red";
				alterRepeatPassword.style.transition="0.3s";
				alterCheck.innerHTML="일치하지 않아요 :( ";
				alterCheck.style.color="red";
				alterFlag=false;
			}
				
		},1000);
	});
				
				
</script>
</body>
</html>
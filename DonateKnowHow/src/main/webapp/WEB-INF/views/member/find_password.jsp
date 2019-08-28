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
	
	.find_pwd_div div:nth-child(1){
		text-align: left;
		font-size: 18px;
		border-bottom: 1px solid #d8d8d8;
		padding: 10px 25px;
	}
	
	.find_check{
		font-size:12px;
		margin : 20px;
		
	}
	
	.find_pwd_div p{
		padding: 40px;
	}
	
	.find_pwd_div .find_email_input{
		padding: 30px;
		width: 80%;
		height: 25px;
		border-radius: 50px;
		font-size :18px;
		border: 1px solid #d8d8d8;
		outline: none;
	}
	
	.find_btn{
	
		padding: 15px 30px;
		outline: none;
		border-radius: 10px;
		font-size: 15px;
		border: none;
		background-color: gold;
		margin:30px;
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
			<input class="find_email_input" name="find_email" type="email" placeholder="Email" onkeyup="find_enterKey()"/>
			<div class="find_check"> 가입되어있는 이메일을 입력해주세요.</div>
			<div>
			<button class="find_btn" type="button" onclick="find_submit()">비밀번호 찾기</button>
			</div>
		</form>
	</div>
</div>
<%@include file="../includes/footer.jsp"%>

<script>

	let findFlag;
	
	
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
			return false;
		}
	}
	
	let find_timer;
	const find_emailInput = document.querySelector('.find_email_input');
	
	find_emailInput.addEventListener('input', function(){
		if(find_timer){
			clearTimeout(find_timer);
		}
		
		find_timer = setTimeout(function(){
			if(find_emailInput.value.length==0){
				document.querySelector('.find_check').innerHTML=" 빈칸이네요 :( ";
				document.querySelector('.find_check').style.color="red";
				find_emailInput.style.border="2px solid red";
				find_emailInput.style.transition="0.2s";
				findFlag=false;
			}else{
				if(find_emailInput.value.match(emailForm)){
					$.ajax({
						url: "./emailcheck",
						type: "POST",
						data: { email: find_emailInput.value },
						success: function(responseData){
							if(responseData=="true"){
								document.querySelector('.find_check').innerHTML=" 없는 회원입니다 :( ";
								document.querySelector('.find_check').style.color="red";
								find_emailInput.style.border="2px solid red";
								find_emailInput.style.transition="0.2s";
								findFlag = false;
							}else{
								find_emailInput.style.border="2px solid #7CFC00";
								find_emailInput.style.transition="0.2s";
								document.querySelector('.find_check').innerHTML="가입되어있는 회원입니다.";
								document.querySelector('.find_check').style.color="green";
								findFlag = true;
							}
						}
					});
						
					
				}else{
					document.querySelector('.find_check').innerHTML=" 올바른 표현이 아닙니다. :( ";
					document.querySelector('.find_check').style.color="red";
					find_emailInput.style.border="2px solid red";
					find_emailInput.style.transition="0.2s";
					findFlag=false;
				}
			}
		},1200);
	});

</script>
</body>
</html>
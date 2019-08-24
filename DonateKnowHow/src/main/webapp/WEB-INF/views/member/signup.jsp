<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/signup.css"></link>
	<style>
		html, body{
			margin: 0;
		}	
	</style>
</head>
<body>
	<%@include file="../includes/header.jsp" %>
	
	<div class="content-temp">
		<div class="content-empty"></div>
		
		<div class="content">
			<div class="signup-form">
				<div>
					<h1> Sign Up </h1>
				</div>
				<div>
					<form name="signupform" method="post" action="/signup">
						<table>
							<tr>
								<td><label>Email</label></td>
								<td><input class="signup-email" name="email" type="email"></input></td>
							</tr>
							<tr>
								<td></td>
								<td id="email-check" class="access-text">사용 할 Email를 입력해주세요.</td>
							</tr>
							<tr>
								<td><label>Password</label></td>
								<td><input class="signup-password" name="password" type="password"/></td>
							</tr>
							<tr>
								<td></td>
								<td class="access-text">4~16자 이내로 입력해주세요.</td>
							</tr>
							<tr>
								<td><label>Password-check</label></td>
								<td><input class="signup-reinput" name="pwdcheck" type="password"/></td>
							</tr>
							<tr>
								<td></td>
								<td id="signup-pwdcheck" class="access-text">입력한 비밀번호를 재입력해주세요.</td>
							</tr>
							<tr>
								<td><label>Nick Name</label></td>
								<td><input class="signup-nickname" name="nickname" type="text"></input></td>
							</tr>
							<tr>
								<td></td>
								<td id="nickname-check" class="access-text">사용 할 닉네임을 입력해주세요.</td>
							</tr>
						</table>
						<button class="submitBtn" type="button" onclick="memberJoin()">submit</button>
					</form>
				</div>
			</div>
		</div>
		<div class="content-empty"></div>
	</div>
	<%@include file="../includes/footer.jsp" %>

	<script>
		let timer; // Debouncing need timer
		let emailFlag;
 		const emailForm = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일 정규식표현
		const email = document.querySelector(".signup-email");
 		const nickname = document.querySelector(".signup-nickname");
 		const password = document.querySelector(".signup-password");
 		const pwdcheck = document.querySelector(".signup-reinput");
		let passwordFlag; 
		let nicknameFlag;
		
		/* ---- #  Debouncing Password Check START  # ---- */
		
		pwdcheck.addEventListener("input", () => {
			if(timer){
				clearTimeout(timer);
			}
			timer = setTimeout(function(){
				
				if(pwdcheck.value.length==0){
					document.getElementById("signup-pwdcheck").innerHTML="빈칸이네요 :( 입력해주세요.";
					document.getElementById("signup-pwdcheck").style.color="red";				
				}else if(pwdcheck.value.length > 16 || pwdcheck.value.length < 4){
					document.getElementById("signup-pwdcheck").innerHTML="길이가 올바르지 않아요. :( ";
					document.getElementById("signup-pwdcheck").style.color="red";
				}else{
					if(pwdcheck.value == password.value){
						/* ---- # Vanilla Javascript # ---- */
						document.getElementById("signup-pwdcheck").innerHTML="비밀번호가 일치합니다. :)";
						document.getElementById("signup-pwdcheck").style.color="green";
						passwordFlag=true
					}else{
						document.getElementById("signup-pwdcheck").innerHTML="다시 확인해주세요 :( ";
						document.getElementById("signup-pwdcheck").style.color="red";
						passwordFlag=false;
					}	
				}
			},1500);
		});
		
		/* ---- #  Debouncing Password Check END  # ---- */
		
		/* ---- #  Debouncing Email Check START  # ---- */
		/* ---- # jQuery Ajax # ---- */
		email.addEventListener("input", function(e){
			if(timer){
				clearTimeout(timer);
			}
			timer = setTimeout(function(){
				
				if($('.signup-email').val().length==0){
					$('#email-check').text('빈칸이네요 :( 입력해주세요.').css('color','red');
					emailFlag = false;
				}else{	
					if($('.signup-email').val().match(emailForm)){ //정규식체크
						$.ajax({
							url: "./emailcheck",
							type: "POST",
							data: { email: $(".signup-email").val()},
							success: function(responseData){
								if(responseData=="true"){
									$('#email-check').text('사용 가능한 Email 입니다.').css('color','green');
									emailFlag = true;
									console.log("emailFlag : "+emailFlag);
								}else{
									$('#email-check').text('중복된 Email 입니다.').css('color','red');
									emailFlag = false;
									console.log("emailFlag : "+emailFlag);
								}
							}
						});
					}else{
						$('#email-check').text('Email을 올바르게 입력해주세요.').css('color','red');
						emailFlag = false;
						console.log("emailFlag : "+emailFlag);
					}
				}
			},1800);
		});
		
		/* ---- #  Debouncing Email Check END  # ---- */
		
		/* ---- #  Debouncing NickName Check START  # ---- */
		
		nickname.addEventListener("input", function(e){
			if(timer){
				clearTimeout(timer);
			}
			timer = setTimeout(function(){
				
				if($('.signup-nickname').val().length==0){
					$('#nickname-check').text('빈칸이네요 :( 입력해주세요.').css('color','red');
					emailFlag = false;
				}else if($('.signup-nickname').val().length > 28){
					$('#nickname-check').text('너무 길어요 :( 다시 입력해주세요.').css('color','red');
					emailFlag = false;
				}else{
					$.ajax({
						url: "./nickcheck",
						type: "POST",
						data: {nickname : $('.signup-nickname').val()},
						success: function(responseData){
							if(responseData=="true"){
								$('#nickname-check').text('사용 가능한 닉네임 입니다.').css('color','green');
								nicknameFlag = true;
								console.log("nicknameFlag : "+nicknameFlag);
							}else{
								$('#nickname-check').text('중복된 닉네임 입니다.').css('color','red');
								nicknameFlag = false;
								console.log("nicknameFlag : "+nicknameFlag);
							}							
						}
					});
				}
			},1800);
		});
		
		/* ---- #  Debouncing NickName Check END  # ---- */
		
		function memberJoin(){
			if(emailFlag&&passwordFlag&&nicknameFlag){
				document.signupform.submit();
				alert(" 환영해요! 우리 함께 Know-How를 기부 해 볼까요? :)");
			}else{
				alert("정보를 정확히 입력해주세요 :( ");
			}
		}
	</script>
</body>
</html>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.doh.domain.*"%>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<meta charset='utf-8'>
<link rel='stylesheet' type='text/css' href='${path}/resources/css/dohHeader.css'></link>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/footer.css"></link>
<link href="https://fonts.googleapis.com/css?family=Russo+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/f4af1ffa80.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <div class="bar">
       <span class="logo">
           <a href="/"><img src="${path}/resources/img/dohmain.png"></a>
        </span>
        <nav>
            <ul>
                <li><a href="/about">ABOUT</a></li>
                <li><a href="/cboard/list">LECTURE</a>
                	<ul>
                		<li><a>Html</a></li>
                		<li><a>Css</a></li>
                		<li><a>BootStrap</a></li>
                		<li><a>JavaScript</a></li>
                		<li><a>jQuery</a></li>
                		             		
                	</ul>
                </li>
                <li><a href="/Qboard/list">Q & A</a></li>
                <li><a href="/fboard/list?pageNum=1">FREE-BOARD</a></li>
                <sec:authorize access="isAnonymous()">
                	<li><a id="loginBtn">LOGIN</a></li>
                </sec:authorize>
                
                <sec:authorize access="isAuthenticated()">
                	<sec:authentication property="principal.member.nickname" var="nickname"/>
                	<li><a style="color:gold;">${nickname}</a>
                		<ul>
                			<li><a href="/memberinfo">Info</a></li>
                			<li><a href="/logout">Logout</a></li>
                		</ul>
                	</li>
                </sec:authorize>
            </ul>
        </nav>   
     </div>
        
        
	<div class="modal hidden">
		<div class="modal-overlay"></div>
		<div class="modal-content">
			<form class="login-form" name="loginForm" action="/login" method="post">
				<h1>Login</h1>
				
				<div class="txtb">
					<input type="text" name="username">
					<span data-placeholder="Email"></span>
				</div>
				
				<div class="txtb">
					<input type="password" name="password" onkeyup="enterKey()">
					<span data-placeholder="Password"></span>
				</div>
				<div style="margin-bottom:15px;">
					<label><input type="checkbox" name="remember-me">
						<span style="font-size:10px; position: relative; top:-3px;">&nbsp;로그인 상태 유지</span>
					</label>
				</div>
				
				<div class="member-join">
					<ul>
						<li><a id="signupBtn">회원가입</a></li>&nbsp;|&nbsp;
						<li><a>비밀번호 찾기</a></li>
					</ul>
				</div>
				
				<input class="logbtn" type="button" value="Login" onclick="loginSubmitBtn()">
				<input class="cls" type="button" value="Close">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form>
		</div>
	</div>
	
	<div class="signup-modal hidden">
		<div class="signup-modal-overlay"></div>
		<div class="signup-modal-content">
		
			<h1> Sign up </h1>
			<form name="signupform" method="post" action="/signup">
				<div class="signup-input">
					<input class="signup-email" name="email" type="email" placeholder="Email"/>
					<div id="email-check" class="access-text">사용 할 Email를 입력해주세요.</div>
					<input class="signup-password" name="password" type="password" placeholder="password"/>
					<div class="access-text">4~16자 이내로 입력해주세요.</div>
					<input class="signup-reinput" name="pwdcheck" type="password" placeholder="repeat-password"/>
					<div id="signup-pwdcheck" class="access-text">입력한 비밀번호를 재입력해주세요.</div>
					<input class="signup-nickname" name="nickname" type="text" placeholder="Nickname"/>
					<div id="nickname-check" class="access-text">사용 할 닉네임을 입력해주세요.</div>
				</div>
				<button class="submitBtn" type="button" onclick="memberJoin()">Join</button><br>
				<button class="signupCls" type="button">Close</btton>
			</form>
		</div>
	</div>

<!-- modal Vanilla JS made by.Nomad Coders -->
	<script>
		const enterKey = () =>{
			if (window.event.keyCode == 13) {
				loginSubmitBtn();
	        }
		}
		
		const openBtn = document.getElementById("loginBtn");
		const modal = document.querySelector(".modal");
		const overlay = modal.querySelector(".modal-overlay");
		const closeBtn = modal.querySelector(".cls");
		
		const openModal = () =>{
			modal.classList.remove("hidden");
		}

		const closeModal = () =>{
			modal.classList.add("hidden");
		}

		overlay.addEventListener("click", closeModal);
		openBtn.addEventListener("click", openModal);
		closeBtn.addEventListener("click", closeModal);
		
		
		
		const signupOpenBtn = document.getElementById("signupBtn");
		const signupModal = document.querySelector(".signup-modal");
		const signupOverlay = signupModal.querySelector(".signup-modal-overlay");
		const signupCloseBtn = signupModal.querySelector(".signupCls");
		
		const signupOpenModal=()=>{
			signupModal.classList.remove("hidden");
		}
		
		const signupCloseModal = () =>{
			signupModal.classList.add("hidden");
		}
		
		signupOpenBtn.addEventListener("click",signupOpenModal);
		signupOverlay.addEventListener("click",signupCloseModal);
		signupCloseBtn.addEventListener("click",signupCloseModal);
		
		/* ---- # my code # ---- */
	
		const loginSubmitBtn = () =>{
			let email = loginForm.username.value;
			let pwd = loginForm.password.value;
			if(email.length==0){
				alert("Email를 입력해주세요.");
				return false;
			}
			if(pwd.length==0){
				alert("password를 입력해주세요.");
				return false;
				
			}
			loginForm.submit();
		}
    
		/* ---- # Login form Css  # ---- */
		
		$(".txtb input").on("focus",function(){
			$(this).addClass("focus");
		});
		
		$(".txtb input").on("blur",function(){
			if($(this).val()==""){
				$(this).removeClass("focus");
			}
		});
		
		/*------------------------------------------------Sign up-------------------------------------------------------------------*/
		
		
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
								console.log("아라라ㅏ안안앙 실행은 된당!");
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

        
 
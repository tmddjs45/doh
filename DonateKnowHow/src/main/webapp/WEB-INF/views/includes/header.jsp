<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="com.doh.domain.*"%>
<%@ page contentType="text/html;charset=utf-8" %>

<link href="https://fonts.googleapis.com/css?family=Russo+One&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main_header.css"></link>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/menubar.css"></link>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/footer.css"></link>

	<div class="header-bar">
		<span class="name"><a href="/">D'oh</a></span>
		<span class="member">
			<ul>			
				<%
				MemberDTO member = (MemberDTO)session.getAttribute("member");
				if(member != null){
				%>
					<li><a>안녕하세요 <%=member.getNickname()%>님</a></li>|
					<li><a href="/logout">로그아웃</a></li>|
					<li><a href="#">내 정보</a></li>
				
				<%}else{ %>
					<li><a id="loginBtn">로그인</a></li>|
					<li><a href="/signup">회원가입</a></li>
				<%} %>		
			</ul>
		</span>
	</div>
		
	<div class="title">
		<a href="/"><img src="resources/img/dohmain.png" alt="main title"/></a>
		<p style="font-family: 'Russo One', sans-serif;">Donate Know-How</p>
	</div>

	<div>
		<nav class='menuBar'>
			<ul>
				<li><a href="#">ABOUT</a></li>
				<li><a href="/cboard/list">LECTURE</a></li>
				<li><a href="/Qboard/list">Q&A</a></li>
				<li><a href="#">FREE-BOARD</a></li>
			</ul>
		</nav>
	</div>
	
	<div class="modal hidden">
		<div class="modal-overlay"></div>
		<div class="modal-content">
			<form class="login-form" name="loginForm" action="/login" method="post">
				<h1>Login</h1>
				
				<div class="txtb">
					<input type="text" name="email">
					<span data-placeholder="UserEmail"></span>
				</div>
				
				<div class="txtb">
					<input type="password" name="password">
					<span data-placeholder="Password"></span>
				</div>
				
				<input class="logbtn" type="button" value="Login" onclick="loginSubmitBtn()">
				<input class="cls" type="button" value="Close">
				
			</form>
		</div>
	</div>
	
<!-- modal Vanilla JS made by.Nomad Coders -->
	<script>
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

		
		/* ---- # my code # ---- */
		
		const loginSubmitBtn = () =>{
			let email = loginForm.email.value;
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
		
	</script>
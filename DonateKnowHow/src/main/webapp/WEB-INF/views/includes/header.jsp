<%@ page contentType="text/html;charset=utf-8" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/main_header.css"></link>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/menubar.css"></link>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/footer.css"></link>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/frame.css"></link>

	<div class="header-bar">
		<span class="name"><a href="/">D'oh</a></span>
		<span class="member">
			<ul>
				<li><a id="loginBtn">로그인</a></li>|
				<li><a href="/signup">회원가입</a></li>
			</ul>
		</span>
	</div>

	<div class="title">
		<a href="/"><img src="${path}/resources/img/dohmain.png" alt="main title"/></a>
		<p>Donate Know-How</p>
	</div>

	<div>
		<nav class='menuBar'>
			<ul>
				<li><a href="#">ABOUT</a></li>

				<li><a href="/cboard/list">LECTURE</a></li>
				<li><a href="/Qboard/list?num=1">Q&A</a></li>
				<li><a href="/fboard/list">FREE-BOARD</a></li>

			</ul>
		</nav>
	</div>


	<div class="modal hidden">
		<div class="modal-overlay"></div>
		<div class="modal-content">
			<form name="loginform" method="post" action="/">
				<div style="display: inline-block;">
					<label>Email</label>
					<input name="email" type="email" placeholder="example@domain.com"/>
				</div><br><br>
				<div style="display: inline-block;">
					<label>password</label>
					<input name="pwd" type="password"/>
				</div><br><br>
				<div style="display: inline-block;">
					<button>Submit</button>
					<button class="cls" type="button">Close</button>
				</div>
			</form>
		</div>
	</div>

	<!-- modal Vanilla JS made by.Nomad Coders-->
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
		closeBtn.addEventListener("click", closeModal);
		openBtn.addEventListener("click", openModal);
	</script>

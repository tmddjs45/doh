<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/Main_Header.css"></link>
	<link rel="stylesheet" type="text/css" href="resources/css/MenuBar.css"></link>
	<link rel="stylesheet" type="text/css" href="resources/css/Slider.css"></link>
	<link rel="stylesheet" type="text/css" href="resources/css/Footer.css"></link>
	<style>
		html, body{
			margin: 0;
		}	
	</style>
</head>
<body>

	<div class="header-bar">
		<span class="name">D'oh</span>
		<span class="member">
			<ul>
				<li><a href="#">로그인</a></li>|
				<li><a href="#">회원가입</a></li>
			</ul>
		</span>
	</div>
		
	<div class="title">
		<img src="resources/img/dohmain.png" alt="main title"/>		
		<p>Donate Know-How</p>
	</div>

	<div>
		<nav class='menuBar'>
			<ul>
				<li><a href="#">ABOUT</a></li>
				<li><a href="#">LECTURE</a></li>
				<li><a href="#">Q&A</a></li>
				<li><a href="#">FREE-BOARD</a></li>
			</ul>
		</nav>
	</div>
	
	<div style="position: relative;">
		<div class="slider">
				<div class="slider_item"><h1>1</h1></div>
				<div class="slider_item"><h1>2</h1></div>
				<div class="slider_item"><h1>3</h1></div>
				<div class="slider_item"><h1>4</h1></div>
				<div class="slider_item"><h1>5</h1></div>
		</div>
	</div>
	
	
	<div class="footer">
			여긴 FOOTER .
	</div>
	
</body>

<script>
	const SHOWING_CLASS ="showing";
	const firstSlide = document.querySelector(".slider_item:first-child");
	function slide(){
		const currentSlide = document.querySelector('.showing');
		if(currentSlide){
			currentSlide.classList.remove(SHOWING_CLASS);
			const nextSlide = currentSlide.nextElementSibling;
			if(nextSlide){
				nextSlide.classList.add(SHOWING_CLASS);
			}else{
				firstSlide.classList.add(SHOWING_CLASS);
			}
		}else{
			firstSlide.classList.add(SHOWING_CLASS);
		}
	}
	slide();
	setInterval(slide, 2000);
	
</script>
</html>

<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="resources/css/slider.css"></link>
	<style>
		html, body{
			margin: 0;
		}
	</style>
</head>
<body>

 	<%@include file= "includes/header.jsp" %>

	<div class="slider">
		<div class="slider_item"><h1>1</h1></div>
		<div class="slider_item"><h1>2</h1></div>
		<div class="slider_item"><h1>3</h1></div>
		<div class="slider_item"><h1>4</h1></div>
	</div>

	<div style="background-color: gold; margin:0; text-align: center">
		<h1 style="margin-top:0;">여기기기기기기기기</h1>
		<h2>gdkljlkasd</h2>
		<h3 style="margin-bottom:0;">sdoqjsdmlqksmdlk</h3>
	</div>

	<%@include file="includes/footer.jsp" %>

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

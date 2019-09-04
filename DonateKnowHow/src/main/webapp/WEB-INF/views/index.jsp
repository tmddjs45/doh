<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/slider.css"></link>
</head>
<body>
 	<%@include file= "includes/header.jsp" %>
 	<div class="slider-wrapper">
		<div class="slider">
			<div class="slider_item">
				<img src="${path}/resources/img/main.png"/>
			</div>
			<div class="slider_item">
				<img src="${path}/resources/img/maincode.png"/>
			</div>
			<div class="slider_item">
				<img src="${path}/resources/img/maincowork.png"/>
			</div>
			<div class="slider_item">
				<img src="${path}/resources/img/mainjs.png"/>
			</div>
		</div>
		<div class="slider_line"></div>		
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
	setInterval(slide, 3000);
	
</script>
</html>

<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/slider.css"></link>
</head>
<body>
 	<%@include file= "includes/header.jsp" %>
 	
	<div class="slider">
		<div class="slider_item">
			<span class="mainLec"><img src="${path}/resources/img/mainLecture.png"/></span>
		</div>
		<div class="slider_item">
			<span class="mainQA"><img src="${path}/resources/img/mainQA.png"/></span>
		</div>
		<div class="slider_item"><span class="flagImg"><img src="${path}/resources/img/flag.png"/></span></div>
		<div class="slider_item"><span class="donate"><img src="${path}/resources/img/donate.png"/></span></div>

	
	</div>
	
	<div style="background-color: gold; margin:0; text-align: center; width:100%; height: 150px;">
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
	setInterval(slide, 3100);
	
</script>
</html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/frame.css"></link>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%@include file= "includes/header.jsp" %>
	
	<div class="content-temp">
		<div></div>
		<div class="content">
			
			<div class="list">
				List
			</div>
			
			<div class="container">
				<div style="border-right: 2px solid red;">
					코드를 작성해주세요.<br>
					<button class="Btn" type="button" onclick="aa()" style="border: none; border-radius: 10px;">버튼입니당!</button>
				</div>
				
				<div style="background-color: purple;">결과값입니다.</div>
			</div>
		</div>
		<div></div>
	</div>
	
	<%@include file="includes/footer.jsp" %>
</body>
<script>
	function aa(){
		//document.querySelector('.Btn').innerHTML="버튼아니지롱";
		$('.Btn').text("하잉");
	}
</script>
</html>

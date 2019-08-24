<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/Frame.css"></link>
		<style type="text/css">
		html, body {
			margin: 0;
		}
		
		.content {
			border-style: solid;
			display: grid;
			grid-template-rows : 1fr 10fr 1fr;
		}
		.cb-subject{
			border:1px solid black;
		}
		.cb-contentcontainer{
			border:1px solid black;	
			display:grid;
			grid-template-columns:1fr 1fr;	
		}
		.cb-codecompiler{
			border:1px solid black;
			display:grid;
			grid-template-rows:3fr 1fr;
		}
		.cb-btn{
			border:1px solid black;
		}
		.code{
			width:100%;
			height:80%;
		}
		.result{
			width:100%;
			height:80%;
		}
		.content-temp{
		   margin: 0;
		   height:800px;
		   display: grid;
		   grid-template-columns: 1fr 5fr 1fr;
		   text-align: center;
		}
		
		
		
	
		
		
</style>
		
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	
	<div class="content-temp">
		<div></div>
		<div class="content">
			<div class="cb-subject" align="center">
				${list.c_title}
			</div>
			<div class="cb-contentcontainer">
				<div class="cb-content">
					${list.c_content}
				</div>
				<div class="cb-codecompiler">
					<div class="cb-code">
						<textarea  class="code" name ="code"> ${list.c_code}</textarea>
					</div class="cb-compiler">
						<textarea class="result" name="compile">결과창입니다</textarea>
					<div>
					</div>
				</div>
			</div>
			<div class="cb-btn" align="center">
				<input type ="button" id="run" value="COMPILE"/>
				<input type="button"  id="chat" value="ㅊ"/>
				<br>
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.member.nickname"
					var="nickname" />
				<a href="updateform?c_no=${list.c_no}">수정</a>
				| 
				<a href="delete?c_no=${list.c_no}">삭제</a>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
			</sec:authorize>
			</div>		
		</div>
		<div></div>
	</div>
	
	<%@include file="../includes/footer.jsp" %>
	<%@include file="../includes/openS.jsp" %>
</body>
<script>
$(function() {		
	$("#run").click(function() {
		$.ajax({
			type : 'post',
			url : '/cboard/compile',
			data: { code : $('.code').val()},
			dataType : 'text',
			success : function(data) {
				console.log("성공헀음"+data);
				if(data!=null){
				$('.result').text(data);
				}else{
				$('.result').text(data);
				}
				
			},
			error: function(data){
				console.log("실패했어요!"+data);
			}
		});
	})
	})
	
</script>


</html>

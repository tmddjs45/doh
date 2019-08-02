<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboard.css"></link>
	<script src="${path}/resources/js/fboard/fboard.js"></script>
	<style>
		html, body{
			margin: 0;
		}
		a.btn{
			font-size: 25px;
			background-color: gold;
			color: white;
			margin-top: 30px;
			padding: 1px 10px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			border: 5px solid gold;
			border-bottom-color: #AEB404;
			border-right-color: #AEB404;
			border-radius: 10px;
		}
		a.btn.red{
			background-color: red;
			border: 5px solid red;
			border-bottom-color: #B40404;
			border-right-color: #B40404;
		}
		a.btn:hover{
			font-size: 30px;
			color: red;
		}
		a.btn.red:hover{
			color: gold;
		}
	</style>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>	
	
	<div class="container">
		<div></div>
		<div class="content">
			<table>
				<tr>
					<th style="width: 10%;">번호</th>
					<th style="width: 45%;">제목</th>
					<th style="width: 20%;">작성자</th>
					<th style="width: 15%;">날짜</th>
					<th style="width: 10%;">조회</th>
				</tr>
				<c:forEach items="${fboardList}" var="list">
				<tr>
					<td>${list.f_no}</td>
					<td style="text-align: left; padding: 0 20 0 20;">${list.f_title}</td>
					<td>${list.nickname}</td>
					<td>${list.f_rdate}</td>
					<td>${list.f_readnum}</td>
				</tr>
				</c:forEach>
			</table>
			<c:if test="${pageMaker.startPage>1}">
				<a class="btn red" href="${path}/fboard/list?pageNum=1">First</a>
				<a class="btn red" href="${path}/fboard/list?pageNum=${pageMaker.startPage-1}">prev</a>
			</c:if>
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
				<a class="btn" href="${path}/fboard/list?pageNum=${num}">${num}</a>
			</c:forEach>
			<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
				<a class="btn red" href="${path}/fboard/list?pageNum=${pageMaker.endPage+1}">next</a>
				<a class="btn red" href="${path}/fboard/list?pageNum=${pageMaker.totalPage}">Last</a>
			</c:if>
		</div>
		<div></div>
	</div>
	
	<%@include file="../includes/footer.jsp" %>
	
	<script>
		$(function(){
			function getParameterByName(name){
				name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
				var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
					results = regex.exec(location.search);
				return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
			}
	
			function paintBtn(){
				var pageNum = getParameterByName('pageNum');
				var textArray = document.querySelectorAll('.btn'); 
				for(var i = 0; i<textArray.length; i++){
		            if(pageNum == textArray[i].textContent){
		                textArray[i].style.color = "red";
		                textArray[i].style.fontSize = "35px";
		            }           
				}
			}
			function init(){
				paintBtn();
			}
	
			init();
		});
	</script>
</body>
</html>

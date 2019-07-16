<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	ul{
		text-align:center;
	}
	li{
		display:inline-block;
		list-style-type:none;
		margin:5px;
	}
</style>
<title>LIST</title>
</head>
	<body>
			
	<meta charset='utf-8'>
	<center>
		<hr width='600' size='2' noshade>
		<h2>QnA</h2>
		&nbsp;&nbsp;&nbsp;	
		<a href='Qinput'>Question</a>
			&nbsp;&nbsp;&nbsp;
		<a href='../'>INDEX</a>
		<hr width='600' size='2' noshade>
	</center>
	<table border='1' width='600' align='center' cellpadding='2'>
		<tr>
			<th align='center' width='10%'>QNO</th>
			<th align='center' width='15%'>NICKNAME</th>
			<th align='center' width='30%'>EMAIL</th>
			<th align='center' width='30%'>TITLE</th>
			<th align='center' width='40%'>DATE</th>
			<th align='center' width='10%'>COUNT</th>
		</tr>

	<c:forEach items="${list}" var="qboard">	
		<tr>
			<td align='center'><c:out value='${qboard.q_no}'/></td>
			<td><c:out value='${qboard.nickname}'/></td>
			<td><c:out value='${qboard.email}'/></td>
			<td><a href='Qcontent?q_no=<c:out value='${qboard.q_no}'/>'><c:out value='${qboard.q_title}'/></a></td>
			<td><c:out value='${qboard.q_rdate}'/></td>
			<td><c:out value='${qboard.q_count}'/></td>
		</tr>
	</c:forEach>	
	<hr width='600' size='2' noshade>
	</table>

	<table border='1' width='600' align='center' cellpadding='2'>
	<br/>
	</table>
	
	<!-- 	페이징	 -->
		<div class='pull-right'>
			<ul class='pagination'>
				<c:if test=''>
					<li class='paginate_button next'>
						<a href='#'>처음</a>
					</li>
				</c:if>
			
				<c:forEach var='num' begin='${paging.pageStart}' end='${paging.pageEnd}'>
					<li class="paginate_button">
						<a href="list?num=${num}">${num}</a>
					</li>
				</c:forEach>
				
				<c:if test=''>
					<li class='paginate_button next'>
						<a href='#'>마지막</a>
					</li>
				</c:if>
			</ul>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
			$(document).ready(function(){
				$('.paginate_button a').on('click', function(e){
					e.preventDefault();
				});
			});
		</script>
		
	</body>
</html>
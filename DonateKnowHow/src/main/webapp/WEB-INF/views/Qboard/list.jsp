<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
<style type="text/css">
	ul{
		text-align:center;
	}
	li{
		display:inline-block;
		list-style-type:none;
		margin:5px;
	}
	#qtable tr{
		align:center;
	}
</style>
<title>LIST</title>
</head>
	<body>
	<%@include file= "../includes/header.jsp" %>

	<c:forEach items="${list}" var="qboard">	
		<table id='qtable' border='1' width='600' align='center'>
			<br/>
			<tr>
				<td colspan='4'><a href='Qcontent?q_no=<c:out value='${qboard.q_no}'/>'><c:out value='${qboard.q_title}'/></a></td>
			</tr>
			<tr>
				<td colspan='4'><c:out value='${qboard.q_content}'/></td>
			</tr>
			<tr>
				<td rowspan='3' width='20%'>답변유무?</td>	
				<td rowspan='3' width='50%'><c:out value='${qboard.nickname}'/></td>
				<tr><td><c:out value='${qboard.q_rdate}'/></td></tr>
				<tr><td><c:out value='${qboard.q_count}'/></td></tr>
			</tr>
		</table>
	</c:forEach>	
		<hr width='600' size='2' noshade>
	</table>
	<table border='1' width='600' align='center' cellpadding='2'/>
				<!--  페이징  -->
	<div class='pull-right' align='center'>
		<li class='paginate_button next'>
			<a href='list?num=${paging.pageStart -1}'>
			<span aria-hidden='true'>이전</span>
			</a>
			<c:forEach var='num' begin='${paging.pageStart}' end='${paging.pageEnd}'>
				<li test="paginate_button ${paging.pageStart == num ? "active":""}">
					<a href="list?num=${num}">${num}</a>
				</li> 		
			</c:forEach>
			<a href='list?num=${paging.pageEnd +1}'>
				<span aria-hidden='true'>다음</span>
			</a>
		</li>
	</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
			$(document).ready(function(){
				$('.paginate_button a').on('click', function(e){
					e.preventDefault();
					submit();
				});
			});
		</script>
		<%@include file="../includes/footer.jsp" %>
	</body>
</html>
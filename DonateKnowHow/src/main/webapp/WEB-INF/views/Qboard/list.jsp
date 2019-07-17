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
	</style>
	<title>LIST</title>
</head>
	<body>
	<%@include file= "../includes/header.jsp" %>
	
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
	
				<!--  페이징  -->
	<div class='pull-right' align='center'>
		<li class='paginate_button next'>
			<a href='#'>이전</a>
			<c:forEach var='num' begin='${paging.pageStart}' end='${paging.pageEnd}'>
				<li test='${paging.page == num}'>
					<a href="list?num=${num}">${num}</a>
				</li> 		
			</c:forEach>
			<a href='list?num=${paging.pageEnd +1}'>다음</a>
		</li>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
		$(document).ready(function(){
			$('.paginate_button a').on('click', function(e){
				e.preventDefault();
			});
		});
	</script>
		
		<%@include file="../includes/footer.jsp" %>
	</body>
</html>
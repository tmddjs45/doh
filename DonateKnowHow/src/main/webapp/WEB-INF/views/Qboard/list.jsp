<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
	<hr width='600' size='2' noshade>
	<hr width='600' size='2' noshade>
	<table border='1' width='600' align='center' cellpadding='2'>
	<br/>
	</table>
	
	<!-- 페이징 -->
		<div class='pull-right'>
			<ul class='pagination'>
				<c:if test='${pageMaker.prev}'>
					<li class='paginate_button previous'><a href='#'>Previus</a></li>
				</c:if>
				<c:forEach var='num' begin='${pageMaker.startPage}' end='${pageMaker.endPage}'>
					<li class='paginate_button'><a href='#'>${num}</a></li>
				</c:forEach>
				<c:if test='${pageMaker.next}'>
					<li class='paginate_button next'><a href='#'>NEXT</a></li>
				</c:if>
			</ul>
		</div>
	</body>
<script>

</script>
</html>
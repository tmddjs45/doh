<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" 
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LECTURE BOARD</title>
</head>
<body style="text-align: center;">
	<div>
		<table border='1' width='600' align='center' cellpadding='2'>
			<tr>
				<th align='center' width='10%'>글번호</th>
				<th align='center' width='15%'>작성자</th>
				<th align='center' width='15%'>제목</th>
				<th align='center' width='15%'>작성일</th>
			</tr>
			
			<c:forEach items="${list}" var = "board">
			<tr>
				<th align='center' width='10%'><c:out value="${board.c_no}"/></th>
				<th align='center' width='15%'><c:out value="${board.m_no}"/></th>
				<th align='center' width='15%'><a href="content?c_no=${board.c_no}"><c:out value="${board.c_title}"/></a></th>
				<th align='center' width='15%'><c:out value="${board.c_rdate}"/></th>
			</tr>
			</c:forEach>
		</table>
	</div>

	<div><a href="insertform">글작성</a></div>

</body>
</html>
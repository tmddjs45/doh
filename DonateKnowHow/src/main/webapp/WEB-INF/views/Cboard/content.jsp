<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LECTURE BOARD CONTENT</title>
</head>
<body>
<center>
<hr width='600' size='2' noshade>


<table border='1' width='600' align='center' cellpadding='3' >
<tr>
<td width='100' align='center'>글번호</td>
<td><c:out value="${list.c_no}"/></td>
</tr>
<tr>
<td align='center'>글쓴이</td>
<td><c:out value="${list.m_no}"/></td>

</tr>

<tr>
<td align='center'>글제목</td>
<td><c:out value="${list.c_title}"/></td>

</tr>
<tr>
<td align='center'>글내용</td>
<td><c:out value="${list.c_content}"/></td>

</tr>

<tr>
<td align='center'>작성일</td>
<td><c:out value="${list.c_rdate}"/></td>

</tr>

</table>
<hr width='600' size='2' noshade>
<b>
<a href="updateform?c_no=${list.c_no}">수정</a>
| 
<a href="delete?c_no=${list.c_no}">삭제</a>
| 
<a href='list'>목록</a>
</b>
<hr width='600' size='2' noshade>
</center>


</body>
</html>
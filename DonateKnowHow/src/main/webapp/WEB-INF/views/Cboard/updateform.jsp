<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LECTURE BOARD UPDATEFORM</title>
</head>
<body>
<center>
&nbsp;&nbsp;&nbsp;
<a href='list'>글목록</a>
<hr width='600' size='2' noshade>
<form name='f' method='post' action='update'>
<input type='hidden' name='c_no' value='${list.c_no}'>
<input type='hidden' name='c_rdate' value='${list.c_rdate}'>
<input type='hidden' name='m_no' value='${list.m_no}'>
<table border='1' width='600' align='center' cellpadding='3' cellspacing='1'><tr>
<td width='30%' align='center'>글쓴이</td>
<td align='center'><input type='text' name='#' size='60' value='${list.m_no}' disabled></td>
</tr>
<tr>
<td width='30%' align='center'>글제목</td>
<td align='center'><input type='text' name='c_title' size='60' value='${list.c_title}'></td>
</tr>
<tr>
<td width='30%' align='center'>글내용</td>
<td align='center'><textarea name='c_content' rows='5' cols='53' ><c:out value="${list.c_content}"/></textarea></td>

</tr>

<tr>
<td colspan='2' align='center'>
<input type='submit' value='수정'>
</td>
</tr>
</table>
</form>
</table>
<hr width='600' size='2' noshade>
<b>

<a href="delete?c_no=${list.c_no}">삭제</a>
| 
<a href='list'>목록</a>
</b>





</center>

</body>
</html>
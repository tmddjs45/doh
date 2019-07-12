<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LECTURE BOARD INSERTFORM</title>
</head>
<body>


	<form name="input" method="post" action="insert">
	<input type='hidden' name='m_no' value='1'>
	   <table border="1" width="600" align="center"  cellpadding="3" cellspacing="1">
	     
		  <tr>
		     <td align="center">제목</td>
			 <td align="center"><input type="text" name="c_title" size="60"></td>
		  </tr>
           <tr>
		     <td align="center">글내용</td>
			 <td align="center"><textarea name="c_content" rows="5" cols="53"></textarea></td>
		  </tr>
		  <tr>
		     <td colspan="2" align="center">
			    <input type="button" value="전송" onclick="submit()">
				<input type="reset" value="다시입력">
			 </td>
		  </tr>
	   </table>
	   <br>
	   <hr width="600" size="2" noshade>
	</form>


</body>
</html>
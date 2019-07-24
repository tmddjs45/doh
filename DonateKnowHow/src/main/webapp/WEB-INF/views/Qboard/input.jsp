<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>

<title>input</title>
</head>
<body onload="input.name.focus()">
	<%@include file= "../includes/header.jsp" %>
	<center>
	   <hr width="600" size="2" noshade>
	   <h2>QnA INPUT</h2>
	   <hr width="600" size="2" noshade>
	</center>
	
	<form role="form" name="input" method="post">
		<input type="hidden" name="num" value="${cr.num}">
		<input type="hidden" name="pageView" value="${cr.pageView}">
		
	   <table border="1" width="600" align="center"  cellpadding="3" cellspacing="1">
		  <tr>
		     <td align="center">NICKNAME</td>
			 <td align="center"><input type="text" name="nickname" size="60"></td>
		  </tr>
		  
          <tr>
		     <td align="center">TITLE</td>
			 <td align="center"><input type="text" name="q_title" size="60"></td>
		  </tr>

		  <tr>
		     <td align="center">CONTENT</td>
			 <td align="center"><textarea wrap='hard' name="q_content" rows="5" cols="53"></textarea></td>
		  </tr>
		  <tr>
		     <td colspan="2" align="center">
			    <input type="submit" value="SAVE">
				<input type="reset" value="RESET">
				<a href='list'>LIST</a>
			 </td>
		  </tr>
	   </table>
	   <br>
	   <hr width="600" size="2" noshade>
	</form>
	<%@include file="../includes/footer.jsp" %>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/frame.css"></link>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	
	<div class="content-temp">
		<div></div>
		<div class="content">
			
			<form name="input" method="post" action="insert">
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
		     <td align="center">코드</td>
			 <td align="center"><textarea name="c_code" rows="5" cols="53"></textarea></td>
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
			
		</div>
		<div></div>
	</div>
	
	<%@include file="../includes/footer.jsp" %>
</body>
</html>

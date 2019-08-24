<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
<%@include file= "../includes/header.jsp" %>

<h2>이메일보내기</h2>
<form method="psost" action="${path}/cboard/emailsend">
발신자닉 : <input name="senderNickname"><br>
발신자 이메일주소 : <input name="senderMail" ><br>
수신자이메일주소 : <input name="receiveMail"><br>
제목 : <input name="subject"><br>
내용 : <textarea rows="5" cols="50" name="message"></textarea><br>
<input type="submit" value="전송">
</form>

<%@include file="../includes/footer.jsp" %>
</body>
</html>
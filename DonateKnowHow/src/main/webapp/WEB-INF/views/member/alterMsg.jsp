<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script>
	if(${alter_result}==1){
		alert("비밀번호가 재설정 되었습니다. 로그인 해주세요 :)");
		location.href="/";
	}else{
		alert("권한이 맞지 않습니다.");
		location.href="/";
	}
</script>
</html>
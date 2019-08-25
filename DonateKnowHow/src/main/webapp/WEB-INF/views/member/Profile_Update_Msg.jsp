<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
<script>
	let result = ${update_result}
	
	if(result){
		alert("변경 성공했습니다 :)");
		location.href="/";
		
	}else{
		alert("실패했어요 현재 비밀번호를 확인해주세요  :( ");
		let prevPageLink = document.referrer;
		location.replace(prevPageLink);
	}
	
</script>
</html>
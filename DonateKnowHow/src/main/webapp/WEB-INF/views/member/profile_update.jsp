<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile_update</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/memberinfo.css"></link>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/profile_update.css"></link>
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	<div class="wrapper">
		<div class="empty"></div>
		
		<div class="content">
			<div class="profile_update_wrapper">
				<form action="/profile_update" method="post">
					<input type="text" value="${profile.getMember().getEmail()}" readonly="true"/>
					<div></div>
					<input class="update-nickname" name="nickname" type="text" value ="${profile.getMember().getNickname()}"/>
					<div></div>
					<input class="update-password" name="password" type="password" placeholder="변경 할 비밀번호"/>
					<div></div>
					<input class="repeat-password" type="password" placeholder="재입력 해 주세요"/>
					<div></div>
					<input class="update-currentPassword" name="currentPassword" type="password" placeholder="현재 비밀번호 입력해주세요"/>
					<div class="btn-area">
						<button class="clsBtn" type="button" onclick="back()">취소</button>
						<button class="updateBtn" type="button" onclick="submit()">변경</button>
					</div>
				</form>
			</div>
		</div>
		
		<div class="empty"></div>
	</div>
	<%@include file="../includes/footer.jsp"%>
	
<script>

	function back(){
		if(confirm("입력했던 사항이 모두 초기화 됩니다.")==true){
			window.history.back();
		}else{
			return;
		}
	}
	
	
</script>
</body>
</html>
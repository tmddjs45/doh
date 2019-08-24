<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboard.css"></link>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboardWriteForm.css"></link>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	<script src="${path}/ckeditor/ckeditor.js"></script>
	<div class="container">
		<div></div>
		<div class="content">
			<form name="updateForm">
			<!-- 임시로 세션으로 줘야할 값을 무작정 넣었습니다... 나중에 잊지 말고 수정하십시오 장현! 바로 너!!! -->
				<table class="write-table">
					<tr>
						<td><input type="text" name="f_title" placeholder="제목을 입력해주세요" value="${fboardContent.f_title}"></td>
					</tr>
					<tr>
						<td><textarea id="f_content" name="f_content">${fboardContent.f_content}</textarea></td>
					</tr>
					<tr>
						<td><p>본 게시판은 모든 연령의 유저가 이용하는 게시판입니다.<br>
							작성게시글을 올리기 전 유의하셔서, 다른 유저님들에게 불편이 없도록 부탁 드립니다.<br></p></td>
					</tr>
				</table>
				<div class="align">
					<button class="btn" onclick="window.history.go(-1); return false;">취소</button>
					<button type="button" class="btn" onclick="updateButton()">수정</button>
					<input type="hidden" name="f_no" value="${fboardContent.f_no}">
					<input type="hidden" name="search" value="${search}">
					<input type="hidden" name="select" value="${select}">
					<input type="hidden" name="pageNum" value="${pageNum}">
				</div>
			</form>
		</div>
		<div></div>
	</div>
	<script type="text/javascript">
		//id가 f_content인 태그에 ckeditor 적용
		CKEDITOR.replace("f_content",{
			height: '350px'
		});
		function updateButton() {
			var updateForm = document.updateForm;
			var f_title = updateForm.f_title.value;
			var f_content = updateForm.f_content.value;
			console.log(f_title);
			console.log(f_content);
			if(f_title == "" || f_title.length == 0){
			}else{
				updateForm.method = "post";
				updateForm.action = "/fboard/update";
				updateForm.submit();
			}
		}
	</script>
	<%@include file="../includes/footer.jsp" %>
</body>
<script src="${path}/resources/js/fboard/fboard.js"></script>
</html>

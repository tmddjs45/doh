<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Ask</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/memberinfo.css"></link>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/ask.css"></link>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<%@include file="../includes/header.jsp"%>
	
	<div class="wrapper">
		<div class="empty"></div>
		
		<div class="content">
			<div class="ask-board">
			
				<div class="ask-form">
					<div class="title"><img class="img" src="${path}/resources/img/ema.png"></div>
					
				<!--  	<form  method="post" action="${path}/cboard/emailsend"> -->
					<form  method="post" onsubmit="alertshow()" action="${path}/cboard/emailsend">
						<div>
							<select style="width:150px; height:39px;color:gray;" class="b" name = "Kategorie">
								<option value="카테고리선택안함"> KATEGORIE </option>
								<option value="report" >신고합니다</option>
								<option value="request">요청합니다</option>
								<option value="question">문의합니다</option>
							</select>
							<input style="width:250px; height:35px;"  class="b" name="subject" placeholder="SUBJECT">
						</div><br>
						<textarea class="bc" style="width:415px;" rows="14" cols="53" name="message" placeholder="---- 문의 내용은 가입시 적은 이메일로 회신됩니다 ----&#13;&#10;&#13;&#10;---- MESSAGE ----"></textarea>
						<div><input class="btn"type="submit" value="전송"></div>
					</form>
					</div>
				</div>		
			</div>
		<div class="empty"></div>
	</div>
	
	<%@include file="../includes/footer.jsp"%>
<script>

function alertshow() {
	alert("문의하신 내용은 확인 후 이메일로 전송 드리겠습니다");
	return true;

  

}

</script>	
	
	
	
	
	
	
	
	
	
</body>
</html>
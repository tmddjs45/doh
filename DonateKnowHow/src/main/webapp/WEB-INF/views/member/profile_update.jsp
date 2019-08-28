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
				<form name="profile_update_form" action="/profile_update" method="post">
					<input type="text" value="${profile.getMember().getEmail()}" readonly="true"/>
					<div></div>
					<input class="update-nickname" name="nickname" type="text" value ="${profile.getMember().getNickname()}"/>
					<div id="update-nickname-check" class="confirm"></div>
					<input class="update-password" name="password" type="password" placeholder="변경 할 비밀번호"/>
					<div></div>
					<input class="repeat-password" type="password" placeholder="재입력 해 주세요"/>
					<div id="update-password-check" class="confirm"></div>
					<input class="update-currentPassword" name="currentPassword" type="password" placeholder="현재 비밀번호 입력해주세요"/>
					<div class="btn-area">
						<button class="clsBtn" type="button" onclick="back()">취소</button>
						<button class="updateBtn" type="button" onclick="profileUpdate()">변경</button>
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
	
	let profileUpdateTimer;
	let nicknameUpdateFlag = false;
	let passwordUpdateFlag = true;
	let currentUser = '${profile.getMember().getNickname()}';
	
	if($('.update-nickname').val() == currentUser){
		console.log("아아아아ㅏ아앙");
		nicknameUpdateFlag= true;
	}
	
	/* ----- # Debouncing Profile-Update Nickname Check Start  #  ----- */
	const profileUpdateNickname = document.querySelector(".update-nickname");	
	profileUpdateNickname.addEventListener("input",function(){
		
		
		
		if(profileUpdateTimer){
			clearTimeout(profileUpdateTimer);
		}
		
		profileUpdateTimer = setTimeout(function(){
			if($('.update-nickname').val().length==0){
				$('#update-nickname-check').text('빈칸이네요 :( 입력해주세요.').css('color','red');
				nicknameUpdateFlag = false;
			}else if($('.update-nickname').val().length > 28){
				$('#update-nickname-check').text('너무 길어요 :( 다시 입력해주세요.').css('color','red');
				nicknameUpdateFlag = false;
			}else{
				$.ajax({
					url: "./nickcheck",
					type: "POST",
					data: {nickname : $('.update-nickname').val()},
					success: function(responseData){
						if(responseData=="true"){
							$('#update-nickname-check').text('사용 가능한 닉네임 입니다.').css('color','green');
							nicknameUpdateFlag = true;
						
						}else{
							if($('.update-nickname').val() == currentUser){
								console.log("라라라ㅏㄹ라랄");
								nicknameUpdateFlag = true;
	
								
							}else{
								$('#update-nickname-check').text('중복된 닉네임 입니다.').css('color','red');
								nicknameUpdateFlag = false;
								console.log("nicknameFlag : "+nicknameFlag);
							}
						}							
					}
				});
			}
		},1500);
	});
	/* ----- # Debouncing Profile-Update Nickname Check END  #  ----- */
	const profileUpdatePassword = document.querySelector(".update-password");
	const profileUpdateRepeatPassword = document.querySelector(".repeat-password");
	
	profileUpdateRepeatPassword.addEventListener("input", function(){
		if(profileUpdateTimer){
			clearTimeout(profileUpdateTimer);
		}
		profileUpdateTimer = setTimeout(function(){
			if(profileUpdateRepeatPassword.value.length==0){
				document.getElementById("update-password-check").innerHTML="빈칸이네요 :( 입력해주세요.";
				document.getElementById("update-password-check").style.color="red";	
				passwordUpdateFlag = false;
			}else if(profileUpdateRepeatPassword.value.length > 16 || profileUpdateRepeatPassword.value.length < 4){
				document.getElementById("update-password-check").innerHTML="길이가 올바르지 않아요. :( ";
				document.getElementById("update-password-check").style.color="red";
				passwordUpdateFlag = false;
			}else{
				if(profileUpdateRepeatPassword.value == profileUpdatePassword.value){
					/* ---- # Vanilla Javascript # ---- */
					document.getElementById("update-password-check").innerHTML="비밀번호가 일치합니다. :)";
					document.getElementById("update-password-check").style.color="green";
					passwordUpdateFlag=true
				}else{
					document.getElementById("update-password-check").innerHTML="다시 확인해주세요 :( ";
					document.getElementById("update-password-check").style.color="red";
					passwordUpdateFlag=false;
				}	
			}
		},1500);
	});
				
	function profileUpdate(){
		if(passwordUpdateFlag&&nicknameUpdateFlag&&profileUpdatePassword.value.length==profileUpdateRepeatPassword.value.length){
			document.profile_update_form.submit();
		}else{
			alert("입력한 정보를 다시 확인해주세요!");
			return false;
		}
	}
	
</script>
</body>
</html>
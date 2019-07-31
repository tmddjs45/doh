<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" 
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LECTURE BOARD CONTENT</title>
	<style>

.modal{
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 3;
	
}

.modal-overlay{
	background-color: rgba(0, 0, 0, 0.6);
	width:100%;
	height: 100%;
	position: absolute;
	z-index: 3;
}

.modal-content{
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
	position: relative;
	background-color: white;
	padding:20px 15px;
	border-radius:10px;
	text-align: center;
	width: 50%;
	height: 50%;
	z-index: 3;
	
}

.hidden{
	display: none;
}

.modal-content {
	border-radius:10px;
}

.modal-content form{
	margin: 5px;
	text-align: center;
}

.modal-content table{
	margin-left: auto; margin-right: auto;
}


	
	</style>
</head>
<body>
<center>
<hr width='600' size='2' noshade>


<table border='1' width='600' align='center' cellpadding='3' >
<tr>
<td width='100' align='center'>글번호</td>
<td><c:out value="${list.c_no}"/></td>
</tr>
<tr>
<td align='center'>글쓴이</td>
<td><c:out value="${list.m_no}"/></td>

</tr>

<tr>
<td align='center'>글제목</td>
<td><c:out value="${list.c_title}"/></td>

</tr>
<tr>
<td align='center'>글내용</td>

<td><c:out value="${list.c_content}"/></td>


</tr>

<tr>
<td align='center'>작성일</td>
<td><c:out value="${list.c_rdate}"/></td>

</tr>

</table>
<hr width='600' size='2' noshade>
<b>
<a href="updateform?c_no=${list.c_no}">수정</a>
| 
<a href="delete?c_no=${list.c_no}">삭제</a>
| 
<a href='list'>목록</a>
<br><br><br>

<button id = "modalOpen">연습장입니다</button>
<div class="modal hidden">
		<div class="modal-overlay"></div>
		<div class="modal-content">
			<div class="login-form">
				<div>
					<h3>Login text or img</h3>
				</div>
				<form name="modalContent" method="post" action="/cboard/modal">
					<div>
					<input type='hidden' name='c_no' value='${list.c_no}'>
					<textarea name ="code"> ${list.c_content}</textarea>
					<textarea name = "compile">${result}</textarea>
	

						
					</div>
					<br>
					<div >
						<button type="button" onclick="loginSubmitBtn()">Submit</button>
						<button class="cls" type="button">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	<script>
		const openBtn = document.getElementById("modalOpen");
		const modal = document.querySelector(".modal");
		const overlay = modal.querySelector(".modal-overlay");
		const closeBtn = modal.querySelector(".cls");
		
		const openModal = () =>{
			modal.classList.remove("hidden");
		}	
		
		const closeModal = () =>{
			modal.classList.add("hidden");
		}
		
		overlay.addEventListener("click", closeModal);
		openBtn.addEventListener("click", openModal);
		closeBtn.addEventListener("click", closeModal);

		

		
		const loginSubmitBtn = () =>{
			
			modalContent.submit();
		}
	
	</script>


</b>
<hr width='600' size='2' noshade>
</center>


</body>
</html>
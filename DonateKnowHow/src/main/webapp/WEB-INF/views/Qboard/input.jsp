<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<title>input</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/qboard/qboardList.css"/>
<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
<link href="${path}/codemirror/theme/darcula.css" rel="stylesheet"/>
<link href="${path}/resources/css/lecture/lecture.css" rel="stylesheet"></link>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	
	<form role="form" name="input" method="post">
		<input type="hidden" name="num" value="${cr.num}">
		<input type="hidden" name="pageView" value="${cr.pageView}">
		<input type="hidden" name="m_no" value='<sec:authentication property="principal.member.m_no"/>'>
		<div class="input-form">
			<div class='div-in-title'><input class="in-title" type="text" name="q_title" /></div>
			<div><textarea id="editor1" name="q_content"></textarea></div>
			<div><textarea id="editor" name="q_codecontent"></textarea></div>
			<div class="btnLine">
				<button class="backBtn" type="button" onclick="backBtn()">back</button>
				<button class="writeBtn" onclick="writeBtn()">Write</button>
			</div>
		</div>
		
	</form>	
	
	<%@include file="../includes/footer.jsp" %>
	<script src="${path}/codemirror/lib/codemirror.js"></script>
    <script src="${path}/codemirror/mode/xml/xml.js"></script>
    <script src="${path}/codemirror/addon/edit/closetag.js"></script>
	<script src="../ckeditor/ckeditor.js"></script>
	<script>
		CKEDITOR.replace('editor1',{
		});
		function backBtn(){
			history.back();
		}
		function writeBtn(){
			console.log("success");
		}
	
		var editor = CodeMirror.fromTextArea
			(document.getElementById('editor'),{
				mode: "xml",
	     	    theme: "darcula",	
				autoCloseTags: true,
				lineNumbers: true,
				lineWrapping: true,
	     });
	</script>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/qboard/qboardList.css"></link>
<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
<link href="${path}/codemirror/theme/darcula.css" rel="stylesheet"/>
<link href="${path}/resources/css/lecture/lecture.css" rel="stylesheet"></link>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	
	<form name='update' method='post' action='update'>
		<input type="hidden" name="num" value="${cr.num}"/>
		<input type="hidden" name="pageView" value="${cr.pageView}"/>
		<input type="hidden" name="q_no" value="${list.q_no}"/>
		<input type='hidden' name='q_rdate' value='${list.q_rdate}'/>
		
		<div class="update-form">
			<div class='div-in-title'><input class="in-title" type="text" name="q_title" value='${list.q_title}'/></div>
			<div><textarea id="editor1" name="q_content">${list.q_content}</textarea></div>
			<div><textarea id="editor" name="q_codecontent">${list.q_codecontent}</textarea></div>
			<div class="btnLine">
				<button class="backBtn" type="button" onclick="backBtn()">back</button>
				<button class="writeBtn" onclick="writeBtn()">Write</button>
			</div>
		</div>
		
	</form>
	
	<script src="../ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/resources/common/js/ckeditor.js"></script>
	<script src="${path}/codemirror/lib/codemirror.js"></script>
    <script src="${path}/codemirror/mode/xml/xml.js"></script>
    <script src="${path}/codemirror/addon/edit/closetag.js"></script>
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
		<%@include file="../includes/footer.jsp" %>
</body>
</html>
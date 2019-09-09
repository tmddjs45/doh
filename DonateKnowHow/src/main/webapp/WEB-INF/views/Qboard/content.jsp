<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<title>Content</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/qboard/qboardList.css"/>
<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
<link href="${path}/codemirror/theme/darcula.css" rel="stylesheet"/>
<link href="${path}/resources/css/lecture/lecture.css" rel="stylesheet"></link>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	
	<div class="content-form">
		<div class="contentQA">
			<div class="ctitle"><h3>${content.q_title}</h3></div>
			<div class="contentQA-info">
				<div class="content-nickname">${content.nickname}</div>
				<div class="rdate">${content.q_rdate}</div>
				<div>view : ${content.q_readnum}</div>
			</div>
			<div class="content-content">
				${content.q_content}
				<textarea id="editor">${content.q_codecontent}</textarea>
			</div>
		</div>
		<div class="up-list-delBtn">		
			<sec:authentication property="principal" var="principal"/>
				<sec:authorize access="isAuthenticated()">
					<c:choose>
						<c:when test="${principal.username eq content.email}">
							<a class='upBtn' href='update${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>UPDATE</a>
							<a class='listBtn' href='list${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>LIST</a>
							<a class='delBtn' href='delete${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>DELETE</a>
						</c:when>
						
						<c:otherwise>
							<a class='listBtn' href='list${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>LIST</a>
						</c:otherwise>
					</c:choose>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
					<a class='listBtn' href='list${cr.makeQuery(cr.num)}&q_no=${content.q_no}'>LIST</a>
				</sec:authorize>
		</div>
<!-- 		REPLY -->
	<%@include file= "reply.jsp" %>
	
		<form role="form" method="post">
			<input type="hidden" name="num" value="${cr.num}">
			<input type="hidden" name="pageView" value="${cr.pageView}">
			<input type="hidden" name="q_no" value="${content.q_no}">
			<input type="hidden" name="check" value="${check}">
		</form>
	</div>
	<%@include file="../includes/footer.jsp" %>

	<script src="${path}/codemirror/lib/codemirror.js"></script>
    <script src="${path}/codemirror/mode/xml/xml.js"></script>
    <script src="${path}/codemirror/addon/edit/closetag.js"></script>
	<script>
	
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
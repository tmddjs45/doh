<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>D'oh</title>
	<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
    <link href="${path}/codemirror/theme/darcula.css" rel="stylesheet"/>
    <link href="${path}/resources/css/lecture/lecture.css" rel="stylesheet"></link>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${path}/codemirror/lib/codemirror.js"></script>
    <script src="${path}/codemirror/mode/xml/xml.js"></script>
    <script src="${path}/codemirror/addon/edit/closetag.js"></script>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	<script src="${path}/ckeditor/ckeditor.js"></script>
	<div class="container">
		<div class="content">
			<div class="sideMenubar">
				<form name="lectureBar">
					<input type="hidden" name="command"/>
					<input type="hidden" name="lecture_name"/> 
				</form>
				<c:forEach items="${lectureList}" var="list">
					<ul>
						<li>
							<a class="sideBtn" href="${path}/lecture/content?lecture_no=${list.lecture_no}&lecture_name=lecture_css">${list.lecture_title}</a> <!-- 이 부분을 강좌마다 바꾸면 됩니다 -->
						</li>
					</ul>
				</c:forEach>
				<a class="plusBtn" href="javascript:makeLecture();">+</a>
			</div>
			<div id="main">
				<c:choose>
					<c:when test="${command != null }">
						<c:if test="${command eq 'make'}">
						<div class="align">
							<form name="writeForm">
								<input type="hidden" name="lecture_name" value="lecture_css"/>	<!-- 강좌마다 이 부분 바꿔주면 됩니다 -->
								<input class="lecture_title" type="text" name="lecture_title" placeholder="강의 제목을 입력해주세요"/>
								<textarea id="lecture_content" name="lecture_content"></textarea>
								<div>
									<button type="button" id="runBtn" onclick="refresh()">RUN</button>
								</div>
								<div class="edit_container" style="text-align:left;">
									<textarea id="editor" name="lecture_code"></textarea>
								</div>
								<div class="edit_container">
									<iframe id="viewer"></iframe>
								</div>
								<button class="btn2" type="button" onclick="window.history.go(-1); return false;">취소</button>
								<button class="btn2" type="button" onclick="writeButton('new')">등록</button>
							</form>
						</div>
						</c:if>
						<c:if test="${command eq 'modify'}">
							<div class="align">
								<form name="modifyForm">
									<input type="hidden" name="lecture_name" value="lecture_css"/>	<!-- 강좌마다 이 부분 바꿔주면 됩니다 -->
									<input type="hidden" name="lecture_no" value="${oneContent.lecture_no}"/>
									<input class="lecture_title" type="text" name="lecture_title" value="${oneContent.lecture_title}"/>
									<textarea id="lecture_content" name="lecture_content">${oneContent.lecture_content}</textarea>
									<div>
										<button type="button" id="runBtn" onclick="refresh()">RUN</button>
									</div>
									<div class="edit_container" style="text-align:left;">
										<textarea id="editor" name="lecture_code">${oneContent.lecture_code}</textarea>
									</div>
									<div class="edit_container">
										<iframe id="viewer"></iframe>
									</div>
									<button class="btn2" type="button" onclick="window.history.go(-1); return false;">취소</button>
									<button class="btn2" type="button" onclick="writeButton('modify')">수정</button>
								</form>
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${oneContent != null}">
							<div style="float:right; margin: 30px;">
								<form name="changeForm" action="${path}/lecture/delete" method="post">
									<input type="hidden" name="lecture_name" value="lecture_css">	<!-- 강좌마다 이 부분 바꿔주면 됩니다 -->
									<input type="hidden" name="lecture_no" value="${oneContent.lecture_no}">
									<button class="btn2" onclick="modifyButton()">수정</button>
									<button class="btn2">삭제</button>
								</form>
							</div>
							<div class="lectureContentArea">
								<h1>${oneContent.lecture_title}</h1>
								<hr/>
								${oneContent.lecture_content}
							</div>
							<div>
								<button id="runBtn" onclick="refresh()">RUN</button>
							</div>
							<div class="edit_container">
								<textarea id="editor" name="lecture_code">${oneContent.lecture_code}</textarea>
							</div>
							<div class="edit_container">
								<iframe id="viewer"></iframe>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function(){
			var sideMenuOffset = $(".sideMenubar").offset();
			$(window).scroll(function(){
				if($(document).scrollTop() > sideMenuOffset.top){
					$('.sideMenubar').addClass('fixed');
				}else{
					$('.sideMenubar').removeClass('fixed');
				}
			});
		});
		function makeLecture(){
			var sideMenuForm = document.lectureBar;
			sideMenuForm.command.value = "make";
			sideMenuForm.lecture_name.value = "lecture_css"; <%-- 이 부분을 강좌마다 바꾸셔야합니다 --%>
			sideMenuForm.action = "${path}/lecture/tutorial";
			sideMenuForm.method = "post";
			sideMenuForm.submit();
		}
		
		//id가 f_content인 태그에 ckeditor 적용
		CKEDITOR.replace("lecture_content",{
			height: '450px'
		});
		function writeButton(order) {
			if(order == 'new'){
				var writeForm = document.writeForm;
			}else if(order == 'modify'){
				var writeForm = document.modifyForm;
			}
			var lecture_title = writeForm.lecture_title.value;
			var lecture_content = writeForm.lecture_content.value;
			var lecture_code = writeForm.lecture_code.value;
			if(lecture_title == "" || lecture_title.length == 0){
			}else if(order=='new'){
				writeForm.method = "post";
				writeForm.action = "/lecture/write";
				writeForm.submit();
			}else if(order=='modify'){
				writeForm.method = "post";
				writeForm.action = "/lecture/modify";
				writeForm.submit();
			}
		}
		function modifyButton(){
			var changeForm = document.changeForm;
			$(changeForm).attr({action:"${path}/lecture/modifyForm"});
			changeForm.submit();
		}
		
		$(function(){
            var textContent = $('pre.CodeMirror-line > span').text();
            document.getElementById('viewer').srcdoc = textContent;
        });
	
        var editor = CodeMirror.fromTextArea
        (document.getElementById('editor'),{
            mode: "xml",
            theme: "darcula",
            lineNumbers: true,
            autoCloseTags: true
        });
        editor.setSize("100%", "700");
        
        function refresh(){
            var textContent = $('pre.CodeMirror-line > span').text();
            document.getElementById('viewer').srcdoc = textContent;
        }
	</script>
</body>
</html>

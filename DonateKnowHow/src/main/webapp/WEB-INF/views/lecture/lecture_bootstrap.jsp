<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<title>D'oh</title>
	<link href="${path}/codemirror/lib/codemirror.css" rel="stylesheet"/>
    <link href="${path}/codemirror/theme/darcula.css" rel="stylesheet"/>
    <link href="${path}/resources/css/lecture/lecture.css" rel="stylesheet"></link>
    <script src="${path}/ckeditor/ckeditor.js"></script>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	
			<div class="container">
			
			<div class="sideMenubar">
				<ul>		
				<c:forEach items="${lectureList}" var="list">
							<li><a class="sideBtn" href="${path}/lecture/content?lecture_no=${list.lecture_no}&lecture_name=lecture_bootstrap">${list.lecture_title}</a></li><!-- 이 부분을 강좌마다 바꾸면 됩니다 -->						
				</c:forEach>
				<sec:authorize access="hasRole('ROLE_ADMIN')"><li><a class="plusBtn" href="javascript:makeLecture();">+</a></li></sec:authorize>
				</ul>
				<form name="lectureBar">
					<input type="hidden" name="command"/>
					<input type="hidden" name="lecture_name"/> 
				</form>
			</div>
	
			<div id="main">
				<c:choose>
					<c:when test="${command != null }">
						<c:if test="${command eq 'make'}">
						<div class="align">
							<form name="writeForm">
								<input type="hidden" name="lecture_name" value="lecture_bootstrap"/>	<!-- 강좌마다 이 부분 바꿔주면 됩니다 -->
								<input class="lecture_title" type="text" name="lecture_title" placeholder="강의 제목을 입력해주세요"/>
								<textarea id="lecture_content" name="lecture_content"></textarea>

								<div class="edit_container">
										<div class="edit_container_code" style="text-align:left;">
											<textarea id="editor" name="lecture_code"></textarea>
										</div>
										
										<div style="padding:0px 10px;">
											<div>
												<button id="runBtn" type="button" onclick="refresh()">RUN</button>
											</div>
											
											<div class="edit_container_viewer">
												<iframe id="viewer"></iframe>
											</div>
										</div>
									</div>							
									<div class="btn-area">
										<button class="btn2" type="button" onclick="window.history.go(-1); return false;">취소</button>
										<button class="btn2" type="button" onclick="writeButton('new')">등록</button>
									</div>
							</form>
						</div>
						</c:if>
						<c:if test="${command eq 'modify'}">
							<div class="align">
								<form name="modifyForm">
									<input type="hidden" name="lecture_name" value="lecture_bootstrap"/>	<!-- 강좌마다 이 부분 바꿔주면 됩니다 -->
									<input type="hidden" name="lecture_no" value="${oneContent.lecture_no}"/>
									<input class="lecture_title" type="text" name="lecture_title" value="${oneContent.lecture_title}"/>
									<textarea id="lecture_content" name="lecture_content">${oneContent.lecture_content}</textarea>
									
									<div class="edit_container">
										<div class="edit_container_code" style="text-align:left;">
											<textarea id="editor" name="lecture_code">${oneContent.lecture_code}</textarea>
										</div>
										
										<div style="padding:0px 10px;">
											<div>
												<button id="runBtn" type="button" onclick="refresh()">RUN</button>
											</div>
											
											<div class="edit_container_viewer">
												<iframe id="viewer"></iframe>
											</div>
										</div>
									</div>
									
									<div class="btn-area">
										<button class="btn2" type="button" onclick="window.history.go(-1); return false;">취소</button>
										<button class="btn2" type="button" onclick="writeButton('modify')">수정</button>
									</div>
								</form>
							</div>
						</c:if>
					</c:when>
					
					<c:otherwise>
						<c:if test="${oneContent != null}">
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="btn-area">
									<form name="changeForm" action="${path}/lecture/delete" method="post">
										<input type="hidden" name="lecture_name" value="lecture_bootstrap">	<!--  강좌마다 이 부분 바꿔주면 됩니다-->
										<input type="hidden" name="lecture_no" value="${oneContent.lecture_no}">
										<button class="btn2" onclick="modifyButton()">수정</button>
										<button class="btn2" onclick="deleteButton()">삭제</button>
									</form>
								</div>
							</sec:authorize>
							
							<div class="lectureContentArea">
								<h1>${oneContent.lecture_title}</h1>
								<hr/>
								${oneContent.lecture_content}
							</div>			
							
							<div class="edit_container">
								<div class="edit_container_code">
									<textarea id="editor" name="lecture_code">${oneContent.lecture_code}</textarea>
								</div>		
								<div style="padding:0px 10px;">
									<div >
										<button id="runBtn" type="button" onclick="refresh()">RUN</button>
									</div>
									<div class="edit_container_viewer">
										<iframe id="viewer"></iframe>
									</div>
								</div>
							</div>							
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
			</div>
			<%@include file= "../includes/footer.jsp" %>
			
			
			
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${path}/codemirror/lib/codemirror.js"></script>
    <script src="${path}/codemirror/mode/xml/xml.js"></script>
    <script src="${path}/codemirror/addon/edit/closetag.js"></script>
	<script>
		$(document).ready(function(){
			
			var prevScrollpos = window.pageYOffset;

			window.onscroll = function(){
				var currentScrollpos = window.pageYOffset;
				
				if(prevScrollpos > currentScrollpos){
					document.querySelector(".bar").style.top = "0px";
					document.querySelector(".sideMenubar").style.top = "91px";
				
			    }else if($(window).height() - $(window).scrollTop() < window.innerHeight+1){
		               document.querySelector(".sideMenubar").style.height = "629px";
				}else{
					document.querySelector(".bar").style.top = "-92px";
					document.querySelector(".sideMenubar").style.top = "0px";
					 document.querySelector(".sideMenubar").style.height = "721px";	
				}
				
				prevScrollpos = currentScrollpos;
			}
			
			var lectureTitle = '<c:out value="${oneContent.lecture_title}"/>';
	         if(lectureTitle != ""){
	            $("a.sideBtn:contains("+lectureTitle+")").css("backgroundColor", "#2E2E2E").css("color", "white");
	         }
		});
		
		
		function makeLecture(){
			var sideMenuForm = document.lectureBar;
			sideMenuForm.command.value = "make";
			sideMenuForm.lecture_name.value = "lecture_bootstrap"; <%-- 이 부분을 강좌마다 바꾸셔야합니다 --%>
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
		
		 function deleteButton(){
	         var changeForm = document.changeForm;
	         var againCheck =  prompt('정말 삭제하시려면 삭제하겠습니다.를 입력하십시오','');
	         if(againCheck == '삭제하겠습니다.'){
	            changeForm.submit();
	         }
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
            autoCloseTags: true,
            lineWrapping : true
        });
        editor.setSize("100%", "700");
        
        function refresh(){
            var textContent = $('pre.CodeMirror-line > span').text();
            document.getElementById('viewer').srcdoc = textContent;
        }
	</script>
</body>
</html>

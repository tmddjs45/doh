<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
	<title>D'oh</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboard.css"></link>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/fboard/fboardContent.css"></link>
	<style type="text/css">
		html{
			overflow-x: hidden;
		}
		.replyInput{
			position: relative;
			margin-top: 10%;
			left: 50%
		}
		.replyIn{
			position: relative;
			right: 40%;
		}
		#btnReply{
			margin: 0px;
			height: 80px;
			width: 8%;
			float: left;
			background-color: #2E2E2E;
			color: white;
			border-radius: 10px;
			cursor: pointer;
		}
		#replytext{
			height: 80px;
			width: 60%;
			float: left;
			border: 2px solid #D8D8D8;
			border-radius: 10px;
			padding: 10px;
			margin-bottom: 3%;
		}
		#replyTable{
			margin-top: 1%;
		}
		#replyTable th{
			text-align:left;
			border-bottom: none;
		}
		#replyTable td{
			text-align:left;
		}
		td{
			padding: 10px;
		}
	</style>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
	<div class="container">
		<div></div>
		<div class="content">
			<!-- 상세 페이지 테이블입니다! -->
			<table style="box-shadow: 4px 4px 4px 4px gray;">
				<tr>
					<td style="text-align: left;">${fboardContent.f_title}</td>
					<td style="text-align: right;">${fboardContent.f_rdate}</td>
				</tr>	
				<tr>
					<td style="text-align: left;">${fboardContent.nickname}</td>
					<td style="text-align: right;">조회수: ${fboardContent.f_readnum}</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left; padding: 50 20 50 20;">${fboardContent.f_content}</td>
				</tr>
			</table>
			
			
			<!-- 이전글 목록 다음글 a태그 입니다! -->
			<c:choose>
				<c:when test='${search != null && select != null}'>	<!-- 검색 값이 없다면 해당 구문 실행 -->
					<c:if test="${prevNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${prevNum}&search=${search}&select=${select}&pageNum=${prevNum >= miniNum ? pageNum : pageNum+1}" style="width: 20%;">이전 글</a>
					</c:if>
					<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageNum}" style="width: 32%;">목록</a>
					<c:if test="${nextNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${nextNum}&search=${search}&select=${select}&pageNum=${nextNum > maxiNum ? pageNum-1 : pageNum}" style="width: 20%;">다음 글</a>
					</c:if>
				</c:when>
				<c:otherwise>
					<c:if test="${prevNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${prevNum}&pageNum=${prevNum >= miniNum ? pageNum : pageNum+1}" style="width: 20%;">이전 글</a>
					</c:if>
					<a class="btn silver" href="${path}/fboard/list?pageNum=${pageNum}" style="width: 32%;">목록</a>
					<c:if test="${nextNum != 0}">
						<a class="btn silver" href="${path}/fboard/content?f_no=${nextNum}&pageNum=${nextNum > maxiNum ? pageNum-1 : pageNum}" style="width: 20%;">다음 글</a>
					</c:if>
				</c:otherwise>
			</c:choose>
			<hr>
			<button class="btn update" type="button" style="width: 10%; margin-left: 60%;">수정</button>
			<button class="btn delete" style="width: 10%;">삭제</button>
			<!-- 모달 창 만드는 부분 -->
			<div class="modalchang gone">
				<div class="modalchang_overlay"></div>
				<div class="modalchang_content">
					<h2>해당 게시물을 정말 삭제하시겠습니까?</h2>
					<form method="post" action="/fboard/delete" style="display: inline-block;">
						<input type="hidden" name="f_no" value="${fboardContent.f_no}">
						<input type="hidden" name="search" value="${search}">
						<input type="hidden" name="select" value="${select}">
						<input type="hidden" name="pageNum" value="${pageNum}">
						<button class="btn">Yes</button>
					</form>
					<button class="btn" id="closeBtn">No</button>
				</div>
			</div>
			
			<div class="replyInput">
				<div class="replyIn">
					<textarea id="replytext" placeholder="댓글을 남겨주세요" ></textarea>
					<button id="btnReply" type="button">댓글쓰기</button>
				</div>
			</div>

			<table id="replyTable">
			<!--  
			   <tr>
			       <th>장현</th>
			       <td style="font-size: 12px; text-align: right; border-bottom: none;">2019/07/25 23:51</td>
			   </tr>
			   <tr>
			       <td colspan="2" style="border-bottom: none;">테스트 중입니다</td>
			   </tr>
			   <tr>
			       <td>[답글]</td>
			       <td style="text-align: right;">[수정][삭제]</td>
			   </tr>
			   <tr>
			       <th>천승언</th>
			       <td style="font-size: 12px; text-align: right; border-bottom: none;">2019/07/25 23:51</td>
			   </tr>
			   <tr>
			       <td colspan="2" style="border-bottom: none;">응 테스트 방해할거야~</td>
			   </tr>
			   <tr>
			       <td>[답글]</td>
			       <td style="text-align: right;">[수정][삭제]</td>
			   </tr>
			   -->
			</table>
			
			
			
			<table>
				<tr>
					<td style="width: 10%;">번호</td>
					<td style="width: 45%;">제목</td>
					<td style="width: 20%;">작성자</td>
					<td style="width: 15%;">날짜</td>
					<td style="width: 10%;">조회</td>
				</tr>
				<c:forEach items="${fboardList}" var="list">
				<tr>
					<td class="bno">${list.f_no}</td>
					<c:choose>
						<c:when test='${search==null || search.equals("") || select==null || select.equals("")}'>
							<td style="text-align: left; padding: 0 20 0 20;"><a class="titleLink" href="${path}/fboard/content?f_no=${list.f_no}&pageNum=${pageMaker.pageNum}">${list.f_title}</a>
								<c:if test="${list.fc_count>0}">
									<span style="color: red;"> (${list.fc_count})</span>
								</c:if>
							</td>
						</c:when>
						<c:otherwise>
							<td style="text-align: left; padding: 0 20 0 20;"><a class="titleLink" href="${path}/fboard/content?f_no=${list.f_no}&search=${search}&select=${select}&pageNum=${pageMaker.pageNum}">${list.f_title}</a>
								<c:if test="${list.fc_count>0}">
									<span style="color: red;"> (${list.fc_count})</span>
								</c:if>
							</td>
						</c:otherwise>
					</c:choose>
					
					<td>${list.nickname}</td>
					<td>${list.f_rdate}</td>
					<td>${list.f_readnum}</td>
				</tr>
				</c:forEach>
			</table>
			<div>
				<form action="/fboard/list" method="get">
					<input type="text" name="search"/>
					<input type="submit" value="Submit"/>
				<select name="select">
					<option value="title" selected="selected">제목</option>
				    <option value="content">내용</option>
				    <option value="TitleContent">제목+내용</option>
				    <option value="nickname">작성자</option>
				</select>
					<a class="write" href="${path}/fboard/write">✎ 쓰기</a>
					<input type="hidden" name="pageNum" value=1>
				</form>
			</div>
			<c:choose>
				<c:when test='${search==null || search.equals("") || select==null || select.equals("")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("title")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("content")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("TitleContent")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
				
				<c:when test='${select.equals("nickname")}'>
					<c:if test="${pageMaker.startPage>1}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=1">처음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<a class="btn" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${num}">${num}</a>
					</c:forEach>
					<c:if test="${pageMaker.endPage<pageMaker.totalPage}">
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.endPage+1}">다음</a>
						<a class="btn silver" href="${path}/fboard/list?search=${search}&select=${select}&pageNum=${pageMaker.totalPage}">끝</a>
					</c:if>
				</c:when>
			</c:choose>
			
		</div>
	</div>
	
	<script>
		$(function(){
			listReply();
			$("#btnReply").click(function(){
				reply();
			});
		});
		function reply(){
			var fc_content = $("#replytext").val();
			var f_no = "${fboardContent.f_no}";
			var param = {"fc_content":fc_content, "f_no":f_no};
			$.ajax({
				type: "post",
				url: "${path}/fcomment/insert",
				data: param,
				success: function(){
					listReply();
				}
			});
			$("#replytext").val('');
		}

		function listReply(){
			$.ajax({
				type: "get",
				url: "${path}/fcomment/list?f_no=${fboardContent.f_no}",
				success: function(replyList){
					console.log(replyList);	
					var output;
					for(var i in replyList){
						output += "<tr>";
						output += "<th style='font-size:15px;'>"+replyList[i].nickname+"<th>";
						output += "<td style='font-size: 12px; text-align: right; border-bottom: none;'>"+replyList[i].fc_udate+"</td>";
						output += "</tr>";
						output += "<tr>";
						output += "<td colspan='3' style='border-bottom: none; font-size:13px;'><pre>"+replyList[i].fc_content+"</pre></td>";
						output += "</tr>";
						output += "<tr><td style='font-size:12px; padding:5;'>[답글]</td><td colspan='2' style='text-align: right; font-size:12px; padding:5;'>[수정][삭제]</td></tr>";
					}
					$("#replyTable").html(output);
				}
			});
		}
	</script>
	<%@include file="../includes/footer.jsp" %>
</body>
<script src="${path}/resources/js/fboard/fboard.js"></script>
<script src="${path}/resources/js/fboard/fboardContent.js"></script>
</html>

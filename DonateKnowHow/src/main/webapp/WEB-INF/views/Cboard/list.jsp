<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LECTURE BOARD</title>
</head>
<body style="text-align: center;">
	<%@include file= "../includes/header.jsp" %>
	

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var actionForm = $("#actionForm");

						$(".paginate_button a").on(
								"click",
								function(e) {

									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

					
					});
</script>

	<div>
		<table border='1' width='600' align='center' cellpadding='2'>
			<tr>
				<th align='center' width='10%'>글번호</th>
				<th align='center' width='15%'>작성자</th>
				<th align='center' width='15%'>제목</th>
				<th align='center' width='15%'>작성일</th>
			</tr>
			
			<c:forEach items="${list}" var = "board">
			<tr>
				<th align='center' width='10%'><c:out value="${board.c_no}"/></th>
				<th align='center' width='15%'><c:out value="${board.m_no}"/></th>
				<th align='center' width='15%'><a href="content?c_no=${board.c_no}"><c:out value="${board.c_title}"/></a></th>
				<th align='center' width='15%'><c:out value="${board.c_rdate}"/></th>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class='pull-right'>
		<ul class="pagination">



			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage -1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage +1 }">Next</a></li>
			</c:if>


		</ul>
	</div>
	<form id='actionForm' action="/cboard/list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

	</form>
	<div>
		<a href="insertform">글작성</a>
		<a href="conn">연</a>
	</div>

</body>
</html>
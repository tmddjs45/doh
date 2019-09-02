<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/qboard/qboardList.css"></link>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

	<div class="reply-input-form">
		<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member.email" var="email"/>
			<div class="nickname-go-line">
				<div>${nickname}</div>
				<div class="goBtn"><button type="button" onclick="btn_replyInsert(${content.q_no}, ${m_no})">GO</button></div>
			</div>
			<div class='divr_contentIn'><textarea class="r_contentIn" name="a_content" style='width: 97%; height: 50px;' onkeyup="textHeight(this)" ></textarea></div>
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<div><textarea class="a_contentIn" placeholder="로그인 후 답변남기기" style='width: 97%; height: 50px;'></textarea></div>
		</sec:authorize>
	</div>
	<div class="reply-list-form"></div>
	<script>
		function textHeight(e) {
		  e.style.height = "1px";
		  e.style.height = (10+e.scrollHeight)+"px";
		}
		function writeBtn(){
			console.log("success");
		}
	
		$(function() {
			/* 댓글 리스트 출력먼저 실행 */
			getReplyList();
		});	
		
		var loginEmail = "<c:out value='${email}'/>";
		
		var sumCount = 0;
		
		/* 댓글 리스트 출력 */
		function getReplyList() {
			$.ajax({
				type : "GET",
				url : "/qreply/all",
				data : { q_no : "${content.q_no}" },
				success : function(data) {
					
					if (data.length > 0) {
						for(var u in data){
							sumCount += data[u].a_check;
						}
						
						var html = "";
						for (var i in data ) {

						    html += "<div class='replyList'>";
						    html += 	"<div class='reply-info-bar'>"
							html += 	"<div class='reply-nickname'>" + data[i].nickname + "</div>";
							html += 	"<div class='reply-date'>" + data[i].a_rdate + "</div>";
						    html += 	"</div>"
// 										채택버튼
							html +=     "<div class='reply-content-bar'>";
							html += 	"<sec:authentication property='principal' var='principal'/>";
							html += 		"<sec:authorize access='isAuthenticated()'>";
							html += 			"<c:if test='${principal.username eq content.email}'>";
													if(sumCount < 1){	// 0일때
							html +=					"<div class='reply-Btn'><button style='font-size: 12px;' type='button' onclick='checkBtn("+data[i].a_no+",\""+data[i].a_check+"\"); '>채택</button></div>";
													}else{		// 1 일때
														if(data[i].a_check == 1){
							html +=							"<div class='reply-Btn'><button type='button' style='background-color: #4CAF50;font-size: 12px;' disabled='disable' onclick='checkBtn("+data[i].a_no+",\""+data[i].a_check+"\");'>채택</button></div>";
														}else{
							html +=							"<div class='reply-Btn'><button style='font-size: 12px;' type='button' disabled='disable' onclick='checkBtn("+data[i].a_no+",\""+data[i].a_check+"\");'>채택</button></div>";
														}
													}
							html += 			"</c:if>";
							
							html +=				"<c:if test='${principal.username != content.email}'>";
													if(data[i].a_check == 1){
							html +=						"<div class='reply-Btn'><button type='button' style='background-color: #4CAF50; font-size: 12px;' disabled='disable' onclick='checkBtn("+data[i].a_no+",\""+data[i].a_check+"\");'>채택</button></div>";
													}else{
							html +=						"<div class='reply-Btn'><button style='font-size: 12px;' type='button' disabled='disable' onclick='checkBtn("+data[i].a_no+",\""+data[i].a_check+"\");'>채택</button></div>";
													}
							html +=				"</c:if>";
							html +=	 		"</sec:authorize>";
							html += 		"<sec:authorize access='isAnonymous()'>";
							html +=				"<div class='reply-Btn'></div>"
							html += 		"</sec:authorize>"

							html += 	"<div id='r_content"+data[i].a_no+"' class='div_r_content' >";
							html +=			  "<xmp>"+data[i].a_content+"</xmp>";
							html += 	"</div>";
							
							html +=		"<div class='r-updel-line' >";
											if(loginEmail == data[i].email){
							html += 			"<div><button type='button' onclick='updateBtn("+data[i].a_no+")'>수정</button></div>";
							html += 			"<div><button type='button' onclick='deleteBnt("+data[i].a_no+")'>삭제</button></div>";
											}
							html += 			"</div>";
							html += 		"</div>";
							html += 	"</div>";
							html += "<div class='space'></div>";
							html += "<input type='hidden' id='r-email' value='"+data[i].email+"'/>";
							html += "<input class='checkinput' type='hidden' value='"+data[i].a_check+"'/>";
							
						}
					}else{
						var html = "";
						html += "<div class='noreply'> 등록 된 댓글이 없습니다 </div>";
					}
					
					$(".reply-list-form").html(html);
				},
				error : function(request, status){
					console.log("ERROR ---- > " + request.status);
				}
			});
		}
		
		/* 댓글insert */
		function btn_replyInsert(dataQ_no, dataM_no){
			var textarea = $('.r_contentIn').val();
			console.log(" # in  : " + textarea );
				$.ajax({
					type : "POST",
					url : "/qreply/insert",
					data : { q_no : dataQ_no, m_no : dataM_no, a_content : textarea },
					success : function(data){
						getReplyList();
						$('.r_contentIn').val("");
						}
					});
			}
		
		/* 댓글 update Form */
		function updateBtn(a_no){
			


			var textarea = $('#r_content'+a_no).html();
			console.log("#no  : " + a_no);
			console.log("#up  : " + textarea);
			var html = "";
			
			html += "<div>";
			
			html += 	"<textarea id='r_content"+a_no+"' class='r_content' style='width: 139%; height: 50px;' onkeyup='textHeight(this)'>"+textarea+"</textarea>";
			html += "</div>";
			html += "<div class='div-upBtn'>";
			html += 	"<button class='upBtn-go' onclick='updateBtn_go("+a_no+")'>GO</button>";
			html += "</div>";
			
			$("#r_content"+a_no).html(html);
		}
		function changed(){
			var html = "";
			console.log("# click Change");
		}
		/* 댓글 update set */		
		function updateBtn_go(a_no){
			var textarea = $("textarea#r_content"+a_no).val();
			
			console.log("## upGO : " + textarea );
			
			$.ajax({
				type : "POST",
				url : "/qreply/update",
				data : { a_no : a_no , a_content : textarea },
				success : function(data){
					console.log(" ! success ! " + data);
					getReplyList();
				},
				error : function(request, status){
					console.log("ERROR ---- > " + request.status);
				}
			});
		}
		
		/* 댓글 delete */
		function deleteBnt(dataA_no){
			$.ajax({
				type: "POST",
				url : "/qreply/delete",
				data: {a_no: dataA_no},
				success : function(data) {
					alert("삭제완료.");
					getReplyList();
				}
			});
		}
		
		/* 댓글 check */
		function checkBtn(dataA_no, dataA_check){
			$.ajax({
				type: "GET",
				url: "/qreply/checkup",
				data: { 'a_no': dataA_no, 'a_check': dataA_check },
				success: function(data){
					console.log("채택완료" + dataA_check);
					getReplyList();
				},
				error : function(request, status){
					console.log("ERROR - > " + request.status);
				}
			});
		}
	</script>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<div>닉네임</div>
		<button type="button" onclick="btn_replyInsert(${content.q_no})">GO</button>
		<textarea id="a_content" name="a_content" style="width: 98%" placeholder="REPLY"></textarea>
	</div>

	<div id="replyList" style="float:center">
	</div>
	
<script>
		$(function() {
			/* 댓글 리스트 출력먼저 실행 */
			getReplyList();
			});	
		
		/* 댓글 리스트 출력 */
		function getReplyList() {
			$.ajax({
				type : "GET",
				url : "/qreply/all",
				data : { q_no : "${content.q_no}" },
				success : function(data) {
					if (data.length > 0) {
						var html = "";
						for (i = 0; i < data.length; i++) {
							html += "<div class='replyList'>";
							html += "<div><button>채택</button></div>";
							html += "<div>" + data[i].a_no + "</div>";
							html += "<div>" + data[i].nickname + "</div>";
							html += "<div class='update_content" + data[i].a_no + "'>" + data[i].a_content + "</div>";
							html += "<div>" + data[i].a_rdate + "</div>";
							html += "<div><button type='button' onclick='updateBnt("+data[i].a_no+",\""+data[i].a_content+"\");'>up</button>"+
							"<button type='button' onclick='deleteBnt("+data[i].a_no+")'>del</button></div>";
							html += "</div>";
						}
					} else {
						html += "<tr>";
						html += "<td>등록된댓글이없따</td>";
						html += "</tr>";
					}
					$("#replyList").html(html);
				},
				error : function(data){
					console.log("에러 : " +data);
				}
			});
		}
		
		/* 댓글insert */
		function btn_replyInsert(dataQ_no){
				$.ajax({
					type : "POST",
					url : "/qreply/insert",
					data : { q_no : dataQ_no, a_content : $("#a_content").val() },
					success : function(data){
						console.log("-- > " + dataQ_no);
						getReplyList();
						$("#a_content").val("");
						}
					});
			}
		
		/* 댓글 update Form */
		function updateBnt(a_no, a_content){
			console.log("-- > " + a_content);
			
			var html = "";
			html += "<div>";
			html += "<input class='content"+a_no+"' value='"+a_content+"'/>";
			html += "<button onclick='updateBnt_go("+a_no+")'>GO</button>";
			html += "</div>";
			$(".update_content" + a_no).html(html);
		}
		/* 댓글 update set */		
		function updateBnt_go(a_no){
			var updateR = $(".content"+a_no).val();
			
			console.log("go a_no  	-> " + a_no);
			console.log("content   -> " + updateR);
			
			$.ajax({
				type : "POST",
				url : "/qreply/update",
				data : { 'a_no' : a_no , 'a_content' : updateR },
				success : function(data){
					console.log("success ---- > " + data);
					getReplyList();
				},
				error : function(request, status){
					console.log("ERROR ---- > " + request.status);
				}
			});
		}
		
		/* 댓글 delete */
		function deleteBnt(dataA_no){
			console.log("--- delete >" + dataA_no);
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
	</script>
</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<table border='1' width='80%' align='center'>
		<tr>
			<td>
				<div>닉네임</div> 
				<textarea id="a_content" name="a_content" style="width: 98%" placeholder="REPLY"></textarea>
				<button type="button" onclick="btn_replyInsert(${content.q_no})">GO</button>
			</td>
		</tr>
	</table>
	
	<table id="replyList" border='1' width='80%' align='center'>
	</table>
	
	<script>
		$(function() {
			/* 댓글 리스트 출력먼저 실행 */
			getReplyList();
			});	
		
		/* 댓글insert */
		function btn_replyInsert(dataQ_no){
				$.ajax({
					type : "POST",
					url : "/qreply/insert",
					data : { q_no : dataQ_no, a_content : $("#a_content").val() },
					success : function(data){
						getReplyList();
						$("#a_content").val("");
						}
					});
			}
		
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
							html += "<tr align='center'>";
							html += "<td width='8%'><button>채택</button></td>";
							html += "<td width='8%'>" + data[i].a_no + "</td>";
							html += "<td width='10%'>" + data[i].nickname + "</td>";
							html += "<td width='70%'>" + data[i].a_content + "</td>";
							html += "<td>" + data[i].a_rdate + "</td>";
							html += "<td><button class='btn_rupdate' type='button'>up</button>"+
							"<button type='button' onclick='deleteBnt("+data[i].a_no+")'>del</button></td>";
							html += "</tr>";
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
		
		/* 댓글 delete */
		function deleteBnt(dataA_no){
			console.log(dataA_no);
			$.ajax({
				type: "post",
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
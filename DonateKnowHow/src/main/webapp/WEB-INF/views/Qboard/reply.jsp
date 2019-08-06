<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<body>
	<form id="replyInsertForm" method="post">
		<table border='1' width='80%' align='center'>
			<tr>
				<td>
					<div>닉네임</div> 
					<textarea id="a_content" name="a_content" style="width: 98%" placeholder="똥똥똥"></textarea>
					<button type="button" id="btn_replyInsert">GO</button>
				</td>
			</tr>
			<input type="hidden" id="q_no" value="${content.q_no}" />
			
		</table>
	</form>

	<form id="replyListForm">
		<table id="replyList" border='1' width='80%' align='center'>
		</table>
	</form>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(function() {
			//댓글목록불러오기
			getReplyList();
			
			$("#btn_replyInsert").click(function(){
				$.ajax({
					type : "POST",
					url : "/qreply/insert/${content.q_no}",
					data : $("#replyInsertForm").serialize(),
					success : function(data){
						if(data == "success"){
							getReplyList();
							$("#a_content").val("");
							console.log(data);
						}else{
							alert("flase"+data);
						}
					},
					error : function(request,status,error){
						alert(request.status+"\n"+request.responseText+"\n"+error);
					}
				});
			});

			function getReplyList() {
				$.ajax({
					type : "GET",
					url : "/qreply/all/${content.q_no}",
					dataType : "json",
					data : $("#replyListForm").serialize(),
					success : function(data) {
						if (data.length > 0) {
							var html = "";
							for (i = 0; i < data.length; i++) {
								html += "<tr align='center'>";
								html += "<td width='8%'> 채택 </td>";
								html += "<td width='8%'>" + data[i].a_no + "</td>";
								html += "<td width='10%'>" + data[i].nickname + "</td>";
								html += "<td width='70%'>" + data[i].a_content + "</td>";
								html += "<td>" + data[i].a_rdate + "</td>";
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
		});
	</script>
</body>
</html>
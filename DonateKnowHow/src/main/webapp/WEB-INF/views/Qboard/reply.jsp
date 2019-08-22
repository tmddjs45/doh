<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<body>
<!-- 			reply Insert Form	 -->	
	<form id="replyInsertForm" method="post">
		<table  border='1' width='80%' align='center'>
			<tr>
				<td>닉네임</td>
				<td><textarea style="width: 98%" placeholder="Reply"></textarea></td>
				<td width="5%"><button type="button" id="btn_replyInsert">GO</button></td>
			</tr>
		</table>
	</form>
	
<!-- 			reply List Form		 -->	
	<form id="replyListForm" >
		<table id="replyList" border='1' width='80%' align='center'>
		</table>
	</form>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(function() {
			//댓글목록불러오기
			getReplyList();

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
					}
				});
			}
		});
	</script>
</body>
</html>
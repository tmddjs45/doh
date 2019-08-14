<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" 
    pageEncoding="utf-8"%>

<html>
<head>
<meta charset="utf-8">
	<title>D'oh</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/Frame.css"></link>
	<style>
		html, body{
			margin: 0;
		}	
		.content{
			border-style :solid;
			display : grid;
			grid-template-columns: 1fr 1fr 1fr;
			
		}
		.lecture{
			border:2px green dotted;
			height: 500px;
		
		}
		.compiler{
			border:2px red dotted;
		 	height: 500px;
		 	display: grid;
		 	height : 500px;
		 	grid-template-rows: 2fr 1fr;
		}
		
		.chat{
			border:2px yellow dotted;
		 	height: 500px;
		 	display: grid;
		 	height : 500px;
		 	grid-template-rows: 2fr 1fr;
		}
		
	
	</style>
</head>
<body>
	<%@include file= "../includes/header.jsp" %>
 	
	
		<div class="content">
			<div class="lecture">
				<div class="lecture contents">
					<table border ="1px" >
					<tr>
						<td width="250" ><c:out value="${list.c_title}"/></td>
						</tr>
						<tr height="450">
						<td><c:out value="${list.c_content}"/></td>
					</tr>
					</table>
				</div>
			</div>
			<div class="compiler">
				<div class="codeborder">
					
					<textarea style="background-color:black; color:white; width:100%; height:60%" class="code"> ${list.c_code}</textarea>
				
					<input type="button" id="runBtn" value="RUN" />
					
				</div>
				<div>
					<textarea class="result" style="width:100%; height:30%;"name = "compile">${result}</textarea>
				</div>
			</div>		
			<div class="chat">
				
				<div class="catting area">
					<textarea rows="25" cols="30" id="chatarea"></textarea>
				</div>
				<div class="chatting input">
					<input type = "text" id = "msg" value = "1212" class ="form-control"/>
					<button id ="btnSend" class="btn btn-primary">Send message</button>
				</div>
			</div>
					
		
		</div>
		
	
	<%@include file="../includes/footer.jsp" %>
</body>
<script>

	$('#btnSend').on('click', function(evt) {
		  evt.preventDefault();
	if (socket.readyState !== 1) return;
	  	  let msg = $('input#msg').val();
	  	  socket.send(msg);
	  });
	


	$(function() {		
		$("#runBtn").click(function() {
			$.ajax({
				type : 'post',
				url : '/cboard/compile',
				data: { code : $('.code').val()},
				dataType : 'text',
				success : function(data) {
					console.log("성공헀음"+data);
					if(data!=null){
					$('.result').text(data);
					}else{
					$('.result').text(data);
					}
					
				},
				error: function(data){
					console.log("실패했어요!"+data);
				}
			});
		})
		})
		</script>   

		<script>
		var socket = null;
		$(document).ready( function() {
		    connectWS();	
		});
		function connectWS() {
		    console.log("tttttttttttttt")
		    var ws = new WebSocket("ws://localhost:8080/chatEcho");
		    socket = ws;
		    ws.onopen = function () {
		        console.log('Info: connection opened.');
		    };
		    ws.onmessage = function (event) {
		        console.log("ReceiveMessage:", event.data+'\n');
		      
		        $('#chatarea').append(event.data);
		     
		       
		        
		       
		    };
		    ws.onclose = function (event) { 
		        console.log('Info: connection closed.');
		        //setTimeout( function(){ connect(); }, 1000); // retry connection!!
		    };
		    ws.onerror = function (err) { console.log('Error:', err); };
		}
</script>    
  
	
	
	

</html>

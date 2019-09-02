<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/about.css"></link>
</head>
<body>

<%@include file="../includes/header.jsp" %>

<div class="wrapper">
	<div class="empty_left"></div>
	<div class="content">
		<div class="text middle">
        	<span>D</span>
            <span class="hidde">O</span>
            <span class="hidde">N</span>
            <span class="hidde">A</span>
            <span class="hidde">T</span>
            <span class="hidde">E</span>
            <span class="hidde">&nbsp;</span>
            <span class="hidde">K</span>
            <span class="hidde">N</span>
            <span class="showing">'</span>
            <span>O</span>
            <span class="hidde">W</span>
            <span class="hidde">-</span>
            <span>H</span>
            <span class="hidde">O</span>
        	<span class="hidde">W</span>
        </div>

        <h2>우리는 기부를 할 것입니다. 우리들의 노하우를 말이죠.</h2>
	
    	<div style="border-top: 1px solid black; border-bottom: 1px solid black;">
    		<p style="text-align: left;">
    			우리들은 초보개발자입니다. 개발공부를 하면서 여러 난관에 봉착 했을 때 우리는 인터넷 검색을 하며 해결 해 나아 갔어요.
    			다양한 웹 페이지를 탐색 해 가며 어떤 때에는 오로지 영어로만 된 웹 페이지를 해석해가며, 번역기를 돌려가면서 공부를 했어요.
    			<strong>정보는 많았지만 무질서했고, 나에게는 불필요한 정보들도 있었죠.</strong> 어려움이 많았어요.
    		</p>
    		<img src="${path}/resources/img/info.png" >
    		<img src="${path}/resources/img/confused.png" >
    		<p style="text-align: left;">
    			우리는 개발공부에 있어서 꼭 필요한 웹페이지들의 장점을 뽑아 하나의 웹페이지로 만들면 좋지 않을까? 라는 생각을 하게 됐어요.
    			개발 공부를 한다면 누구나 한번 쯤은 보았을 '생활코딩', 검색엔진에 가장 많이 노출되는 사이트인 'Stack OverFlow'
    			그리고 공부할 때 참고 할 수 있는 'W3Schools' 대표적인 이 3가지 사이트를 합쳐보자!!
    		</p>
    		<img src="${path}/resources/img/94.png">
    		<img src="${path}/resources/img/stack.png">
    		<img src="${path}/resources/img/w3.png">
    		<p style="text-align: left;">
    			그 결과 만들어진 웹 페이지가 D'oh 웹 페이지입니다. 사실 아직도 조금 더 나은 서비스를 위해 개발하고 있는 중이에요.<br>
    			D'oh 웹 페이지는 우리 모두 함께 만들어 나가는 것이라고 생각해요. 결국 웹 페이지의 내용들은 우리들의 지식 공유를 바탕으로 만들어 질테니까요.
    			우리가 함께 만들어 나갈 이 웹 페이지가 오늘날 같은 <strong>'오픈소스'</strong> 시대에 드넓은 정보의 <strong>'바다'</strong> 안에서 
    			우리들의 지식들을, 우리들의 노하우들을 다른 사람들에게도 쉽게 전할 수 있는 <strong>'돛단배'</strong>가 되었으면 하는 바람입니다.
    			더 큰 배면 좋구요. 히히 :)
    		</p>
    		<img src="${path}/resources/img/boat.png">
    	</div>
    	
    	<p style="margin-bottom:50px;">그럼 다 같이 기부에 동참 해 볼까요?</p>
    	
	</div><!-- wrapper End -->  
	<div class="empty_right"></div>
</div>   
<%@include file="../includes/footer.jsp" %>
</body>
</html>
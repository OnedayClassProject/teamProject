<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/customcenter/faq.css">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="../../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">FAQ</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/helpMainPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu3"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<div><h1>03. 클래스를 예약하고 싶어요.</h1></div>
        	<hr>
        	<div>
        		<span>클래스 예약하는 방법</span>
        	</div>
        	<hr>
        	<input id="list" type="button" onclick= "location.href='${pageContext.request.contextPath}/faqMainPage.do'" value="목록" ><br><br>
        	<jsp:include page="faqRadio.jsp"/>
        </div>
    </div>
</section>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 10:02 오후
  To change this template use File | Settings | File Templates.
--%>
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
                <a href="${pageContext.request.contextPath}/helpPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu3"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<div><h1>01. 로그인이 안되요.</h1></div>
        	<hr>
        	<div>
        		<span>로그인이 안되는 이유 설명</span>
        	</div>
        	<hr>
        	<input id="list" type="button" onclick= "location.href='${pageContext.request.contextPath}/faqMainPage.do'" value="목록" ><br><br>
        	<jsp:include page="faqRadio.jsp"/>
        </div>
    </div>
</section>
</body>
</html>

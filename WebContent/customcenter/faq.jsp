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
<jsp:include page="../header.jsp"/>
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
        	<div><h2>FAQ</h2></div>
        	<div>
        		<table class="faqtable">
	        		<tr>
	        			<td><a href="${pageContext.request.contextPath}/faqPage.do?value=1">01. 로그인이 안되요.</a></td>
	        		</tr>
	        		<tr>
	        			<td><a href="${pageContext.request.contextPath}/faqPage.do?value=2">02. 비밀번호를 바꾸고 싶어요.</a></td>
	        		</tr>
	        		<tr>
	        			<td><a href="${pageContext.request.contextPath}/faqPage.do?value=3">03. 클래스를 예약하고 싶어요.</a></td>
	        		</tr>
	        		<tr>
	        			<td><a href="#">04. 예약한 클래스를 보고 싶어요.</a></td>
	        		</tr>
	        		<tr>
	        			<td><a href="#">05. 예약한 클래스를 취소 하고 싶어요.</a></td>
	        		</tr>
	        		<tr>
	        			<td><a href="#">06. 회원탈퇴를 하고 싶어요.</a></td>
	        		</tr>
        		</table>
        	</div>
        </div>
    </div>
</section>
</body>
</html>

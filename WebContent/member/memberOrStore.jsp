<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/16
  Time: 4:29 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberOrStore.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <div class="join">
        <div class="member">
            <div><a href="${pageContext.request.contextPath}/memberjoin.do">일반회원가입</a></div>
        </div>
        <div class="store">
            <div><a href="${pageContext.request.contextPath}/storejoin.do">가게회원가입</a></div>
        </div>
    </div>
</section>
</body>
</html>

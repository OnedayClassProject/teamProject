<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 4:48 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="header.css"> 
</head>
<body>
<header>
    <div class="head">
        <div class="login_bar">
            <div><a href="${pageContext.request.contextPath}/login.do">로그인</a></div>
            <div>클래스개설</div>
            <div><a href="${pageContext.request.contextPath}/memberOrStore.do">회원가입</a></div>
        </div>
        <h1><a href="${pageContext.request.contextPath}/main.do">Logo</a></h1>
        <div class="search-bar">
            <form>
                <div class="search-title">SEARCH</div>
                <input type="text" name="search">
            </form>
        </div>
        <nav class="nav-bar">
            <div>클래스</div>
            <div>카테고리</div>
            <div>인기클래스</div>
            <div>지역별</div>
            <div>후기</div>
        </nav>
    </div>
</header>
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 4:51 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- <link rel="stylesheet" href="../header.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberlogin.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <div class="member-login">
        <h2>Logo</h2>
        <hr>
        <div class="login_text">이메일로그인</div>
        <div class="login_box">
        <div><input type="email" placeholder="이메일" name="email"></div>
        <div><input type="password" placeholder="비밀번호" name="password"></div>
        </div>
        <div class="login_choice">
        <input type="radio" name="loginmember" value="store">store
        <input type="radio" name="loginmember" value="member">member
        </div>
        <div class="login_button">
        <button type="button">LOGIN</button>
        <button type="button" onclick="location.href='${pageContext.request.contextPath}/memberOrStore.do'">CREATE</button>
        </div>
    </div>
</section>
</body>
</html>

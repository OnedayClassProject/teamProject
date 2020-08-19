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
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storejoin.css">
</head>
<body>

<jsp:include page="../header.jsp"/>
<section>
    <div class="member_join">
        <form action="./storeDeleteAction.do"  method="post">
            <div>가게 회원탈퇴</div>
            <hr>
            <div class="join_main">
            	<input type="hidden" name="storeemail" value = "${sessionScope.email }">
                <div><input class="join_text" type="password" id="pass1" name="storepw" placeholder="PASSWORD" required ></div>
                <div class="join_text4">
                    <input type="submit" value="회원탈퇴">
                </div>
            </div>
        </form>
    </div>
</section>
</body>
</html>

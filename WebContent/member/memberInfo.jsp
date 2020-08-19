<%@page import="com.member.db.memberDAO"%>
<%@page import="com.member.db.memberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberjoin.css">
</head>

<body>
<jsp:include page="../header.jsp"/>
<section>
    <div class="member_join">
        <form action="${pageContext.request.contextPath}/memberupdate.do" method="post" onsubmit="return Check()">
            <div>회원정보</div>
            <hr>
            <div class="join_main">
                <div><input class="join_text" type="email" name="useremail" id="email" placeholder="EMAIL" value=${ getmember.useremail}></div>
                <div><input class="join_text" type="password" id="userpassword"name="userpassword" placeholder="PASSWORD"></div>
                <div><input class="join_text" type="password" id="pwdcheck" placeholder="PASSWORD"></div>
                <div><input class="join_text" type="text" id="username"name="username" placeholder="NAME"></div>
                <div><input class="join_text" type="text" id="phone" name="phone" placeholder="PHONE NUMBER"></div>
                <div><input class="join_text" type="text" id="sample6_postcode" id="postcode" name="postcode" placeholder="우편번호"></div>
                <input class="join_text" type="text" id="sample6_address" id="address"name="address" placeholder="주소">
                <div class="join_text3">
                    <input type="text" id="sample6_detailAddress" id="detailadd" name="detailadd" placeholder="상세주소">
                    <input type="text" id="sample6_extraAddress" id="extraadd" name="extraadd" placeholder="참고항목">
                </div>
                <div>
                    <input type="submit" value="수정">
                    <input type="button" value="탈퇴" onclick="location.href='${pageContext.request.contextPath}/memberdelete.do'">
                </div>
            </div>
        </form>
    </div>
</section>


</body>
</html>
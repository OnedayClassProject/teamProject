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
<%
	String email = (String)session.getAttribute("userid");

	if(email == null){
		response.sendRedirect("memberLogin.jsp");
	}
%>
<section>
    <div class="member_join">
        <form>
            <div>회원 정보 조회</div>
            <hr>
            <div class="join_main">
                <div>
                    <input  class="join_text" type="email" name="useremail" id="email" placeholder="EMAIL" readonly value="${getMember.useremail}">
                </div>
                <div><input class="join_text" type="text" id="username"name="username" placeholder="NAME" readonly value="${getMember.username }"></div>
                <div><input class="join_text" type="text" id="phone" name="phone" placeholder="PHONE NUMBER" readonly value="${getMember.phone }"></div>
                <div class="join_text3">
                	<input type="text" id="sample6_address" class="address"name="address" placeholder="주소" readonly value="${getMember.address }">
                    <input type="text" id="sample6_postcode" class="postcode" name="postcode" placeholder="우편번호" readonly value="${getMember.postcode }">
                	
                </div>
                
                <div class="join_text3">
                
                    <input type="text" id="sample6_detailAddress" class="detailadd" name="detailadd" placeholder="상세주소" readonly value="${getMember.detailadd }">
                    <input type="text" id="sample6_extraAddress" id="extraadd" name="extraadd" placeholder="참고항목" readonly value="${getMember.extraadd }">
                </div>
                <div><input class="join_text" type="text" id="membership" placeholder="회원등급" readonly value="${getMember.membership }"></div>
                <div><input class="join_text" type="text" id="point" placeholder="포인트" readonly value="${getMember.point }"></div>
                <div class="join_text4">
                	<input type="button" value="회원 정보 수정" onclick="location.href='${pageContext.request.contextPath}/memberUpdate.do'">
                	<input type="button" value="회원 탈퇴" onclick="location.href='${pageContext.request.contextPath}/memberDelete.do'">
                </div>
            </div>
        </form>
    </div>
</section>

</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 10:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storePwCheck.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/member/reserveList.css">
	
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script>
	function infoCheck() {
		var form = $("#infoform").serialize();
		var password = $("#password").val().trim();
		if(password==""){
    		alert("비밀번호를 입력하세요.");
    	}else{
			$.ajax('${pageContext.request.contextPath}/memberDelete.do',{
				type:"post",
				data:form,
				success:function(data){
					if(data == 1){
						alert("회원 탈퇴 성공했습니다.");
						location.href="${pageContext.request.contextPath}/logout.do";
						
					}else{
						alert("비밀번호가 틀렸습니다.");
					}
				}, error:function(data){
					alert("에러가 발생했습니다.");
				}
			});
    	}
	}
</script>
<jsp:include page="../header.jsp"/>
<c:if test="${empty sessionScope.userid}">
<script type="text/javascript">
	alert("잘못된접근방법입니다.");
    location.href="${pageContext.request.contextPath}/main.do";
</script>
</c:if>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
        <div class="current_menu">탈퇴하기</div>	
        <div class="line"></div>
           <div class="side_detail">
                <a href='${pageContext.request.contextPath}/memberReserve.do'><div>예약확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/memberRefund.do'><div>환불확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/MemberCheckInfoPage.do'><div>정보보기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage2.do'><div>수정하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage3.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
             <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberReview.do'><div>리뷰관리</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberFavor.do'><div>즐겨찾기 관리</div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
                <div class="member_join">
        <form id = "infoform" method="post">
            <div class="check_text">탈퇴하기</div>
            <hr>
            <div class="pw_check">
            	<input type="hidden" id = "useremail" name="useremail" value = "${sessionScope.userid}">
            	<div class="pw_check3">
            		<div class="email_check">
            			<div>${sessionScope.userid}</div>
            		</div>
            	<div class="pw_check2">
                	<div><input class="join_text" type="password" id="password" name="password" placeholder="PASSWORD" ></div>
                </div>
                </div>
                <div class="join_text4">
                    <input type="button" onclick="infoCheck()" value="PASSWORD">
                </div>
            </div>
        </form>
    </div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>

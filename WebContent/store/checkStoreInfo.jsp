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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storePwCheck.css">
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
			$.ajax('${pageContext.request.contextPath}/storeInfoCheckAction.do',{
				type:"post",
				data:form,
				success:function(data){
					if(data == 1){
						location.href="${pageContext.request.contextPath}/storeInfoPage.do";
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
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/storeReserve.do'>
                <div>예약확인</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeRefund.do'> 
                <div>환불확인️</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>정보보기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage2.do'><div>수정하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage3.do'><div>탈퇴하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
                <div class="member_join">
        <form id = "infoform" method="post">
            <div class="check_text">정보보기</div>
            <hr>
            <div class="pw_check">
            	<input type="hidden" id = "email" name="storeemail" value = "${storeid}">
            	<div class="pw_check3">
            		<div class="email_check">
            			<div>${sessionScope.storeid}</div>
            		</div>
            	<div class="pw_check2">
                	<div><input class="join_text" type="password" id="password" name="storepw" placeholder="PASSWORD" ></div>
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

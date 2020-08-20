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
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script>
	function deleteCheck() {
		var form = $("#deleteform").serialize();
		var password = $("#password").val();
		if(password==""){
    		alert("비밀번호를 입력하세요.");
    	}else{
			$.ajax('${pageContext.request.contextPath}/storeDeleteAction.do',{
				type:"post",
				data:form,
				success:function(data){
					if(data == 1){
						alert("회원탈퇴하셨습니다.");
						location.href="${pageContext.request.contextPath}/logout.do"
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
    <div class="member_join">
        <form id = "deleteform" method="post">
            <div>회원탈퇴</div>
            <hr>
            <div class="join_main">
            	<input type="hidden" id = "email" name="storeemail" value = "${storeid}">
                <div><input class="join_text" type="password" id="password" name="storepw" placeholder="PASSWORD" required ></div>
                <div class="join_text4">
                    <input type="button" onclick="deleteCheck()" value="회원탈퇴">
                </div>
            </div>
        </form>
    </div>
</section>
</body>
</html>

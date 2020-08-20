<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- <link rel="stylesheet" href="../header.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberjoin.css">
</head>
	<%
	String email = (String)session.getAttribute("userid");
	
	if(email == null){
		response.sendRedirect("memberLogin.jsp");
	}
%>
<script>
	$(function(){
		$(".join_text4").on("click",function(){
			var form = $("#fr").serialize();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/memberLoginPro.do",	
				data :form,
				dataType : "text",
				success:function(data){
					if(data == 1){
						location.href="${pageContext.request.contextPath}/mypagePro.do";
					}else{
						alert("비밀번호가 틀렸습니다.");
					}
				}
			})
		});
	})
</script>


<body>
<jsp:include page="../header.jsp"/>
<section>
	<form action="${pageContext.request.contextPath}/mypagePro.do" method="post" id="fr">
		<div>비밀번호 확인</div>
		<hr>
		<div class ="join_main">
			<div>
				<input class="join_text" type="password" name="password" placeholder="PASSWORD">
				<input type="hidden" value="${sessionScope.userid}" name="email">
			</div>
			<div class="join_text4"><input type="button" value="확인"></div>
		</div>
	</form>
</section>
</body>
</html>
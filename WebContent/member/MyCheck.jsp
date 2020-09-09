<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- <link rel="stylesheet" href="../header.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberjoin.css">
</head>
<c:if test="${empty sessionScope.userid}">
<script type="text/javascript">
	alert("잘못된접근방법입니다.");
    location.href="${pageContext.request.contextPath}/main.do";
</script>
</c:if>
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
<jsp:include page="../footer.jsp" />
</body>
</html>
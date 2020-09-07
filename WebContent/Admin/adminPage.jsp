<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/member/mypage.css">

</head>
<body>
<jsp:include page="../header.jsp" />
<section>
	<div class="my_wrap">
	<div class="side_menu">
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/AllGetMember.do'><div>회원조회</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/AllGetStore.do'><div>업체조회</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            
        </div>
	</div>

</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
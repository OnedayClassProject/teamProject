<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/member/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/reserveList.css">

</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
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
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/AllGetReservation.do'><div>예약조회</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            
        </div>
        <div class="my_main">
        	<div>업체 리스트</div>
        	<hr>
        	<div>
        		<div class="reserveInfo">
        			<div>업체 이메일</div>
        			<div>업체 이름</div>
        			<div>업체 전화번호</div>
        			<div>업체 주소</div>
        			<div>업체 우편번호</div>
        			<div>업체 가입날짜</div>
        		</div>
        		<div class="line"></div>
        		<!-- 회원 목록 반복 -->
        		<c:forEach var="getStore" items="${AllGetStore }">
        		<div class="reserveInfo">
        			<div>${getStore.storeemail }</div>
        			<div>${getStore.storename }</div>
        			<div>${getStore.storetel }</div>
        			<div>${getStore.storeaddress1}</div>
        			<div>${getStore.storepostcode }</div>
        			<div>${getStore.store_joindate }</div>
        			
        			
        		</div>
        		<hr>
        		</c:forEach>
        		<!-- 반복 -->
        		
        	</div>
        </div>
	</div>

</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
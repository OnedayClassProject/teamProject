<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/Admin/allGetMember.css">

</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<body>
<jsp:include page="../header.jsp" />
<section>
	<div class="my_wrap">
		<div class="side_menu">
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/AllGetMember.do'><div>회원조회</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/AllGetStore.do'><div>업체조회</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/AllGetReservation.do'><div>예약조회</div>
                </a>
            </div>
            <hr>
            
        </div>
        <div class="my_main">
        	<div>회원 리스트</div>
        	<hr>
        	<div>
        		<div class="reserveInfo">
        			<div>회원 이메일</div>
        			<div>회원 이름</div>
        			<div>전화번호</div>
        			<div>주소</div>
        			<div>우편번호</div>
        			<div>가입날짜</div>
        			<div>포인트</div>
        			<div>회원등급</div>
        			<div>VIP 가입 날짜</div>
        			<div>VIP 종료 날짜</div>
        		</div>
        		<div class="line"></div>
        		<!-- 회원 목록 반복 -->
        		<c:forEach var="getMem" items="${AllGetMem }">
        		<div class="reserveInfo">
        			<div>${getMem.useremail }</div>
        			<div>${getMem.username }</div>
        			<div>${getMem.phone }</div>
        			<div>${getMem.address}</div>
        			<div>${getMem.postcode }</div>
        			<div>${fn:substring(getMem.joindate,0,10) }</div>
        			<div>${getMem.point }</div>
        			<div>${getMem.membership }</div>
        			<div>${getMem.vip_startdate }</div>
        			<div>${getMem.vip_finish }</div>
        			
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
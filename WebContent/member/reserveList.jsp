<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/reserveList.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>

<c:choose>
    <c:when test="${check eq 0}">
        <script>alert("리뷰작성기간이 아닙니다.")</script>
    </c:when>
    
    <c:when test="${check eq 1}">
  		<script>alert("리뷰작성기간이 지났습니다.")</script>
    </c:when>
    
    <c:otherwise> </c:otherwise>
</c:choose>

<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
                <a href='${pageContext.request.contextPath}/memberReserve.do'><div>예약확인</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/memberRefund.do'><div>환불확인</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/MemberCheckInfoPage.do'><div>정보보기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage2.do'><div>수정하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage3.do'><div>탈퇴하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
            <div>예약리스트</div>
                <hr>
           	<div>

           		<div class="line"></div>
           		
	           		<div class="reserveInfo2">
	           			<div class="reserveInfo3">
		           			<div class="class_pic thumbnail">  </div>
		           			<div class="class_name">
	           				</div>
	           			</div>
	           			<div class="reserveInfo4">${GetReserve.user_name }</div>
	           			<div class="reserveInfo4">${GetReserve.reservation_personnel }</div>
	           			<div class="reserveInfo5">${GetReserve.reservation_date } ${GetReserve.time }</div>
	           			<button class="reserveInfo4" onclick="location.href='${pageContext.request.contextPath}/boardWrite.do?reservationnum=1&reservation_date=2020-09-01'">
	           				후기작성
	           			</button>
	           		</div>
           		
           	</div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
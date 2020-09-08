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
<body><jsp:include page="../header.jsp"/>
<section>
	<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeReserve.do'>
                <div>예약확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeRefund.do'> 
                <div>환불확인️</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>정보보기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage2.do'><div>수정하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage3.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeMyClassInfo.do'><div>내가 등록한 클래스</div>
                </a>
            </div>
        </div>
            <div class="my_main">
            <div>예약리스트</div>
                <hr>
           	<div>
           		<div class="reserveInfo">
           			<div>클래스명</div>
           			<div>결제금액</div>
           			<div>예약자 명</div>
           			<div>예약인원</div>
           			<div>예약날짜</div>
           			<div>전화번호</div>
           			<div>요청사항</div>
           			<div>기타</div>
           		</div>
           		<div class="line"></div>
           		
           		
           		<c:forEach var="GetReserve" items="${GetReserve }">
           			
		           		<div class="reserveInfo2">
			           			
				           	<div>${GetReserve.class_name }</div>
				           	<div>${GetReserve.reservation_price }</div>
		           				
		           			<div>${GetReserve.user_name }</div>
		           			<div class="reserveInfo4">${GetReserve.reservation_personnel }</div>
		           			<div class="reserveInfo5">${GetReserve.reservation_date }/${GetReserve.time }</div>
		           			<div class="reserveInfo4">${GetReserve.reservation_tel}</div>
		           			<div class="reserveInfo4">${GetReserve.content }</div>
		           			<c:if test="${GetReserve.refundCheck eq 1 }">
		           				<div>환불완료</div>
		           			</c:if>
		           		</div>
           			
           		</c:forEach>
           		
           		
           	</div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/store/reserveList.css">
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@700&family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"/>
<c:if test="${empty sessionScope.storeid }">
<script type="text/javascript">
	alert("로그인해주세요!!");
    location.href="${pageContext.request.contextPath}/login.do";
</script>
</c:if>
<section>
	<div class="pic"><div>STOREPAGE</div></div>
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
           			<div>기타</div>
           		</div>
           		<div class="line"></div>
           		
           		<c:if test = "${count != 0 }">
	           		<c:forEach var="GetReserve" items="${GetReserve }">
	           			
			           		<div class="reserveInfo2">
				           			
					           	<div class="reserveInfo3">${GetReserve.class_name }</div>
					           	<div class="reserveInfo4">${GetReserve.reservation_price }</div>
			           				
			           			<div class="reserveInfo5">${GetReserve.user_name }</div>
			           			<div class="reserveInfo4">${GetReserve.reservation_personnel }</div>
			           			<div class="reserveInfo4">${GetReserve.reservation_date }<br>${GetReserve.time }</div>
			           			<div class="reserveInfo4">${GetReserve.reservation_tel}</div>
			           			<c:if test="${GetReserve.refundCheck eq 1 }">
			           				<div class="reserveInfo4">환불완료</div>
			           			</c:if>
			           			<c:if test="${GetReserve.refundCheck eq 0 }">
			           				<div class="reserveInfo4"></div>
			           			</c:if>
			           		</div>
	           			
	           		</c:forEach>
	           		<div class="pageNum">
	            	<c:if test="${pageNum > 1}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/storeReserve.do?pageNum=${1}'"> << </div>
	            	</c:if>
	            	<c:if test="${pageNum > startPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeReserve.do?pageNum=${pageNum-1}'"> < </div>
	            	</c:if>
	            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeReserve.do?pageNum=${i}'">${i}</div>
	            	</c:forEach>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeReserve.do?pageNum=${pageNum+1}'"> > </div>
	            	</c:if>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/storeReserve.do?pageNum=${pageCount}'"> >> </div>
	            	</c:if>
	            	</div>
           		</c:if>
           		
           	</div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
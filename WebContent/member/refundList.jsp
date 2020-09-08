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
        <div class="current_menu">환불리스트</div>	
        <div class="line"></div>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/memberReserve.do'><div>예약확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/memberRefund.do'><div>환불확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/MemberCheckInfoPage.do'><div>정보보기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage2.do'><div>수정하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage3.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
            <div>환불리스트</div>
            <hr>
           	<div>
           		<div class="reserveInfo">
           			<div>클래스정보</div>
           			<div>예약자 명</div>
           			<div>예약인원</div>
           			<div>예약날짜</div>
           			<div>환불금액</div>
           			<div>환불신청날짜</div>
           			<div>환불승인날짜</div>
           			<div>환불 진행사항</div>
           		</div>
           		<div class="line"></div>
           		<c:if test ="${count != 0 }">
           		<c:forEach var = "list" items="${list }">
           		<div class="reserveInfo2">
           			<div class="reserveInfo3">
	           			<div class="class_pic">
							<a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${list.class_registrynum}">
	           					<img src="${pageContext.request.contextPath}/thumbnailImage/${list.thumbnail}">
	           				</a>
						</div>
	           			<div class="class_name">
		           			<div>${list.category }</div>
		           			<div>${list.class_name }</div>
		           			<div>${list.refund_price }</div>
           				</div>
           			</div>
           			<div>${list.user_name }</div>
           			<div class="reserveInfo4">${list.reservation_personnel }</div>
           			<div class="reserveInfo5">${list.time }</div>
           			<div>${list.request_day }</div>
           			<div>${list.refund_date }</div>
           			<div>
           				
           				<c:if test="${list.state eq 0 }" >
           					<div>대기</div>
           					<button>환불취소</button>
           				</c:if>
           				<c:if test="${list.state eq 1 }">
           					<div>환불완료</div>
           				</c:if>
           			</div>
           		</div>
           
            </c:forEach>
	            <div class="pageNum">
	            	<c:if test="${pageNum > 1}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/memberReserve.do?pageNum=${1}'"> << </div>
	            	</c:if>
	            	<c:if test="${pageNum > startPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/memberReserve.do?pageNum=${pageNum-1}'"> < </div>
	            	</c:if>
	            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/memberReserve.do?pageNum=${i}'">${i}</div>
	            	</c:forEach>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/memberReserve.do?pageNum=${pageNum+1}'"> > </div>
	            	</c:if>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/memberReserve.do?pageNum=${pageCount}'"> >> </div>
	            	</c:if>
	            </div>
            </c:if>
            </div>
           		<c:if test="${count == 0 }">
	          		<div class="no_list">LIST가 없습니다.</div>
	          	</c:if>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
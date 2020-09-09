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
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeMyClassInfo.do'><div>내가 등록한 클래스</div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
            <div>환불리스트</div>
                <hr>
           	<div>
           		<div class="reserveInfo">
           			<div>클래스명</div>
           			<div>환불금액</div>
           			<div>환불인원</div>
           			<div>수업날짜</div>
           			<div>환불신청날짜</div>
           			<div>환불승인날짜</div>
           			<div>환불처리</div>
           		</div>
           		<div class="line"></div>
           		
           		<c:if test="${count != 0 }">
	           		<c:forEach var="GetRefund" items="${StoreGetCancle }">
		           		<div class="reserveInfo2">
		           			<div>${GetRefund.class_name }</div>
		           			<div>${GetRefund.refund_price }</div>
		           			<div class="reserveInfo4">${GetRefund.reservation_personnel }</div>
		           			<div class="reserveInfo5">${GetRefund.reservation_date} / ${GetRefund.time }</div>
		           			<div>${GetRefund.request_day }</div>
		           			<div>${GetRefund.refund_date }</div>
		           			<div class="state">
		           				<input type="hidden" class="refundnum" value="${GetRefund.refundnum }">
		           				<c:if test="${GetRefund.state eq 0 }">
		           					<div class="reserveInfo4">대기</div>
		           					<button class="refund_com">환불승인</button>
		           				</c:if>
		           				<c:if test="${GetRefund.state eq 1 }">
		           					<div class="reserveInfo4">환불완료</div>
		           				</c:if>
		           			</div>
		           		</div>
	           		
	           		</c:forEach>
	           		<div class="pageNum">
	            	<c:if test="${pageNum > 1}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/storeRefund.do?pageNum=${1}'"> << </div>
	            	</c:if>
	            	<c:if test="${pageNum > startPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeRefund.do?pageNum=${pageNum-1}'"> < </div>
	            	</c:if>
	            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeRefund.do?pageNum=${i}'">${i}</div>
	            	</c:forEach>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeRefund.do?pageNum=${pageNum+1}'"> > </div>
	            	</c:if>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/storeRefund.do?pageNum=${pageCount}'"> >> </div>
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
<script>
$(".refund_com").on("click",function(){
	var refundnum = $(this).parents(".state").find(".refundnum").val();
	
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath}/RefundCom.do",
		dateType : "text",
		data : {refundnum : refundnum},
		success : function(data,status){
			if(data == 1){
				alert("환불 승인 완료했습니다.")
				location.href="${pageContext.request.contextPath}/storeRefund.do";
			}
		},
		error:function(data,status){
			alert("에러가 발생했습니다.")
		}
	});
});
</script>
</body>
</html>
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
        <div class="current_menu">예약리스트</div>	
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
            <div>예약리스트</div>
                <hr>
           	<div>
           		<div class="reserveInfo">
           			<div>예약정보</div>
           			<div>예약인원</div>
           			<div>예약날짜</div>
           			<div>환불여부</div>
           		</div>
           		<div class="line"></div>
           		<c:if test="${count != 0 }">
           		<c:forEach var="list" items="${list }">
           		<div class="reserveInfo2">
           			<div class="reserveInfo3">
	           			<div class="class_pic">
	           				<img src="${pageContext.request.contextPath}/thumbnailImage/${list.thumbnail}">
	           			</div>
	           			<div class="class_name">
		           			<div>${list.category }</div>
		           			<div>${list.class_name }</div>
		           			<div>${list.class_company }</div>
           				</div>
           			</div>
           			<div class="reserveInfo4">${list.personnel }</div>
           			<div class="reserveInfo5">${list.time }</div>
           			<div class="reserveInfo8">
           			<div class="reserveInfo7">환불</div>
           			
           				<input type="hidden" value="${list.rating }">
           				<c:if test="${list.reviewCheck eq 0 }">
           				<button class="reserveInfo6" >후기작성</button>
           				</c:if>
           				<c:if test="${list.reviewCheck ne 0 }">
           				<div>작성완료</div>
           				</c:if>
           				<input type="hidden" value="${list.class_registrynum }">
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
<script>
	$('.reserveInfo6').on("click", function(){
		
		 var date  = $(this).parent().prev().text();
		 var classnum = $(this).next().val();
		 var reservenum = $(this).prev().val();
		
		 $.ajax({
			 type:"post",
			 url:"${pageContext.request.contextPath}/reviewCheck.do",
			 data:{date : date},
			 dataType:"text",
			 success:function(data, status){
				if(data == 1){
					alert("리뷰를 쓸 수 있습니다.");
					if(confirm('한번 작성하면 다시 작성하지 못합니다.(수정불가)') == true){
						location.href='${pageContext.request.contextPath}/boardWrite.do?class_registrynum='+classnum+'&reservnum='+reservenum+'&date='+date;
					}
				} else if(data == 2){
					alert("기간이 지나서 쓰실 수 없습니다.");
				} else if(data == 3){
					alert("기간이 되지 않아서 쓰실 수 없습니다.");
				}
			 },
			 error:function(data,status){
				 alert('에러');
			 }
		 });
	});
</script>
</body>
</html>
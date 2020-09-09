<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
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
        <div class="current_menu">리뷰리스트</div>	
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
             <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberReview.do'><div>리뷰관리</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberFavor.do'><div>즐겨찾기 관리</div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
            <div>리뷰리스트</div>
            <hr>
           	<div>
           		<div class="reserveInfo">
           			<div>리뷰정보</div>
           			<div>수업날짜</div>
           			<div>리뷰작성일</div>
           			<div>기타</div>
           			
           		</div>
           		<div class="line"></div>
           		<c:if test ="${count != 0 }">
           		<c:forEach var = "list" items="${list }">
           		<div class="reserveInfo2">
           			<input type="hidden" class="class_registrynum" value="${list.class_registrynum }">
           			<input type="hidden" class="reviewNum" value="${list.reviewnum }">
           			<div class="reserveInfo3">
	           			<div class="class_pic">
							<a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${list.class_registrynum}">
	           					<img src="${pageContext.request.contextPath}/thumbnailImage/${list.thumbnail}">
	           				</a>
						</div>
	           			<div class="class_name">
		           			<div>${list.class_name }</div>
		           			<div>${list.subject }</div>
		           			<input type="hidden" class="rating" value="${list.rating }">
		           			<div class = "starRev">
					        	<input class="staR" value="1">
					        	<input class="staR" value="2">
					        	<input class="staR" value="3">
					        	<input class="staR" value="4">
					        	<input class="staR" value="5">
     						</div>
           				</div>
           			</div>
           			<div class="reserveInfo5">${list.reservation_date}</div>
           			<div>${list.reviewdate }</div>
           			<div><button class="deleteReview">삭제</button></div>
           		</div>
           
            </c:forEach>
	            <div class="pageNum">
	            	<c:if test="${pageNum > 1}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/MemberReview.do?pageNum=${1}'"> << </div>
	            	</c:if>
	            	<c:if test="${pageNum > startPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/MemberReview.do?pageNum=${pageNum-1}'"> < </div>
	            	</c:if>
	            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/MemberReview.do?pageNum=${i}'">${i}</div>
	            	</c:forEach>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/MemberReview.do?pageNum=${pageNum+1}'"> > </div>
	            	</c:if>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/MemberReview.do?pageNum=${pageCount}'"> >> </div>
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
	
	for(var i = 0; i<"${fn:length(list)}"; i++){
		
		var current = $(".starRev").eq(i);
		var rating  = $(".rating").eq(i).val();
		
		if(rating == "0"){
			var rating1 = current.children(".staR").eq(rating)
		} else {
			var rating1 = current.children(".staR").eq(rating-1)
            rating1.parent().children("input").removeClass("on");
            rating1.addClass("on").prevAll("input").addClass("on");
		}
	}
	
	$(".deleteReview").on("click",function(){
		var class_registrynum = $(this).parents(".reserveInfo2").find(".class_registrynum").val();
		var reviewNum = $(this).parents(".reserveInfo2").find(".reviewNum").val();
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/DeleteReview.do",
			dateType:"text",
			data : {
				class_registrynum : class_registrynum,
				reviewNum : reviewNum	
			},
			success:function(data,status){
				if(data == 1 ){
					alert("리뷰가 삭제 되었습니다.");
					location.href="${pageContext.request.contextPath}/MemberReview.do";
				}
			},
			error:function(data,status){
				alert("에러가 발생했습니다.");
			}
		});
		
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/refundList.css">
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@700&family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body><jsp:include page="../header.jsp"/>
<c:if test="${empty sessionScope.userid}">
<script type="text/javascript">
	alert("잘못된접근방법입니다.");
    location.href="${pageContext.request.contextPath}/main.do";
</script>
</c:if>
<section>
<div class="pic"><div>MYPAGE</div></div>
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
           				</div>
           			</div>
           			<div class="class_username">${list.user_name }</div>
           			<div class="reserveInfo4">${list.reservation_personnel }</div>
           			<div class="reserveInfo5">${list.reservation_date}<br>${list.time }</div>
           			<div class="reserveInfo5">${list.refund_price }</div>
           			<div class="reserveInfo5">${list.request_day }</div>
           			<div class="reserveInfo5">${list.refund_date }</div>
           			<div class="state">
           				<input type="hidden" class="refundnum" value="${list.refundnum }">
           				<c:if test="${list.state eq 0 }" >
           					<div>대기</div>
           					<button class="refund_cancle">환불취소</button>
           				</c:if>
           				<c:if test="${list.state eq 1 }">
           					<div>환불완료</div>
           				</c:if>
           			</div>
           		</div>
           
            </c:forEach>
	            <div class="pageNum">
	            	<c:if test="${pageNum > 1}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/memberRefund.do?pageNum=${1}'"> << </div>
	            	</c:if>
	            	<c:if test="${pageNum > startPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/memberRefund.do?pageNum=${pageNum-1}'"> < </div>
	            	</c:if>
	            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/memberRefund.do?pageNum=${i}'">${i}</div>
	            	</c:forEach>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/memberRefund.do?pageNum=${pageNum+1}'"> > </div>
	            	</c:if>
	            	<c:if test="${pageNum < pageCount}">
	            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/memberRefund.do?pageNum=${pageCount}'"> >> </div>
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
	$(".refund_cancle").on("click",function(){
		var refundnum = $(this).parents(".state").find(".refundnum").val();
		console.log(refundnum);
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/RefundCancle.do",
			dataType:"text",
			data :{ refundnum : refundnum},
			success:function(data,status){
				if(data == 1){
					alert("환불 요청이 취소 되었습니다.");
					location.href="${pageContext.request.contextPath}/memberRefund.do";
				}
			},
			error:function(data,status){
				alert("에러가 발생했습니다.");
			}
		});
		
	});
    <!-- Channel Plugin Scripts -->
    (function() {
      var w = window;
      if (w.ChannelIO) {
        return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
      }
      var ch = function() {
        ch.c(arguments);
      };
      ch.q = [];
      ch.c = function(args) {
        ch.q.push(args);
      };
      w.ChannelIO = ch;
      function l() {
        if (w.ChannelIOInitialized) {
          return;
        }
        w.ChannelIOInitialized = true;
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
        s.charset = 'UTF-8';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
      }
      if (document.readyState === 'complete') {
        l();
      } else if (window.attachEvent) {
        window.attachEvent('onload', l);
      } else {
        window.addEventListener('DOMContentLoaded', l, false);
        window.addEventListener('load', l, false);
      }
    })();
    ChannelIO('boot', {
      "pluginKey": "23441f9e-c08a-4bd9-8ec4-21d31c9851cf"
    });
  <!-- End Channel Plugin -->
</script>
</body>
</html>
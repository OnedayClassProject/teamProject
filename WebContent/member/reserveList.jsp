<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/reserveList.css">
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@700&family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
<c:if test="${empty sessionScope.userid}">
<script type="text/javascript">
	alert("잘못된접근방법입니다.");
    location.href="${pageContext.request.contextPath}/main.do";
</script>
</c:if>
<div class="pic"><div>MYPAGE</div></div>
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
            <div>예약리스트</div>
                <hr>
           	<div>
				<div class="reserveInfo">
           			<div>클래스정보</div>
           			<div>예약자 명</div>
           			<div>예약인원</div>
           			<div>예약날짜</div>
           			<div>전화번호</div>
           			<div>위치</div>
           			<div>기타</div>
           		</div>
           		<div class="line"></div>
           		<c:if test="${count != 0 }">
           		<c:forEach var="list" items="${list }">
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
			           			<div class="price">${list.price }</div> <!-- 결제금액 -->
	           				</div>
	           			</div>
	           			<div class="class_companyInfo">${list.class_company }</div> <!-- 예약자명 -->
	           			<div class="reserveInfo4 ">${list.personnel }</div>
	           			<div class="reserveInfo5 time">${list.time }</div> <!-- 예약날짜/시간 -->
	           			<div class="reserveInfo5">${list.sale }</div><!-- 예약자 전화번호 -->
	           			<div class="reserveInfo5">${list.location }</div><!-- 위치 -->
	           			<%-- <div>${list.content }</div> --%> <!-- 요청사항 -->
	           			<div class="reserveInfo8">
	           			
	           				<input type="hidden" value="${list.class_registrynum }" class="class_registrynum"><!-- 클래스등록번호 -->
	           				<input type="hidden" value="${list.rating }" class="reservationnum"> <!-- 예약번호 -->
	           				<input type="hidden" value="${list.level }" class="reservation_date"><!-- 예약날짜 -->
	           				
	           				<c:if test="${list.reservation_count  eq 0}"> <!-- 환불체크 1이면 환불완료 -->
		           				<c:if test="${list.reviewCheck eq 0 }">
		           					<button class="reserveInfo6" >후기작성</button>
		           				</c:if>
		           				<c:if test="${list.reviewCheck ne 0 }">
		           					<div class="com">작성완료</div>
		           				</c:if>
		           					<button class="refund_request">환불신청</button>
	           				</c:if>
	           				<c:if test="${list.reservation_count eq 1 }">
	           					<div class="com">환불완료</div>
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
<script>
	$('.reserveInfo6').on("click", function(){
		
		 var date  = $(this).parents(".reserveInfo8").find(".reservation_date").val();
		 var classnum = $(this).parents(".reserveInfo8").find(".class_registrynum").val();
		 var reservenum = $(this).parents(".reserveInfo8").find(".reservationnum").val();
		console.log(date);
		 $.ajax({
			 type:"post",
			 url:"${pageContext.request.contextPath}/reviewCheck.do",
			 data:{date : date},
			 dataType:"text",
			 success:function(data, status){
				if(data == 1){
					alert("리뷰를 쓸 수 있습니다.");
					if(confirm('한번 작성하면 다시 작성하지 못합니다.(수정불가)') == true){
						location.href='${pageContext.request.contextPath}/boardWrite.do?class_registrynum='+classnum+'&reservenum='+reservenum+'&date='+date;
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
	
	$(".refund_request").on("click",function(){
		
		var p = $(this).parents(".reserveInfo2");
		console.log(p);
		var reservationnum = p.find(".reservationnum").val();
		
		var price = p.find(".price").text();
		
		var reservation_date = p.find(".reservation_date").val();
		
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/memberRefundAction.do",
			dateType:"text",
			data : {
				reservationnum : reservationnum,
				price : price,
				reservation_date : reservation_date
			},
			success:function(data,status){
				console.log(data);
				if(data == 1){
					alert("환불 신청 되었습니다.");
				}else if(data == 2){
					alert("이미 환불 진행중입니다.");
				}else if(data == 3){
					alert("환불 신청이 불가능합니다.");
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
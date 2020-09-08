<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/21
  Time: 11:34 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<style>
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltip-text {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
}

.tooltip:hover .tooltip-text {
  visibility: visible;
}
</style>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/mypage.css">
</head>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<body>

<jsp:include page="../header.jsp"/>

<section>
    <div class="my_wrap">
        <div class="side_menu">
        	<div class="current_menu">MY PAGE</div>	
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
                <div class="my_subject">MY PAGE</div>
                <div class="my_main2">
                    <div class="my_main3">
                        <div>포인트</div>
                        <div>${getMember.point }</div>
                    </div>
                    <div class="my_main3">
                        <div>등급</div>
                        <div>${getMember.membership }</div>
                    </div>
                    <div class="my_main3">
                        <div>예약</div>
                        <div>0</div>
                    </div>
                    <div class="my_main3">
                        <div>환불</div>
                        <div>0</div>
                    </div>
                </div>
                <div class="reserve_list2">
                	<div align="center">
                		<div class="pay_btn">
                			<c:choose>
                				<c:when test="${getMember.membership eq 'VIP'}">
                					<div class="pay_btn">
                					<c:set var="now" value="<%=new java.util.Date()%>" />
                					<c:set var="nowTime"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
                					<fmt:parseDate var="strPlanDate" value="${nowTime }" pattern="yyyy-MM-dd"/>
                					<fmt:parseNumber var="strDate" value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" ></fmt:parseNumber>
                					<fmt:parseDate  var="endPlanDate" value="${getMember.vip_finish }" pattern="yyyy-MM-dd"/>
									<fmt:parseNumber var="endDate" value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" ></fmt:parseNumber>
                					<c:set var ="date"  value = "${getMember.vip_finish }"/>
			                			다음 결제일 : ${fn:substring(date,0,4) }년&nbsp;${fn:substring(date,5,7) }월&nbsp;${fn:substring(date,8,10) }일 (${endDate - strDate }일 남음)
	                				</div>
                				</c:when>
			                	<c:otherwise>
		                			<button class="pay_btn2">VIP 가입하기</button><br>
		                			<div class ="tooltip"> VIP란?
		                				<span class="tooltip-text">vip에대한 설명</span>
		                			</div>
	                			</c:otherwise>
                			</c:choose>
                		</div>
                	</div>	
                </div>
              	<hr>
                <div class="reserve_list">
                    MY 예약리스트 
                </div>
                <div class="reserve_list2">
                	<c:forEach var="classBean" items="${myList}">
                		<div class="best-class">
                        	<div class="thumbnail">
                        		<a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${classBean.class_registrynum}" >
                 				<img src="${pageContext.request.contextPath}/thumbnailImage/${classBean.thumbnail}" width="175px" height="165px"></a>
                        	</div>
                        	<div class="class-name">
                           		<div class="class-name1">${classBean.category}</div>
                    			<div class="class-name3">${classBean.class_name}</div>
                            	<div class="class-name4">${classBean.class_company}</div>
                        	</div>
                    	</div>
                	</c:forEach>
                    <div class="move_reserveList">
                    <div>더보기</div>
                    </div>
                </div>
                <hr>
                <div class="reserve_list">
                    MY 환불리스트
                </div>
                <div class="reserve_list2">
                   <c:forEach var="classBean" items="${refundList}">
                		<div class="best-class">
                        	<div class="thumbnail">
                        		<a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${classBean.class_registrynum}" >
                 				<img src="${pageContext.request.contextPath}/thumbnailImage/${classBean.thumbnail}"></a>
                        	</div>
                        	<div class="class-name">
                           		<div class="class-name1">${classBean.category}</div>
                    			<div class="class-name3">${classBean.class_name}</div>
                            	<div class="class-name4">${classBean.class_company}</div>
                        	</div>
                    	</div>
                	</c:forEach>
                    <div class="move_reserveList">
                        <div>더보기</div>
                    </div>
                </div>
                <hr>
                <div class="reserve_list">
                    MY 좋아요 리스트
                </div>
                <div class="reserve_list2">
                    <c:forEach var="classBean" items="${favorList}">
                		<div class="best-class">
                        	<div class="thumbnail">
                        		<a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${classBean.class_registrynum}" >
                 				<img src="${pageContext.request.contextPath}/thumbnailImage/${classBean.thumbnail}"></a>
                        	</div>
                        	<div class="class-name">
                           		<div class="class-name1">${classBean.category}</div>
                    			<div class="class-name3">${classBean.class_name}</div>
                            	<div class="class-name4">${classBean.class_company}</div>
                        	</div>
                    	</div>
                	</c:forEach>
                    <div class="move_reserveList">
                        <div>더보기</div>
                    </div>
                </div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
<script>
$(function () {
	
		/* $('[data-toggle="tooltip"]').tooltip(); */


	$(".pay_btn2").on("click", function() {
		// Set a same-site cookie for first-party contexts
		document.cookie = 'cookie1=value1; SameSite=Lax';
		// Set a cross-site cookie for third-party contexts
		document.cookie = 'Sec-Fetch-Site=value2; SameSite=None; Secure';
		
	var IMP = window.IMP; // 생략가능
	IMP.init('imp12575424');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
	pg: 'inicis', // version 1.1.0부터 지원.
	/*
	'kakao':카카오페이,
	html5_inicis':이니시스(웹표준결제)
	'nice':나이스페이
	'jtnet':제이티넷
	'uplus':LG유플러스
	'danal':다날
	'payco':페이코
	'syrup':시럽페이
	'paypal':페이팔
	*/
	pay_method: 'card',
	/*
	'samsung':삼성페이,
	'card':신용카드,
	'trans':실시간계좌이체,
	'vbank':가상계좌,
	'phone':휴대폰소액결제
	*/
	merchant_uid: 'merchant_' + new Date().getTime(),
	/*
	merchant_uid에 경우
	https://docs.iamport.kr/implementation/payment
	위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
	참고하세요.
	나중에 포스팅 해볼게요.
	*/
	name: '주문명:결제테스트',
	//결제창에서 보여질 이름
	amount: 1000,
	//가격
	buyer_email: 'iamport@siot.do',
	buyer_name: '구매자이름',
	buyer_tel: '010-1234-5678',
	buyer_addr: '서울특별시 강남구 삼성동',
	buyer_postcode: '123-456',
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
	console.log(rsp);
	if (rsp.success) {
	var msg = '결제가 완료되었습니다.';
	msg += '고유ID : ' + rsp.imp_uid;
	msg += '상점 거래ID : ' + rsp.merchant_uid;
	msg += '결제 금액 : ' + rsp.paid_amount;
	msg += '카드 승인번호 : ' + rsp.apply_num;
	$.ajax('${pageContext.request.contextPath}/VIPRegister.do',{
		type:"post",
		success:function(data){
			if(data == 1){
				location.href="${pageContext.request.contextPath}/mypage.do";
			}else{
				alert("문제가 발생했습니다.");
				location.href="${pageContext.request.contextPath}/main.do";
			}
		}, error:function(data){
			alert("에러가 발생했습니다.");
		}
	});
	
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);	
	});

	});
});
	
</script>
</html>

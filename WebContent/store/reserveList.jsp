<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeRefund.do'> 
                <div>환불확인️</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>정보보기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage2.do'><div>수정하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage3.do'><div>탈퇴하기</div>
                <div class="side_detail2">></div>
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
           		<div class="reserveInfo2">
           			<div class="reserveInfo3">
	           			<div class="class_pic">사진</div>
	           			<div class="class_name">
		           			<div>카테고리</div>
		           			<div>클래스명</div>
		           			<div>가격</div>
           				</div>
           			</div>
           			<div class="reserveInfo4">인원수</div>
           			<div class="reserveInfo5">2020-09-14</div>
           			<div class="reserveInfo4">환불</div>
           		</div>
           	</div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
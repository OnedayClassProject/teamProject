<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/pay/payCom.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
		<div class="classview_wrap">
				<div>예약완료하였습니다.</div>
				<div>클래스사진</div>
				<div>클래스명</div>
				<div>예약날짜</div>
				<button onclick="location.href='${pageContext.request.contextPath}/main.do'">메인페이지이동</button>
		</div>
</section>
</body>
</html>
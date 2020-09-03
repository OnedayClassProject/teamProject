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
				<div>클래스사진 ${cbean.thumbnail }</div>
				<div>클래스명 ${cbean.class_name }</div>
				<div>결제 금액${reservation_price }</div>
				<div>예약날짜${reservation_date }</div>
				<div>예약자명${user_name }</div>
				<div>예약자 수${reservation_personnel }</div>
				<button onclick="location.href='${pageContext.request.contextPath}/main.do'">메인페이지이동</button>
		</div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
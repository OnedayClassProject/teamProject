<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test="${empty sessionScope.userid and empty reservation_personnel}">
<script type="text/javascript">
	alert("잘못된접근방법입니다.");
    location.href="${pageContext.request.contextPath}/main.do";
</script>
</c:if>
<section>
		<div class="classview_wrap">
				<div class="pay_sub">
					<div>예약완료</div>
				</div>
				<div class="pay_info">
					<div><img src="${pageContext.request.contextPath}/thumbnailImage/${cbean.thumbnail }"></div>
					<div>
						<div>클래스명&nbsp;&nbsp;&nbsp;&nbsp;${cbean.class_name }</div>
						<div>결제금액&nbsp;&nbsp;&nbsp;&nbsp;${reservation_price }</div>
						<div>예약날짜&nbsp;&nbsp;&nbsp;&nbsp;${reservation_date }</div>
						<div>예약자명&nbsp;&nbsp;&nbsp;&nbsp;${user_name }</div>
						<div>예약자수&nbsp;&nbsp;&nbsp;&nbsp;${reservation_personnel }</div>
					</div>
				</div>
				<div class="pay_btn">
					<button onclick="location.href='${pageContext.request.contextPath}/main.do'">메인페이지</button>
				</div>
		</div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
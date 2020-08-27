<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/pay/paypage.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
		<div class="classview_wrap">
			<div class="class_wrap2">
				<div class="class_wrap3">
					<div>예약 결제하기</div>
					<div>
					<div>예약고객</div>
					<div>이름(전화번호)</div>
					</div>
					<div>
						<div>예약정보</div>
						<div>예약자</div>
						<input type="text"> 
						<div>연락처</div>
						<input type="text">
						<div>요청사항</div>
						<textarea rows="10" cols="10"></textarea>
					</div>
					<div>
					<div>클래스정보</div>
					<div>클래스명 향수클래스~~</div>
					<div>클래스명</div>
					<div>날짜&예약시간&인원수</div>
					</div>
					<div>아이디어스 할인 혜택</div>
					<div>아이디어스 적립금</div>
					<input type="text" value="0">
					<input type="buttn" value="전부사용">
					<div>보유중인 적립금</div>
					<div>0 P</div>
					<div>결제수단</div>
					<input type="checkbox" value="kakaopay"><img src="${pageContext.request.contextPath}/images/payment_icon_yellow_medium.png">	
				</div>
				<div class="reserve_bar">
					<div class="category_tag">카테고리</div>
					<div class="className_tag">클래스명</div>
					<div class="storeName_tag">업체명</div>
					<div class="price_tag">
						<div>할인율</div>
						<div>할인가격</div>
						<div>본가격</div>
					</div>
					<div class="class_info">
						<div class="class_info2">
							<div>난이도</div>
							<div>하</div>
						</div>
						<div>
							<div>소요시간</div>
							<div>2시간</div>
						</div>
						<div>
							<div>수업인원</div>
							<div>최대8명</div>
						</div>
					</div>
					<div class="pay_btn">
					<button class="pay_btn2">결제하기</button>
					</div>
				</div>
			</div>
</section>
<script>
$(function () {
	
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
	} else {
	var msg = '결제에 실패하였습니다.';
	msg += '에러내용 : ' + rsp.error_msg;
	}
	alert(msg);	
	});

	});
});
	
	</script>
</body>
</html>
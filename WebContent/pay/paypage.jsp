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
					<div>${mbean.username}(${mbean.phone })</div>
					</div>
					<div>
						<div>예약정보</div>
						<div>예약자</div>
						<input type="text" value="${mbean.username }"> 
						<div>연락처</div>
						<input type="text" value="${mbean.phone }">
						<div>요청사항</div>
						<textarea rows="10" cols="10"></textarea>
					</div>
					<div>
						<div>클래스정보</div>
						<div>클래스카테고리 ${cbean.category }</div>
						<div>클래스명 ${cbean.class_name }</div>
						<div>날짜&예약시간&인원수</div>
						<div>${reserve_date}/${time }/${person_num }</div>
					</div>
					<div>아이디어스 할인 혜택</div>
					<div>아이디어스 적립금</div>
					<input type="text" value="0" class="point">
					<input type="button" class="all_point2"value="사용">
					<div>보유중인 적립금</div>
					<div class='all_point'>3000</div>
					<div>결제수단</div>
					<input type="radio" name="pay_met" value="card">신용카드	
					<input type="radio" name="pay_met" value="samsung">삼성페이	
					<input type="radio" name="pay_met" value="trans">실시간계좌이체	
					<input type="radio" name="pay_met" value="vbank">가상계좌	
					<input type="radio" name="pay_met" value="phone">휴대폰소액결제	
				</div>
				<div class="reserve_bar">
					<div class="category_tag">카테고리 ${cbean.category }</div>
					<div class="className_tag">클래스명 ${cbean.class_name }</div>
					<div class="storeName_tag">업체명 ${cbean.class_company }</div>
					<div class="price_tag">
						<div>할인율</div>
						<div>할인가격</div>
						<div>${sum_price }</div>
						<input type="hidden" class='sum_price2'>
						<div class="sum_price"></div>
					</div>
					<div class="pay_btn">
					<button class="pay_btn2">결제하기</button>
					</div>
				</div>
			</div>
</section>
<script>
$(function () {
	
	if( '${mbean.membership}' == 'basic'){
		$(".sum_price2").val('${sum_price}');
		$(".sum_price").text('${sum_price}');
	}else if('${mbean.membership}' == 'vip'){
		if(new Date('${mbean.vip_finish }'+" 23:59:59") > new Date()) {
			var dis_price = ${sum_price } * 0.8;
			$(".sum_price2").val(dis_price);
			$(".sum_price").text(dis_price);
			
		}
	}
	
	
	$('.all_point2').on('click', function () {
			var point = Number($('.point').val());
			var all = Number($('.all_point').text());
			console.log(all);
			var sum = Number($('.sum_price2').val());
			if(point <= all ){
				var sub = sum-point;
				console.log(sub);
				$('.sum_price').text(sub);
			} else{
				alert('포인트를 초과하였습니다.')
				$('.point').val(0);
				$('.sum_price').text('${sum_price}');
			}
			
	});

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
	pay_method: 'trans',
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
		$.ajax({
			type:'post',
			url:'${pageContext.request.contextPath}/payAction.do',
			dataType:{클래스명,예약카테고리,예약인원,예약날짜,예약가격,예약결제수단, 적립포인트,등록번호}
		})
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
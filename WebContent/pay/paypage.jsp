<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<c:if test="${empty sessionScope.userid and empty reservation_personnel}">
<script type="text/javascript">
	alert("잘못된접근방법입니다.");
    location.href="${pageContext.request.contextPath}/main.do";
</script>
</c:if>
<section>
		<div class="classview_wrap">
			<div class="class_wrap2">
				<div class="class_wrap3">
					<div class="rePay">예약 결제하기</div>
					<div class="rePeople">
						<div class="reserveCus">예약고객</div>
						<div class="reserveCus2">${mbean.username}(${mbean.phone })</div>
					</div>
					<div class="reserve_info">
						<div class="reserveCus">예약정보</div>
						<div class="reserve_info2">예약자</div>	
						<input type="text" id="user_name" value="${mbean.username }"> 
						<div class="reserve_info2">연락처</div>
						<input type="text" class="phone" value="${mbean.phone }">
						<div class="reserve_info2">요청사항</div>
						<textarea rows="8" cols="50" id="content" style="resize: none;"></textarea>
					</div>
					<div class="classInfo">
						<div class="reserveCus">클래스정보</div>
						<div>${cbean.category }</div>
						<div>${cbean.class_name }</div>
						<div class="reserve_info2">날짜</div>
						<div >${reserve_date}</div>
						<div class="reserve_info2">시간</div>
						<div>${time }</div>
						<div class="reserve_info2">인원수</div>
						<div>${person_num }명</div>
					</div>
					<div class="class_point">
						<div class="reserveCus">클래스플러스 적립금</div>
						<input type="text" value="0" class="point">
						<input type="button" class="all_point2"value="사용">
						<div>보유중인 적립금</div>
						<div class='all_point'>${mbean.point }</div>
					</div>
					<div class="class_pay">
						<div class="reserveCus">결제수단</div>
						<div class="class_pay2"><input type="radio" name="pay_met" class="pay_met" value="card" checked>신용카드</div>	
						<div class="class_pay2"><input type="radio" name="pay_met" class="pay_met" value="samsung">삼성페이</div>	
						<div class="class_pay2"><input type="radio" name="pay_met" class="pay_met" value="trans">실시간계좌이체</div>	
						<div class="class_pay2"><input type="radio" name="pay_met" class="pay_met" value="vbank">가상계좌</div>
						<div class="class_pay2"><input type="radio" name="pay_met" class="pay_met" value="phone">휴대폰소액결제</div>	
					</div>
				</div>
				<div class="reserve_bar">
					<div class="category_tag">카테고리 ${cbean.category }</div>
					<div class="className_tag">클래스명 ${cbean.class_name }</div>
					<div class="storeName_tag">업체명 ${cbean.class_company }</div>
					<div class="price_tag">
					
						<c:if test="${mbean.membership eq 'VIP' }">
						<c:out value="${mbean.membership}"/>할인
							<div>가격</div>
							<div class="origin_price">${sum_price }</div>
							<input type="hidden" class='sum_price2'>
							<div class="sum_price"></div>
						</c:if>
						<c:if test="${mbean.membership eq 'basic' }">
							<div>가격</div>
							<div class="sum_price"></div>
							<input type="hidden" class='sum_price2'>
						</c:if>
					</div>
					<div class="pay_btn">
					<button class="pay_btn2">결제하기</button>
				</div>
				</div>
			</div>
		</div>
</section>
<jsp:include page="../footer.jsp" />
<script>
$(function () {
	
	if( '${mbean.membership}' == 'basic'){
		$(".sum_price2").val('${sum_price}');
		$(".sum_price").text('${sum_price}');
	}else if('${mbean.membership}' == 'VIP'){
		/* if(new Date('${mbean.vip_finish }'+" 23:59:59") > new Date())  */
			var dis_price = Number(${param.sum_price}) * 0.8;
			console.log(dis_price);
			$(".sum_price2").val(dis_price);
			$(".sum_price").text(dis_price);
		/* else{
			$(".origin_price").css("text-decoration","none");
		} */
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
		var pay_met = document.getElementsByName("pay_met");
		for(var i=0;i<pay_met.length;i++){
			if(pay_met[i].checked == true){
				var pay_check = pay_met[i].value;
			}
		}
		console.log(pay_check);
		var class_name = '${cbean.class_name}'; // 클래스이름
		var reservation_category = '${cbean.category}'; //클래스 카테고리
		var reservation_personnel = '${person_num}'; // 예약 인원
		var reservation_date = '${reserve_date}'; // 수업 날짜
		var reservation_price = $(".sum_price").text(); // 결제 금액
		var reservation_pay = pay_check; // 결제 수단
		var reservation_tel = $(".phone").val(); // 예약자 연락처
		var reservation_location =' ${cbean.location}'; // 클래스 위치
		var point = reservation_price* 0.02; // 적립될 포인트
		var class_registrynum = ${cbean.class_registrynum}; // 클래스번호
		var user_name = $("#user_name").val(); // 수강자명
		var content = $("#content").val(); // 요청사항
		var time = "${time }" //수업시간
		
		
		//var class_registrynum = ${cbean.class_registrynum}; // 클래스번호
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
	
	
	
	pay_method: pay_check ,
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
	amount:/* $(".sum_price").text() */ 1000,
	//가격
	buyer_email: '${mbean.useremail}',
	buyer_name: '${mbean.username}',
	buyer_tel: '${mbean.phone}',
	buyer_addr: '${mbean.address}',
	buyer_postcode: '${mbean.postcode}',
	/*
	모바일 결제시
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
			dataType: "text",
			data : {
				class_name : class_name,
				reservation_category : reservation_category,
				reservation_personnel : reservation_personnel,
				reservation_date : reservation_date,
				reservation_price : reservation_price,
				reservation_pay : reservation_pay,
				reservation_tel : reservation_tel,
				reservation_location : reservation_location,
				point : point,
				class_registrynum : class_registrynum,
				content : content,
				time : time,
				user_name : user_name
			},
			success : function(data,status){
				if(data == 1){
					location.href = "${pageContext.request.contextPath}/payFinish.do?class_registrynum="+class_registrynum+"&reservation_personnel="+reservation_personnel+"&reservation_price="+reservation_price+"&user_name="+user_name+"&reservation_date="+reservation_date+"&content="+content;
				}
			},
			error : function(data,status){
				alert("에러가 발생했습니다.");
			}
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
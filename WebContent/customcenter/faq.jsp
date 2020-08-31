<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 10:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/customcenter/faq.css">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">FAQ</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/helpMainPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu2"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<div>자주 묻는 질문</div>
        	<div class="qna_wrap">
	        			<div class="qna_menu1">적립금이 확인되지 않아요!!</div>
	        			<div class="qna_menu1-1">
	        			<br>
	        			1. 적립금은 어떻게 적립되나요?<br><br>
							
							&nbsp;&nbsp;회원등급별 적립금<br>
							&nbsp;&nbsp;- 아기손 0.5%<br>
							&nbsp;&nbsp;- 곰손 1.0%<br>
							&nbsp;&nbsp;- 은손 1.5%<br>
							&nbsp;&nbsp;- 금손 2.0%<br><br>
							
							&nbsp;&nbsp;결제수단별 적립금<br>
							&nbsp;&nbsp;- 현재는 간편하게 카드 결제만 0.5% 적립됩니다.<br>
							&nbsp;&nbsp;- 복잡하게 카드 결제, 네이버페이, 계좌이체, 휴대폰 결제는 적립되지 않으니 결제수단을 꼭~! 확인해주세요.<br>
							
							&nbsp;&nbsp;VIP클럽은 무조건 1.0% 추가!<br><br><br>
							
							
							
							2. 적립금이 적립되지 않았어요!<br>
							
							&nbsp;&nbsp;적립금은 주문 일자가 아닌 주문하신 작품의 운송장 번호가 입력된 시점으로부터 정확히 7일이 후에 적립됩니다.<br>
							<br><br>
	        				
	        				3. 적립금이 사라졌어요!<br>
							&nbsp;&nbsp;결제 실패 또는 취소로 인해 적립금이 사라졌다면, 쿠폰과 마찬가지로 유효기간 내 적립금은10분 이내로 자동 복구됩니다.
	        				<br>
	        			
	        			</div>
	        			<hr>
	        			<div class="qna_menu2">입금하려는데 없는 계좌번호라고 나와요!</div>
	        			<div  class="qna_menu1-2">
	        			<br>
	        			1. ATM기에서는 무통장 방식으로 입금이 되지 않습니다. 인터넷/폰 뱅킹을 이용하거나 은행에 방문시는 창구를 통해 입금해 주세요.
						<br><br>
						2. 은행 전산망 점검시간에는 입금이 되지 않을 수 있습니다. (보통 저녁 11시 30분 ~ 다음날 새벽 1시경)
						<br><br>
						3. 토스 앱 이용시, 문자를 자동으로 복사해서 붙여넣을 경우 인식이 잘 되지 않는 경우가 있습니다. 복사해서 붙여넣기가 아닌 수동으로 금액, 계좌번호를 입력하면 입금이 가능합니다. 그러나 최근 토스 앱이 불안정한 경우가 있기 때문에 가급적 은행 앱 이용을 권합니다.
						<br><br>
						4. 페이코 앱을 통한 계좌이체시 입금이 불가능합니다. 인터넷/폰 뱅킹을 이용해 주세요.
	        			</div>
	        			<hr>
	        			<div class="qna_menu3">취소 / 환불은 어떻게 하나요?</div>
	        			<div  class="qna_menu1-3">
	        			<br>
	        			1. 내정보 -> 예약리스트 -> 환불버튼 클릭하시면 환불처리가 됩니다.
	        			
	        			<br><br>
	        				※ 결제수단에 따라 결제취소/환불 되는 시점이 조금씩 다릅니다.
						<br><br>
							1. 신용카드
							결제취소 문자가 발송되기까지 시간이 조금 소요됩니다.
							이용하시는 카드사에 따라 3영업일 ~ 7영업일 정도 기다려주세요.
						<br><br>	 
							2. 계좌이체
							3일 이내(주말/공휴일 제외)에 환불 금액이 입금 완료됩니다.
						<br><br> 
							3. 휴대폰결제
							매일 23시에 자동으로 취소됩니다. 결제달과 취소달이 다른 경우에는 휴대폰결제 시스템 상 취소되지 않고, 등록해주신 계좌로 입금처리 됩니다.(매달 9일,14일, 말일)
	        			</div>
	        			<hr>
	        			<div class="qna_menu4">무통장 입금 주문시 참고해주세요!</div>
	        			<div  class="qna_menu1-4">
	        			<br>
	        			※ 1. 입금 마감기한이 지나면 계좌번호가 없어집니다.
						<br><br>			
						※ 2. 주문 금액과 1원이라도 차이가 나면 입금이 되지 않습니다.
						<br><br>
						※ 3. 주문자와 입금자가 틀려도 계좌번호와 금액만 정확하면 입금완료처리가 자동으로 됩니다.
						<br><br>
						※ 4. 일부 입금방식에 따라 예금주명이 '주식회사 백패커'가 아닌 ‘세틀뱅크’ 또는 '나이스정보통신'으로 조회될 수 있습니다. 이러한 경우에도 입금 처리 시 정상적으로 주문 완료됩니다.
						<br><br>
						※ 5. ATM 기기에서는 무통장 방식으로 입금이 되지 않습니다. 인터넷/폰 뱅킹을 이용하거나 은행에 방문시는 창구를 통해 입금해 주세요.
						<br><br>
						❑ 입금 마감기한
						※ 주문한 다음날 저녁 10시 까지
						어제 주문시 오늘 저녁 10시까지
						오늘 주문시 내일 저녁 10시까지
						<br><br>
						❑ 계좌번호 확인 방법
						사이드메뉴 → 주문 배송에서 입금할 은행과 계좌번호, 금액을 확인할 수 있습니다.
	        			</div>
	        			<hr>
	        			<div class="qna_menu5">구매후기는 어떻게 남기나요?</div>
	        			<div  class="qna_menu1-5">
	        			<br>
						1. 작품을 구입한 분만 구매후기를 남길 수 있습니다. 구매후기 작성 후, 환불을 할 경우 구매후기는 삭제됩니다.<br><br>
						2. 작가님이 배송완료를 한 시점부터 구매후기 작성 버튼이 표시 됩니다.<br><br>
						3. 남겨진 구매후기는 1번만 수정할 수 있습니다.<br><br>
						4. 삭제한 구매후기는 다시 작성할 수 없습니다.<br><br>
						5. 개인결제창을 통해 결제하실 경우 후기 작성이 불가능합니다.<br><br>
	        			
	        			
	        			</div>
	        			<hr>
        	</div>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp"/>
<script>
	$(".qna_menu1").on("click", function () {
		
		if($('.qna_menu1-1').css("display") == 'none'){
			$('.qna_menu1-1').css("display",'block');
			$('.qna_menu1-1').animate({height : "450px"},500);
		} else{
			$('.qna_menu1-1').animate({height : "0px"},500, function () {
				$('.qna_menu1-1').css("display",'none');
			})
		}
	})
	$(".qna_menu2").on("click", function () {
		
		if($('.qna_menu1-2').css("display") == 'none'){
			$('.qna_menu1-2').css("display",'block');
			$('.qna_menu1-2').animate({height : "300px"},500);
		} else{
			$('.qna_menu1-2').animate({height : "0px"},500, function () {
				$('.qna_menu1-2').css("display",'none');
			})
		}
	})
	$(".qna_menu3").on("click", function () {
		
		if($('.qna_menu1-3').css("display") == 'none'){
			$('.qna_menu1-3').css("display",'block');
			$('.qna_menu1-3').animate({height : "250px"},500);
		} else{
			$('.qna_menu1-3').animate({height : "0px"},500, function () {
				$('.qna_menu1-3').css("display",'none');
			})
		}
	})
	$(".qna_menu4").on("click", function () {
		
		if($('.qna_menu1-4').css("display") == 'none'){
			$('.qna_menu1-4').css("display",'block');
			$('.qna_menu1-4').animate({height : "330px"},500);
		} else{
			$('.qna_menu1-4').animate({height : "0px"},500, function () {
				$('.qna_menu1-4').css("display",'none');
			})
		}
	})
		$(".qna_menu5").on("click", function () {
		
		if($('.qna_menu1-5').css("display") == 'none'){
			$('.qna_menu1-5').css("display",'block');
			$('.qna_menu1-5').animate({height : "260px"},500);
		} else{
			$('.qna_menu1-5').animate({height : "0px"},500, function () {
				$('.qna_menu1-5').css("display",'none');
			})
		}
	})

</script>
</body>
</html>

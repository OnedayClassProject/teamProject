<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/classList/classView.css">
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script type="text/javascript">
	$(function () {
		 $("#calander_backcolor").on("click", function () {
             $("#box").css("display", "none");
             $("#calander_backcolor").css("display", "none");
         });
         $('.reserve_btn2').on("click", function () {
             /* $("#box").css("display","block"); */
             /* $("#calander_backcolor").css("display","block"); */
             $('.cal').animate({right : "0"},500);
             x();
         });
         $("#timeChoice").on("click" ,function (){
			$("#timeChoice2").animate({height : "392px"}, 500);
		});
         $(".back_button").on("click", function () {
        	 $('.cal').animate({right : "-100%"},500);
		});
        /*  $(".time_detail").on("click", function () {
			$(this).css("background-color", "gray");
			$(this).addClass('person_count');
			$(".time_detail").not($(this)).css("background-color", "white");
			$(".time_detail").not($(this)).removeClass('person_count');
			var $person = $(".person_count").children('.time_detail2');
		 	$('.parson2').text("0/${cb.personnel}");
			$person.children('.person').text(1+"/${cb.personnel}");
			$('.person_num').val("1");
			var today = $('#dateInput').text();
			console.log(today);
			var per =  Number($('.person_num').val())
			$('.reserve_date').text(today + " "+ per + "명");
			var  price = $person.children('.per_price').text();
			$('.sum_price').text(price);
		}) */
         $(".person_plus").on("click", function () {
				var $person = $(".person_count").children('.time_detail2');
				var num1 =	$person.children('.person').text();
				var num3 = Number($('.person_num').val());
				if(num3 < '${cb.personnel}'){
				var num4 = num3+1;
				console.log(num4)
				$person.children('.person').text(num4+"/${cb.personnel}");
				var today = $('#dateInput').text();
				console.log(today);
				var price = Number($person.children('.per_price').text());
				$('.reserve_date').text(today + " "+ num4 + "명");
				var sum = price * num4;
				$('.sum_price').text(sum);
				$('.person_num').val(num4);
				}
		});
         $(".person_sub").on("click", function () {
				var $person = $(".person_count").children('.time_detail2');
				var num1 =	$person.children('.person').text();
				var num3 = Number($('.person_num').val());
				if(num3 > 1){
				var num4 = num3-1;
				console.log(num4)
				$person.children('.person').text(num4+"/${cb.personnel}");
				var today = $('#dateInput').text();
				console.log(today);
				var price = Number($person.children('.per_price').text());
				$('.reserve_date').text(today + " "+ num4 + "명");
				var sum = price * num4;
				$('.sum_price').text(sum);
				$('.person_num').val(num4);
				}
		});
	});

</script>
</head>
<body>
<!-- <div id="calander_backcolor"></div> -->
<jsp:include page="../header.jsp"/>
<section>

	<div class="classview_wrap">
			<div class="class_wrap2">
				<div class="class_wrap3">
				<div class="main_pic"><img src="${pageContext.request.contextPath}/thumbnailImage/${cb.thumbnail}"></div>			
				<div>소개</div>
				<input type="hidden" id="class_registrynum" value="${cb.class_registrynum }">
				<div class="contents">${cb.content }</div>
				<div id="map" style="width:500px;height:400px;"></div>
				<hr>
				<div>취소 및 환불 정책</div>
				<table class="cancle_policy">
					<tr>
						<td>클래스 5일 전 취소시</td>
						<td>100%환불</td>
					</tr>
					<tr>
						<td>클래스 4일 전 취소시</td>
						<td>클래스 금액의 5% 차감 후 환불</td>
					</tr>
					<tr>
						<td>클래스 3일 전 취소시</td>
						<td>클래스 금액의 10% 차감 후 환불</td>
					</tr>
					<tr>
						<td>클래스 2일 전 취소시</td>
						<td>클래스 금액의 20% 차감 후 환불</td>
					</tr>
					<tr>
						<td>클래스 1일 전 취소시</td>
						<td>클래스 금액의 30% 차감 후 환불</td>
					</tr>
					<tr>
						<td>클래스 당일 취소나 불참시</td>
						<td>환불 불가</td>
					</tr>
					<tr>
						<td>예약 당일 밤 12시 이전 취소시</td>
						<td>100%환불</td>
					</tr>
				</table>
				<hr>
				<div>회원이름</div>
				<div>평점</div>
				<div>작성일</div>
				<div>제목</div>
				</div>
				<div class="reserve_bar">
					<div class="category_tag">${cb.category }</div>
					<div class="className_tag">${cb.class_name }</div>
					<div class="storeName_tag">${cb.class_company }</div>
					<c:if test="${cb.sale eq '안함'}">
					<div class="price_tag">
						<div>${cb.price }</div>
					</div>
					</c:if>
					<c:if test="${cb.sale ne '안함'}">
					<div class="price_tag">
						<div>할인율</div>
						<div>할인된가격</div>
						<div>${cb.price }</div>
					</div>
					</c:if>
					<div class="class_info">
						<div class="class_info2">
							<div>난이도</div>
							<div>${cb.level }</div>
						</div>
						<div>
							<div>소요시간</div>
							<div>${cb.time }</div>
						</div>
						<div>
							<div>수업인원</div>
							<div>최대${cb.personnel }명</div>
						</div>
					</div>
					<div class="reserve_btn">
					<button class="reserve_btn2" type="button">예약하기</button>
					</div>
				</div>
			</div>
			<div class="cal">
			<div id="box">
	    <div id="box2">
        <div class="content-right">
            <table id="calendar">
                <thead>
                <tr class="btn-wrap clearfix">
                    <td>
                        <label id="prev">
                            &#60;
                        </label>
                    </td>
                    <td align="center" id="current-year-month" colspan="5"></td>
                    <td>
                        <label id="next">
                            &#62;
                        </label>
                    </td>
                </tr>
                <tr>
                        <td class="sun" align="center">Sun</td>
                        <td class="sun" align="center">Mon</td>
                        <td class="sun" align="center">Tue</td>
                        <td class="sun" align="center">Wed</td>
                        <td class="sun" align="center">Thu</td>
                        <td class="sun" align="center">Fri</td>
                        <td class="sun" align="center">Sat</td>
                </tr>
                </thead>
                <tbody id="calendar-body" class="calendar-body"></tbody>
            </table>
             <div id="dateInput">2020-08-27</div>
             <div id="timebox">
             <div id="timeChoice">시간선택</div>
             <div >
             <div id="push_text">  << 눌러주세요</div>
             </div>
             <div id="timeChoice2">
             	<div class="time_wrap">
             		<%-- <div class="time_detail">
             			<div class="time_detail1">11:00~12:00</div>
             			<div class="time_detail2">
             				<div class="per_price">30000</div>
             				<div class="person parson2">0/${cb.personnel}</div>
             			</div>
             		</div>
             		<div class="time_detail">
             			<div class="time_detail1">11:00~12:00</div>
             			<div class="time_detail2">
             				<div class="per_price">30000</div>
             				<div class="person parson2">0/${cb.personnel}</div>
             			</div>
             		</div>
             		<div class="time_detail">
             			<div class="time_detail1">11:00~12:00</div>
             			<div class="time_detail2">
             				<div class="per_price">30000</div>
             				<div class="person parson2">0/${cb.personnel}</div>
             			</div>
             		</div>
             		<div class="time_detail">
             			<div class="time_detail1">11:00~12:00</div>
             			<div class="time_detail2">
             				<div class="per_price">30000</div>
             				<div class="person parson2">0/${cb.personnel}</div>
             			</div>
             		</div>
             		<div class="time_detail">
             			<div class="time_detail1">11:00~12:00</div>
             			<div class="time_detail2">
             				<div class="per_price">30000</div>
             				<div class="person parson2">0/${cb.personnel}</div>
             			</div>
             		</div>
             		<div class="time_detail">
             			<div class="time_detail1">11:00~12:00</div>
             			<div class="time_detail2">
             				<div class="per_price">30000</div>
             				<div class="person parson2">0/3</div>
             			</div>
             		</div> --%>
             	</div>
             	<div>
             	<div>인원수</div>
             	<input type="button" value="+" class="person_plus">
             	<input type="text" value="1" name="person_num" class="person_num" readonly="readonly">
             	<input type="button" value="-" class="person_sub">
             	<div class="reserve_date">2020-08-27 인원 3명</div>
             	<div class="sum_price"></div>
             	<div class="pay_button" onclick="pay()"> 결제하기</div>
				<div class="back_button">이전</div>           
             	</div>
             </div>
             </div>
        </div>
     <!--    <div class="time_wrap">
        <div class="time">
            <div class="time_main">
                <div id="dateInput"></div>
            </div>
            <div class="timesetting"></div>
        </div>
        <div class="store"> -->
         <!--    <div>결제하기</div> -->
        <!-- </div> -->
     		<!-- </div>  -->
        </div> 
    	</div>
			
			</div>
	</div>

</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=095bf2bab670dc21291d69e69ecac288&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		var map = new kakao.maps.Map(container, options);
		

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		
		geocoder.addressSearch('${cb.location}', function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {

		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">완성!!!!!</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});   
		
		
		var currentTitle = document.getElementById('current-year-month');
	    var calendarBody = document.getElementById('calendar-body');
	    var today = new Date();
	    var first = new Date(today.getFullYear(), today.getMonth(), 1);
	    var dayList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday',
	        'Thursday', 'Friday', 'Saturday'];
	    var monthList = ['January', 'February', 'March', 'April', 'May',
	        'June', 'July', 'August', 'September', 'October',
	        'November', 'December'];
	    var leapYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	    var notLeapYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	    var pageFirst = first;
	    var pageYear;
	    if (first.getFullYear() % 4 === 0) {
	        pageYear = leapYear;
	    } else {
	        pageYear = notLeapYear;
	    }

	    /* 달력을 보여주는 작업 */
	    function showCalendar() {
	        var current_year_month = document
	            .getElementById('current-year-month');
	        current_year_month.innerText = first.getFullYear()
	            + "-"
	            + (first.getMonth() + 1 > 9 ? first.getMonth() + 1
	                : "0" + (first.getMonth() + 1));

	        let monthCnt = 100;
	        let cnt = 1;
	        for (var i = 0; i < 6; i++) {
	            var $tr = document.createElement('tr');
	            $tr.setAttribute('id', monthCnt);
	            for (var j = 0; j < 7; j++) {
	                if ((i === 0 && j < first.getDay())
	                    || cnt > pageYear[first.getMonth()]) {
	                    var $td = document.createElement('td');
	                    $tr.appendChild($td);
	                } else {
	                    var $td = document.createElement('td');
	                    $td.textContent = cnt;
	                    $td.setAttribute('id', cnt);
	                    var yyyy = first.getFullYear();
	                    var MM = first.getMonth() + 1;
	                    MM = MM < 10 ? "0" + MM : MM;
	                    var dd = cnt;
	                    dd = dd < 10 ? "0" + dd : dd;
	                    $td.setAttribute('value', yyyy + "-" + MM + "-" + dd);
	                    $td.setAttribute("class", 'abled_td');
	                    /* $td.setAttribute('value', first.getFullYear() + "-"
	                            + ((first.getMonth() + 1)<10?"0"+(first.getMonth() + 1):(first.getMonth() + 1)) + "-" + cnt <10?"0"+cnt:cnt); */

	                    $td.onclick = function () {
	                        if (new Date(this.getAttribute("value") + " 23:59:59") < new Date()) {
	                            alert("이전 날짜로 예약 할 수 없습니다.");
	                            return;
	                        }
	                        document.getElementById("dateInput").textContent = this.getAttribute("value");
	                        var date  = $("#current-year-month").text();
	                        var day = $("#dateInput").text().substring(8);
	                        var num = ${cb.class_registrynum};
							$.ajax({
								type : "post",
								url : "${pageContext.request.contextPath}/saveGetTime.do",
								data : {day : day , num : num, date : date },
								dataType : "text",
								success:function (data, status){
									var result = JSON.parse(data);
									var time = result.time;
									$(".time_wrap").empty();
									for(var i = 0; i < time.length; i++){
										$(".time_wrap").append("<div class='timedetail"+i+" time_detail' onclick='checkbox("+i+")'><div class='time_detail1'>"+time[i].start+" ~ "+time[i].end+"</div>"
														+"<div class='time_detail2'><div class='per_price'>${cb.price}</div><div class='person parson2'>0/${cb.personnel}</div></div></div>");
									}
							
								},
								error:function(data,status){
									alert('error');
								}
							});
	                        var tds = document.querySelectorAll('.abled_td');
	                        for (var i = 0; i < tds.length; i++) {
	                            tds[i].setAttribute("class", "abled_td");
	                        }
	                        this.setAttribute("class", "abled_td clicked_td");
	                    };
	                    $tr.appendChild($td);
	                    cnt++;
	                    // console.log($td.getAttribute('value'));
	                }
	            }
	            monthCnt++;
	            calendarBody.appendChild($tr);
	        }
	    }

	    showCalendar();

	    /* 화면에있던 기존의 달력을 지우는 작업 */
	    function removeCalendar() {
	        let
	            catchTr = 100;
	        for (var i = 100; i < 106; i++) {
	            var $tr = document.getElementById(catchTr);
	            $tr.remove();
	            catchTr++;
	        }
	    }

	    /* > 버튼 클릭시 */
	    var nextBtn = document.getElementById("next");
	    nextBtn.addEventListener("click", function () {
	        removeCalendar();
	        first = new Date(today.getFullYear(), today.getMonth() + 1, 1);
	        showCalendar();
	        today = new Date(today.getFullYear(), today.getMonth() + 1, 1);
	     	x();
	    });

	    /* < 버튼 클릭시 */
	    var prevBtn = document.getElementById("prev");
	    prevBtn.addEventListener("click", function () {
	        removeCalendar();
	        first = new Date(today.getFullYear(), today.getMonth() - 1, 1);
	        showCalendar();
	        today = new Date(today.getFullYear(), today.getMonth() - 1, 1);
	       	x();
	    });
	    function x(){
	        console.log($(".abled_td").length);
	      	var num = ${cb.class_registrynum};
	        var date= $("#current-year-month").text();
	         $.ajax({
	            type: "post",
	            url: "${pageContext.request.contextPath}/timeSetting.do",
	            dataType: "text",
	            data: { date : date , num :  num},
	             success:function (data, status) {
	            	 var result = JSON.parse(data);
	            	 var all = result.all;
	            	 if(all.length != 0 ){
	                  for(var i = 0; i < all.length; i++){
	                	  $(".abled_td").eq(all[i].day - 1).css("background","red");
	                 } 
	            	 }
	             },
	             error:function(data,status){
	            	 alert('error');
	             }
	         }); 
	    }
	    function checkbox(i) {
			$('.timedetail'+i+'').css("background-color", "gray");
			$('.timedetail'+i+'').addClass('person_count');
			$(".time_detail").not($('.timedetail'+i+'')).css("background-color", "white");
			$(".time_detail").not($('.timedetail'+i+'')).removeClass('person_count');
			var $person = $(".person_count").children('.time_detail2');
		 	$('.parson2').text("0/${cb.personnel}");
			$person.children('.person').text(1+"/${cb.personnel}");
			$('.person_num').val("1");
			var today = $('#dateInput').text();
			console.log(today);
			var per =  Number($('.person_num').val())
			$('.reserve_date').text(today + " "+ per + "명");
			var  price = $person.children('.per_price').text();
			$('.sum_price').text(price);
			
			
		}
	    
	    function pay(){
	    	var person_num = $(".person_num").val();
	    	var reserve_date = $("#dateInput").text();
	    	var sum_price = $(".sum_price").text();
	    	var class_registrynum = $("#class_registrynum").val();
	    	var data = 0;
	    	var time = $(".person_count").children(".time_detail1").text();
	    	
	    	
	    	
	    	if(sum_price != ""){
		    	$.ajax({
		    		type : "post",
		    		url : "${pageContext.request.contextPath}/classCheck.do",
		    		data : {num : data},
		    		dataType : "text",
		    		success : function(data,status) {
						if(data == 1){
							location.href="${pageContext.request.contextPath}/classPay.do?class_registrynum="+class_registrynum+"&person_num="+person_num+"&reserve_date="+reserve_date+"&sum_price="+sum_price+"&time="+time; 
						}
					},
					error : function(data,status){
						alert("에러가 발생했습니다.");
					}
		    	});
	    	}else{
	    		alert("날짜를 선택해주세요");
	    	}
	    }
</script>
</body>
</html>
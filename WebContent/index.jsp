<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/13
  Time: 9:35 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>onedayclass</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/swiper-4.5.1/dist/css/swiper.min.css">
    <script>
        var mql = window.matchMedia("screen and (max-width : 767px");
        mql.addListener(function (e) {
            if (e.matches) {

            } else {
                console.log("데스크탑");
            }
        });
        $(function () {
            $(".click_event").on("click", function () {
                $(".side_menu").animate({right : '0'},{duration : 1000});
                $(".sidemenu").css("display","block");
                $(".sidemenu").animate({opacity : "0.7"},{duration : 1000});
                $(".mini-down-menu").animate({bottom : "-100%"},1000);
            });
            $(".close_menu").on("click",function () {
                $(".side_menu").animate({right : "-100%"},{duration: 1000});
                $(".mini-down-menu").animate({bottom : "0"},700);
                $(".sidemenu").animate({opacity : "0"},1000,function () {
                    $(".sidemenu").css("display","none");
                });
            })
            $(".sidemenu").on("click",function () {
                $(".side_menu").animate({right : "-100%"},{duration: 1000});
                $(".mini-down-menu").animate({bottom : "0"},700);
                $(".sidemenu").animate({opacity : "0"},1000,function () {
                    $(".sidemenu").css("display","none");
                });
            })
             $(".nav-bar").on("mouseenter",function () {
                $(".sub_menu").css("display","block");
                $(".sub_menu").stop().animate({opacity:"1"},500);
                $(".sub_background").css("display","block");
                $(".sub_background").stop().animate({height : "350px",opacity:"1"}, 500)
            })
            $(".nav-bar").on("mouseleave",function () {
                $(".sub_menu").stop().animate({opacity:"0"} , 500 ,function() {
                    $(".sub_menu").css("display","none");
                });
                $(".sub_background").stop().animate({height : "0px",opacity:"0"}, 500,function () {
                    $(".sub_background").css("display","none");
                })
            })
        })
    </script>
</head>
<body>
<header>
    <div class="head">
    <div class="login_bar">
    <c:out value="${sessionScope.storenum }"/>
        <c:if test="${empty sessionScope.userid && empty sessionScope.storeid}">
            <div><a href="${pageContext.request.contextPath}/login.do">로그인</a></div>
            <div><a href="${pageContext.request.contextPath}/memberOrStore.do">회원가입</a></div>
        </c:if>
            <c:if test="${not empty sessionScope.userid}">
        	<div><a href="${pageContext.request.contextPath}/mypage.do">내정보</a></div>
        	<div><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></div>
        	<c:out value="${sessionScope.storenum }"/>
        	</c:if>
        	<c:if test="${not empty sessionScope.storeid}">
        	<div><a href="${pageContext.request.contextPath}/storeInfoCheck.do">내정보</a></div>
        	<div><a href="${pageContext.request.contextPath}/classCreate.do">클래스개설</a></div>
        	<div><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></div>
        	</c:if>
        </div>
        <div class="click_event">클릭</div>
        <div class="sidemenu"></div>
            <div class="side_menu">
                <div class="close_menu">X</div>
            </div>
     <div class="nav_wrap">
            <div class="main_logo"><a href="${pageContext.request.contextPath}/main.do">CLASS+</a></div>
            <%--        <div class="search-bar">--%>
            <%--            <form>--%>
            <%--                <div class="search-title">SEARCH</div>--%>
            <%--                <input type="text" name="search">--%>
            <%--            </form>--%>
            <%--        </div>--%>
            <nav class="nav-bar">
                <div>클래스
                    <ul class="sub_menu">
                         <li><a href="${pageContext.request.contextPath}/popularClass.do">인기클래스</a></li>
                        <li><a href="${pageContext.request.contextPath}/beginnerClass.do">입문클래스</a></li>
                    </ul>
                </div>
                <div>카테고리
                    <ul class="sub_menu">
                        <li><a href="${pageContext.request.contextPath}/diffuserClass.do">디퓨저</a></li>
                        <li><a href="${pageContext.request.contextPath}/candleClass.do">캔들</a></li>
                        <li><a href="${pageContext.request.contextPath}/cookingClass.do">요리</a></li>
                        <li><a href="${pageContext.request.contextPath}/bakingClass.do">베이킹</a></li>
                        <li><a href="${pageContext.request.contextPath}/potteryClass.do">도자기</a></li>
                        <li><a href="${pageContext.request.contextPath}/perfumeClass.do">향수</a></li>
                        <li><a href="${pageContext.request.contextPath}/soapClass.do">비누</a></li>
                    </ul>
                </div>
                <div>지역별
                    <ul class="sub_menu">

       					<li><a href="${pageContext.request.contextPath}/seoulClass.do">서울</a></li>
                        <li><a href="${pageContext.request.contextPath}/gyunggiClass.do">경기</a></li>
                        <li><a href="${pageContext.request.contextPath}/busanClass.do">부산</a></li>
                        <li><a href="${pageContext.request.contextPath}/daeguClass.do">대구</a></li>
                        <li><a href="${pageContext.request.contextPath}/daejeonClass.do">대전</a></li>

                        <li><a href="${pageContext.request.contextPath}/gyeongsangClass.do">경상도</a></li>
                        <li><a href="${pageContext.request.contextPath}/chungcheongClass.do">충청도</a></li>
                        <li><a href="${pageContext.request.contextPath}/jeollaClass.do">전라도</a></li>
                        <li><a href="${pageContext.request.contextPath}/gangwonClass.do">강원도</a></li>
                        <li><a href="${pageContext.request.contextPath}/jejuClass.do">제주도</a></li>

                    </ul>
                </div>
                <div>고객센터
                	<ul class="sub_menu">
                		<li><a href="${pageContext.request.contextPath}/noticeMainPage.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/helpMainPage.do">문의하기</a></li>
                        <li><a href="${pageContext.request.contextPath}/faqMainPage.do">FAQ</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <div class="sub_background"></div>
</header>
<section>
    <div class="container">
        <div class="swiper-container swiper1">
            <div class="swiper-wrapper swiper1-1">
                <div class="swiper-slide">
                    <div class="main_slide1"></div>
                </div>
                <div class="swiper-slide">
                    <div class="main_slide2"></div>
                </div>
                <div class="swiper-slide">
                    <div class="main_slide3"></div>
                </div>
            </div>
        </div>
        
        <div class="best_sub">Best Class</div>
        <div class="best-bar">
            <div class="swiper-container best-bar1">
                <div class="swiper-wrapper best-wrapper">
                <c:forEach var="list" items="${list }">
                    <div class="swiper-slide">
                        <div class="best-class">
                            <div class="thumbnail"><a href="ClassInfo.do?class_registrynum=${list.class_registrynum}">
                            <img src="${pageContext.request.contextPath}/thumbnailImage/${list.thumbnail}"></a></div>
                            <div class="class-name">
                                <div class="class-name1">${list.category }</div>
                                <div class="class-name2">${list.class_name }</div>
                                <div class="class-name3">${list.class_company}</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
					<!-- 페이징 -->
					<div class="swiper-pagination"></div>
            </div>
        </div>
        <hr>
        <div class="best_sub">Beginner Class</div>
        <div class="best-bar">
            <div class="swiper-container best-bar2">
                <div class="swiper-wrapper best-wrapper">
                <c:forEach var="list" items="${list }">
                    <div class="swiper-slide">
                        <div class="best-class">
                            <div class="thumbnail"><img src="${pageContext.request.contextPath}/thumbnailImage/${list.thumbnail}"></div>
                            <div class="class-name">
                                <div class="class-name1">${list.category }</div>
                                <div class="class-name2">${list.class_name }</div>
                                <div class="class-name3">${list.class_company}</div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
					<!-- 페이징 -->
					<div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="foot">
    
    <div class="footer_menu">
    	<div>브랜드 소개</div>
    	<div>가맹점문의</div>
    	<div>오시는길</div>
    	<div>고객의소리</div>
    	<div>사이트이용약관</div>
    	<div>개인정보처리방침</div>
  	 </div>
    	<div class="footer_logo">CLASS+</div>
    	<div class="footer_detail">
    		<div>사업자 등록번호 : 109-86-10925&nbsp;&nbsp;&nbsp;대표전화 : 02-2065-0776FAX : 02-2065-7161&nbsp;&nbsp;&nbsp;개설문의 : 1588-0738</div>

			<div>서울 본사 : 서울특별시 마포구 월드컵북로6길 3 이노베이스 빌딩 4, 5층 (주)요거프레소</div>

			<div>바리스타 아카데미 : 서울특별시 마포구 월드컵북로6길 3 이노베이스 빌딩 4층</div>

			<div>COPYRIGHT(C) YOGERPRESSO. ALL RIGHTS RESERVED.</div>
    	</div>
    </div>
</footer>
<div class="mini-down-menu">
    <div><a href="${pageContext.request.contextPath}/login.do">로그인</a></div>
    <div>클래스개설</div>
   	<div><a href="${pageContext.request.contextPath}/memberOrStore.do">회원가입</a></div>
</div>
<script src="${pageContext.request.contextPath}/swiper-4.5.1/dist/js/swiper.min.js"></script>
<script>
    var swiper = new Swiper('.swiper1', {
        loop: true,
        autoplay: {
            delay: 3000,
        },
        speed: 1000
    });
    var swiper2 = new Swiper('.best-bar1', {
        loop: true,
       autoplay: {
           delay: 3000,
         }, 
        speed: 1000,
    	slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
    	spaceBetween : 20, // 슬라이드간 간격
    	slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    	
    	pagination : { // 페이징
    		el : '.swiper-pagination',
    		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
    	}
    });
    var swiper3 = new Swiper('.best-bar2', {
        loop: true,
       autoplay: {
           delay: 3000,
         }, 
        speed: 1000,
    	slidesPerView : 4, // 동시에 보여줄 슬라이드 갯수
    	spaceBetween : 20, // 슬라이드간 간격
    	slidesPerGroup : 4, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
    	
    	pagination : { // 페이징
    		el : '.swiper-pagination',
    		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
    	}
    });
</script>
</body>
</html>

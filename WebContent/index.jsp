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
        })
    </script>
</head>
<body>
<header>
    <div class="head">
    <div class="login_bar">
        <c:if test="${empty sessionScope.userid && empty sessionScope.storeid}">
            <div><a href="${pageContext.request.contextPath}/login.do">로그인</a></div>
            <div><a href="${pageContext.request.contextPath}/memberOrStore.do">회원가입</a></div>
        </c:if>
            <c:if test="${not empty sessionScope.userid}">
        	<div><a href="/mypage.do">내정보</a></div>
        	<div><a href="/logout.do">로그아웃</a></div>
        	</c:if>
        	<c:if test="${not empty sessionScope.storeid}">
        	<div><a href="${pageContext.request.contextPath}/storeInfoCheck.do">내정보</a></div>
        	<div><a href="${pageContext.request.contextPath}/logout.do">로그아웃</a></div>
        	</c:if>
        </div>
        <div class="click_event">클릭</div>
        <div class="sidemenu"></div>
            <div class="side_menu">
                <div class="close_menu">X</div>
            </div>
        <h1><a href="${pageContext.request.contextPath}/main.do">Logo</a></h1>
        <div class="search-bar">
            <form>
                <div class="search-title">SEARCH</div>
                <input type="text" name="search">
            </form>
        </div>
        <nav class="nav-bar">
            <div>클래스</div>
            <div>카테고리</div>
            <div>인기클래스</div>
            <div>지역별</div>
            <div>후기</div>
        </nav>
    </div>
</header>
<section>
    <div class="container">
        <div class="swiper-container swiper1">
            <div class="swiper-wrapper swiper1-1">
                <div class="swiper-slide">슬라이드1</div>
                <div class="swiper-slide">슬라이드2</div>
                <div class="swiper-slide">슬라이드2</div>
            </div>
        </div>
        <div class="best-bar">
            <div class="swiper-container best-bar1">
                <div class="swiper-wrapper best-wrapper">
                    <div class="swiper-slide">
                        <div class="best-class">
                            <div class="thumbnail">사진</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                        <div class="best-class">
                            <div class="thumbnail">사진</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                        <div class="best-class">
                            <div class="thumbnail">사진</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                        <div class="best-class">
                            <div class="thumbnail">사진</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="best-class">
                            <div class="thumbnail">사진2</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                        <div class="best-class">
                            <div class="thumbnail">사진2</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                        <div class="best-class">
                            <div class="thumbnail">사진2</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                        <div class="best-class">
                            <div class="thumbnail">사진2</div>
                            <div class="class-name">
                                <div class="class-name1">카테고리 난이도</div>
                                <div class="class-name2">클래스명</div>
                                <div class="class-name3">업체명</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="foot">
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
        // autoplay: {
        //     delay: 3000,
        // },
        speed: 1000
    });
</script>
</body>
</html>

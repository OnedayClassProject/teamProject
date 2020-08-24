<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/classList/beginnerClass.css">
</head>
<body><jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">입문클래스</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/popularClass.do" class='current_menu3'><div>인기클래스</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/beginnerClass.do" class='current_menu2'><div>입문클래스</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
            <div>입문클래스</div>
           	<div class="best-class">
                 <div class="thumbnail">사진</div>
                     <div class="class-name">
                         <div class="class-name1">카테고리</div>
                         <div class="class-name2">클래스명</div>
                         <div class="class-name3">평점</div>
                    </div>
           	</div>
           	<div class="best-class">
                 <div class="thumbnail">사진</div>
                     <div class="class-name">
                         <div class="class-name1">카테고리</div>
                         <div class="class-name2">클래스명</div>
                         <div class="class-name3">평점</div>
                    </div>
           	</div>
           	<div class="best-class">
                 <div class="thumbnail">사진</div>
                     <div class="class-name">
                         <div class="class-name1">카테고리</div>
                         <div class="class-name2">클래스명</div>
                         <div class="class-name3">평점</div>
                    </div>
           	</div><br>
           	<div class="best-class">
                 <div class="thumbnail">사진</div>
                     <div class="class-name">
                         <div class="class-name1">카테고리</div>
                         <div class="class-name2">클래스명</div>
                         <div class="class-name3">평점</div>
                    </div>
           	</div>
           	<div class="best-class">
                 <div class="thumbnail">사진</div>
                     <div class="class-name">
                         <div class="class-name1">카테고리</div>
                         <div class="class-name2">클래스명</div>
                         <div class="class-name3">평점</div>
                    </div>
           	</div>
           	<div class="best-class">
                 <div class="thumbnail">사진</div>
                     <div class="class-name">
                         <div class="class-name1">카테고리</div>
                         <div class="class-name2">클래스명</div>
                         <div class="class-name3">평점</div>
                    </div>
           	</div>
            </div>
        </div>
</section>
</body>
</html>
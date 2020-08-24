<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/classList/popularClass.css">
</head>
<body><jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">인기클래스</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/popularClass.do" class="current_menu2"><div>인기클래스</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/beginnerClass.do"class="current_menu3"><div>입문클래스</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
        </div>
           
            <div class="my_main">
            <div>인기클래스</div>
            <c:set var="j" value="0"/> 
            <c:forEach var="classBean" items="${Vector}">
         
           		<div class="best-class">

                 <div class="thumbnail">
<<<<<<< HEAD
                 <img src="${pageContext.request.contextPath}/images/ba61d3e7c5d74f8eb478f91833ef523e.jpg">
=======
                 <a href="ClassInfo.do?class_registrynum="${classBean.class_registrynum} >
            
                 <img src="${pageContext.request.contextPath}/images/${classBean.thumbnail}" width="150">
                 </a>
>>>>>>> a0335dfcebc124dcb8f4bfdc7afaabd966dc942c
                 </div>
                     <div class="class-name">
                         <div class="class-name1">카테고리 : ${classBean.category}</div>
                         <div class="class-name2">클래스명 : ${classBean.class_name}</div>
                         <div class="class-name3">평점  : </div>
                    </div>
            	 </div>
        	   <c:if test="${j%3==0}">
        	   	<br>
        	   </c:if>
             <c:set var="j" value="${j+1}"/>
            </c:forEach>

            </div>
        </div>
</section>
</body>
</html>
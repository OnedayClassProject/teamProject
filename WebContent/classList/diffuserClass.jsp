<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/classList/diffuserClass.css">
</head>
<body><jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">디퓨저클래스</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/popularClass.do" class="current_menu3"><div>인기클래스</div>
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
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/diffuserClass.do" class='current_menu2'><div>디퓨저클래스</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
        </div>
           
            <div class="my_main">
            <div>디퓨저클래스</div>
         <c:if test="${count != 0}">
            <c:set var="j" value="1"/> 

            <c:forEach var="classBean" items="${list}">
         
           		<div class="best-class">
                 <div class="thumbnail">
                 <a href="ClassInfo.do?class_registrynum="${classBean.class_registrynum} >
            
                 <img src="${pageContext.request.contextPath}/thumbnailImage/${classBean.thumbnail}" width="150">
                 </a>
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
        	 </c:if>
        	 
            <div class="pageNum">
            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
            		<a href="${pageContext.request.contextPath}/diffuserClass.do?pageNum=${i}">[${i}]</a>
            	</c:forEach>
            </div>
                   
           </div> 
         
          <c:if test="${count == 0}">
          	<div class="no_list"> NO LIST </div>
          </c:if>


        </div>
</section>
</body>
</html>
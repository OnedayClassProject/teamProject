<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/reserveList.css">
</head>
<body><jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
            <div class="side_detail">
              <a href='${pageContext.request.contextPath}/storeReserve.do'>
                <div>예약확인</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeRefund.do'> 
                <div>환불확인️</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>정보보기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage2.do'><div>수정하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>탈퇴하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeMyClassInfo.do'><div>내가 등록한 클래스</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
        </div>          
         <div class="my_main">
            <div>내가 등록한 클래스</div>
                     <hr>
          
         <div class="reserveInfo">
        	 		<div>클래스 정보</div>
           			<div>클래스 인원</div>
           			<div>클래스 난이도</div>
           			<div>클래스 처리</div>
           </div>
         <div class="line"><div>
         <c:if test="${count != 0}">

            <c:forEach var="classBean" items="${list}">

           		<div class="reserveInfo2">
           			<div class="reserveInfo3">
               		  <div class="class_pic" >
                		 <a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${classBean.class_registrynum}" >
               	 		 <img src="${pageContext.request.contextPath}/thumbnailImage/${classBean.thumbnail}">
               			  </a>
               	  </div>
                     <div class="class-name">
                         <div>카테고리 : ${classBean.category}</div>
                         <div>클래스명 : ${classBean.class_name}</div>
                  		 <div>가격 : ${classBean.price}</div>
                  			
                  		<input type="hidden" name="class_registrynum" value="${class_registrynum}">
                  		<input type="hidden" name="storenum" value="${storenum}">
                  	   <input type="button" onclick ="location.href ='${pageContext.request.contextPath}/MyClassUpdate.do?class_registrynum=${classBean.class_registrynum}&storenum=${storenum}'" value="클래스 수정하기"/>
                    </div>
            	 </div>
            	 	<div class="reserveInfo4">${classBean.personnel}</div>
           			<div class="reserveInfo5">${classBean.level}</div>
           			<div class="reserveInfo4">완료</div>
            	 </div>
        	   	<br>
            </c:forEach>
        	 </c:if>
            <div class="pageNum">
            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
            		<a href="${pageContext.request.contextPath}/storeMyClassInfo.do?pageNum=${i}">[${i}]</a>
            	</c:forEach>
            </div>
                   
           </div>  
         <c:if test="${count == 0}">
          	<div class="no_list"> NO LIST </div>
          </c:if>
          </div>
        </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/store/myclass.css">
<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@700&family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"/>
<c:if test="${empty sessionScope.storeid }">
<script type="text/javascript">
	alert("로그인해주세요!!");
    location.href="${pageContext.request.contextPath}/login.do";
</script>
</c:if>
<section>
<div class="pic"><div>STOREPAGE</div></div>
    <div class="my_wrap">
        <div class="side_menu">
            <div class="side_detail">
              <a href='${pageContext.request.contextPath}/storeReserve.do'>
                <div>예약확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeRefund.do'> 
                <div>환불확인️</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>정보보기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage2.do'><div>수정하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeMyClassInfo.do'><div>내가 등록한 클래스</div>
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
         <div class="line"></div>
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
                         <div class="class_category">${classBean.category}</div>
                         <div class="class_sub">${classBean.class_name}</div>
                  		 <div>${classBean.price}</div>
                  		<input type="hidden" name="class_registrynum" value="${class_registrynum}">
                  		<input type="hidden" name="storenum" value="${storenum}">
                    </div>
            	 </div>
            	 	<div class="reserveInfo4">${classBean.personnel}</div>
           			<div class="reserveInfo5">${classBean.level}</div>
           			<div class="class_btn">
	           			<div>
	           			<input type="button" onclick ="location.href ='${pageContext.request.contextPath}/MyClassUpdate.do?class_registrynum=${classBean.class_registrynum}&storenum=${storenum}'" value="수정"/>
	            	 	</div>
            	 	</div>
            	 </div>
        	   	<br>
            </c:forEach>
        	 </c:if>
           	                      <div class="pageNum">
            	<c:if test="${pageNum > 1}">
            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/storeMyClassInfo.do?pageNum=${1}'"> << </div>
            	</c:if>
            	<c:if test="${pageNum > startPage}">
            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeMyClassInfo.do?pageNum=${pageNum-1}'"> < </div>
            	</c:if>
            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeMyClassInfo.do?pageNum=${i}'">${i}</div>
            	</c:forEach>
            	<c:if test="${pageNum < pageCount}">
            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/storeMyClassInfo.do?pageNum=${pageNum+1}'"> > </div>
            	</c:if>
            	<c:if test="${pageNum < pageCount}">
            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/storeMyClassInfo.do?pageNum=${pageCount}'"> >> </div>
            	</c:if>
            </div>
                   
           </div>  
         <c:if test="${count == 0}">
          	<div class="no_list"> NO LIST </div>
          </c:if>
          </div>
</section>
 <jsp:include page="../footer.jsp" />
</body>
</html>
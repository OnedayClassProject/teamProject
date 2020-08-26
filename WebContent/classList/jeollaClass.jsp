<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/classList/chungcheongClass.css">
</head>
<body><jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">전라도</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/seoulClass.do" class='current_menu3'><div>서울</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/rudrlClass.do" class='current_menu3'><div>경기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/beginnerClass.do" class='current_menu3'><div>부산</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/beginnerClass.do" class='current_menu3'><div>대구</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/beginnerClass.do" class='current_menu3'><div>광주</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/gyeongsangClass.do" class='current_menu3'><div>경상도</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/chungcheongClass.do" class='current_menu3'><div>충청도</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/jeollaClass.do" class='current_menu2'><div>전라도</div>
                <div class="side_detail2">></div>
                </a>
            <hr>
            </div>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/gangwonClass.do" class='current_menu3'><div>강원도</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/jejuClass.do" class='current_menu3'><div>제주도</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
            <div>전라도</div>
            
            <c:set var="i" value="1"/>
            
            <c:forEach var="ClassBean" items="${requestScope.Vector}">
            
           	<div class="best-class">
				<div class="thumbnail">
					<a href="${pageContext.request.contextPath}/classInfo.do?class_registrynum=${ClassBean.class_registrynum}">
						<img src="${pageContext.request.contextPath}/thumbnailImage/${ClassBean.thumbnail}">
	           		</a>
				</div>
					<div class="class-name">
						<div class="class-name1">${ClassBean.category}</div>
                        <div class="class-name2">${ClassBean.class_name}</div>
                        <div class="class-name3">${ClassBean.level}</div>
                    </div>
           	</div>
           	
	            <c:if test="${i%3 == 0}">
	            	<br>
	            </c:if>
	            
	            <c:set var="i" value="${i+1}"/>
            
            </c:forEach>
	          	<div class="pageNum">
	          		<c:forEach var="p" begin="${startPage}" end="${endPage}">
	          			<a href="${pageContext.request.contextPath}/jeollaClass.do?pageNum=${p}">[${p}]</a>
	          		</c:forEach>
	          	</div>
	          			
	          	<c:if test="${cnt == 0 }">
	          		<div class="no_list">LIST가 없습니다.</div>
	          	</c:if>
	          	
            </div>
        </div>
   
</section>
</body>
</html>
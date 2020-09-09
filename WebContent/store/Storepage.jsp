<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/21
  Time: 11:34 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
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
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage3.do'><div>탈퇴하기</div>
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
                <div class="my_subject">MY PAGE</div>
                <div class="my_main2">
                    <div class="my_main3">
                        <div>좋아요❤️</div>
                        <div>0</div>
                    </div>
                    <div class="my_main3">
                        <div>등급</div>
                        <div>0</div>
                    </div>
                    <div class="my_main3">
                        <div>예약</div>
                        <div>0</div>
                    </div>
                    <div class="my_main3">
                        <div>환불</div>
                        <div>0</div>
                    </div>
                </div>
                <hr>
                <div class="reserve_list">
                    	인기 클래스
                </div>
                <div class="reserve_list2">
                	<c:if test = "${count ne 0 }">
                		<c:forEach var="list" items="${list }">
		                    <div class="best-class">
		                        <a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${list.class_registrynum}">
		           					<img src="${pageContext.request.contextPath}/thumbnailImage/${list.thumbnail}" class="thumbnail">
		           				</a>
		                        <div class="class-name">
		                       		<div class="class-name2">${list.category }</div>
		                            <div class="class-name3">${list.class_name }</div>
		                            <div class="class-name1">${list.level }</div>
		                        </div>
		                    </div>
		                </c:forEach>
	                 </c:if>
                    
                    <c:if test="${fn:length(list) >= 3 }">
	                    <div class="move_reserveList">
	                    	<div class="more_class">더보기</div>
	                    </div>
                    </c:if>
                </div>
                
                
                
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
<script>
	$(".more_class").on("click",function(){
		location.href="${pageContext.request.contextPath}/storeMyClassInfo.do";
	});
</script>
</body>
</html>

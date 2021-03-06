<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storeInfo.css">
    <link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@700&family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
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
                <div class="member_info">
      					<div class="info_text">정보보기</div>
            <hr>
            <div class="info_main">
                	<div class="info_sub">
	                	<div>이메일</div>
	                	<div>${bean.storeemail}</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>업체이름</div> 
                		<div> ${bean.storename }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>연락처 </div> 
                		<div>${bean.storetel }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>우편번호</div>
                		<div>${bean.storepostcode }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div >주소</div>
						<div id="info_sub2">${bean.storeaddress1 }&nbsp;${bean.storeaddress2 }&nbsp;${bean.storeaddress3 }</div>
                	</div>
                	<div class="line"></div>
                	<div class="join_text4">
                   		<input type="button" onclick = "location.href = '${pageContext.request.contextPath}/storeUpdate.do'" value="UPDATE">
                    	<input type="button" onclick = "location.href = '${pageContext.request.contextPath}/storeCheckInfoPage3.do'" value="DELETE">
                	</div>
            </div>
    			</div>
            </div>
            </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storeInfo.css">
</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<body>

<jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
                <a href='${pageContext.request.contextPath}/memberReserve.do'><div>예약확인</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/memberRefund.do'><div>환불확인</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/MemberCheckInfoPage.do'><div>정보보기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage2.do'><div>수정하기</div>
                <div class="side_detail2">></div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage3.do'><div>탈퇴하기</div>
                <div class="side_detail2">></div>
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
	                	<div>${getMember.useremail}</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>이름</div> 
                		<div>${getMember.username }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>연락처 </div> 
                		<div>${getMember.phone }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>회원등급 </div> 
                		<div>${getMember.membership }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>포인트 </div> 
                		<div>${getMember.point }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div>우편번호</div>
                		<div>${getMember.postcode }</div>
                	</div>
                	<div class="line"></div>
                	<div class="info_sub">
                		<div >주소</div>
						<div id="info_sub2">${getMember.address }&nbsp;${getMember.detailadd }&nbsp;${getMember.extraadd }</div>
                	</div>
                	<div class="line"></div>
                	<div class="join_text4">
                   		<input type="button" onclick = "location.href = '${pageContext.request.contextPath}/memberUpdate.do'" value="UPDATE">
                    	<input type="button" onclick = "location.href = '${pageContext.request.contextPath}/'" value="DELETE">
                	</div>
            </div>
    			</div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>

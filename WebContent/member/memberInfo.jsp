<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberinfo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storeInfo.css">
	<link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@700&family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<body>

<jsp:include page="../header.jsp"/>
<c:if test="${empty sessionScope.userid}">
<script type="text/javascript">
	alert("잘못된접근방법입니다.");
    location.href="${pageContext.request.contextPath}/main.do";
</script>
</c:if>
<section>
<div class="pic"><div>MYPAGE</div></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
                <a href='${pageContext.request.contextPath}/memberReserve.do'><div>예약확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/memberRefund.do'><div>환불확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/MemberCheckInfoPage.do'><div>정보보기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage2.do'><div>수정하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberCheckInfoPage3.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
             <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberReview.do'><div>리뷰관리</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/MemberFavor.do'><div>즐겨찾기 관리</div>
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
<script type="text/javascript">
<!-- Channel Plugin Scripts -->
(function() {
  var w = window;
  if (w.ChannelIO) {
    return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
  }
  var ch = function() {
    ch.c(arguments);
  };
  ch.q = [];
  ch.c = function(args) {
    ch.q.push(args);
  };
  w.ChannelIO = ch;
  function l() {
    if (w.ChannelIOInitialized) {
      return;
    }
    w.ChannelIOInitialized = true;
    var s = document.createElement('script');
    s.type = 'text/javascript';
    s.async = true;
    s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
    s.charset = 'UTF-8';
    var x = document.getElementsByTagName('script')[0];
    x.parentNode.insertBefore(s, x);
  }
  if (document.readyState === 'complete') {
    l();
  } else if (window.attachEvent) {
    window.attachEvent('onload', l);
  } else {
    window.addEventListener('DOMContentLoaded', l, false);
    window.addEventListener('load', l, false);
  }
})();
ChannelIO('boot', {
  "pluginKey": "23441f9e-c08a-4bd9-8ec4-21d31c9851cf"
});
<!-- End Channel Plugin -->

</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/member/mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/member/reserveList.css">

</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<body>
<jsp:include page="../header.jsp" />
<section>
	<div class="my_wrap">
		<div class="side_menu">
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/AllGetMember.do'><div>회원조회</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href='${pageContext.request.contextPath}/AllGetStore.do'><div>업체조회</div>
                </a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<div>업체 리스트</div>
        	<hr>
        	<div>
        		<div class="reserveInfo">
        			<div>업체 이메일</div>
        			<div>업체 이름</div>
        			<div>업체 전화번호</div>
        			<div>업체 주소</div>
        			<div>업체 우편번호</div>
        			<div>업체 가입날짜</div>
        		</div>
        		<div class="line"></div>
        		<!-- 회원 목록 반복 -->
        		<c:forEach var="getStore" items="${AllGetStore }">
        		<div class="reserveInfo">
        			<div>${getStore.storeemail }</div>
        			<div>${getStore.storename }</div>
        			<div>${getStore.storetel }</div>
        			<div>${getStore.storeaddress1}</div>
        			<div>${getStore.storepostcode }</div>
        			<div>${getStore.store_joindate }</div>
        			
        		</div>
        		<hr>
        		</c:forEach>
        		<!-- 반복 -->
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
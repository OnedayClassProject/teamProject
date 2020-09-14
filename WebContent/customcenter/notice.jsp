<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/customcenter/help.css">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="../header.jsp"/>
<section>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">공지사항</div>
           <div class="line"></div>
           <div class="side_detail">
               <a href="${pageContext.request.contextPath}/noticeMainPage.do"class="current_menu2"><div>공지사항</div></a>
            </div>
            <hr>
                <a href="${pageContext.request.contextPath}/helpMainPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu2"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<div><h2>공지사항</h2></div>
        	<div>
        			<div class="help_subject">
        				<div>No</div>
        				<div>제목</div>
        				<div>작성자</div>
        				<div>날짜</div>
        			</div>
        	
        			<c:if test="${count != 0}">
	        			<c:forEach var = "list" items="${requestScope.list }">
	        				<div class="help_board">
	        				<c:choose>
	        					<c:when test="${list.header !=0 }">
	        						<div><strong>공지</strong></div>
	        					</c:when>
	        					<c:when test="${list.header == 0}">
	        						<div>${list.num }</div>
	        					</c:when>
	        				</c:choose>
	        					<div><a href="${pageContext.request.contextPath}/noticePage.do?num=${list.num}&pageNum=${pageNum}">${list.title }</a></div>
	        					<div>관리자</div>
	        					<c:set var ="date" value = "${list.date }"></c:set>
	        					<div>${fn:substring(date,0,10) }</div>
	        				</div>
	        			</c:forEach>
        			</c:if>
        			<c:if test="${count == 0 }">
	        		<div class="nolist">목록이 없습니다.</div>
	        	</c:if>
        			<div class="write_button">
        		<c:if test="${sessionScope.userid == 'admin' }">
        			<button onclick="location.href='${pageContext.request.contextPath}/noticeWrite.do'">공지쓰기</button>
        		</c:if>
        		</div>
        	</div>
        	<div>
	        	<c:if test="${count!=0}">
	        		<c:if test="${startPage > pageBlock}">
	        			<a href="${pageContext.request.contextPath}/noticeMainPage.do?pageNum=${startPage - pageBlock}">Prev</a>
	        		</c:if>
	       			<c:forEach var= "i" begin="${startPage }" end="${endPage}">
	       				<a href="${pageContext.request.contextPath}/noticeMainPage.do?pageNum=${i}">${i}</a>
	       			</c:forEach>
	        		<c:if test="${endPage < pageCount }">
	        			<a href="${pageContext.request.contextPath}/noticeMainPage.do?pageNum=${startPage+pageBlock}">Next</a>
	        		</c:if>
	        	</c:if>
        	</div>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp"/>
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
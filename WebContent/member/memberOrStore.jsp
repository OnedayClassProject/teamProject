<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/16
  Time: 4:29 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberOrStore.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <div class="join">
        <div class="member">
        	<div><a href="${pageContext.request.contextPath}/memberjoin.do"><img src="${pageContext.request.contextPath}/images/user.png"></a></div>
            <div class="member_sub"><a href="${pageContext.request.contextPath}/memberjoin.do">일반회원가입</a></div>
        </div>
        <div class="store">
        <div><a href="${pageContext.request.contextPath}/storejoin.do"><img src="${pageContext.request.contextPath}/images/shop.png"></a></div>
            <div  class="store_sub"><a href="${pageContext.request.contextPath}/storejoin.do">강사등록</a></div>
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

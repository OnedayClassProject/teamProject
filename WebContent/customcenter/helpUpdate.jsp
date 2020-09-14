<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/customcenter/help.css">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="../header.jsp"/>
<script type="text/javascript">
	function submitForm(num,pageNum){
		var title = $("#title").val();
		var content = $("#content").val();
		if(title==""){
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}else if(content==""){
			alert("내용을 입력해주세요");
			$("#content").focus();
			return false;
		}else{
			writeAction(num,pageNum);
		}
		return true;
	}
    function writeAction(num,pageNum){
    	var form = $("#form").serialize();
   		$.ajax('${pageContext.request.contextPath}/helpUpdateAction.do',{
   			type:"post",
   			data:form,
   			success:function(data){
   				if(data == 1){
   					alert("수정하셨습니다.");
   					location.href="${pageContext.request.contextPath}/helpPage.do?num="+num +"&pageNum="+pageNum;
   				}else{
   					alert("수정 실패.");
   				}
   			}, error:function(data){
   				alert("에러가 발생했습니다.");
   			}
   		});
    }
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
<section>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">문의하기</div>
           <div class="line"></div>
           <div class="side_detail">
               <a href="${pageContext.request.contextPath}/noticeMainPage.do"class="current_menu2"><div>공지사항</div></a>
            </div>
            <hr>
                <a href="${pageContext.request.contextPath}/helpMainPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu3"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<form id ="form" method ="post">
        		<input type="hidden" name = "num" value = "${bean.num}">
        		제목 <input type="text" id ="title" name ="title" style="width: 650px; height: 30px;" value = "${bean.title }"><br><br>
        		내용 <br><textarea rows="30" cols="100" id="content" name="content">${bean.content }</textarea><br><br>
        		<button type="button" onclick ="return submitForm(${bean.num},'${pageNum}')">제출하기</button>
        	</form>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>

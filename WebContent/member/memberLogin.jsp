<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 4:51 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <!-- <link rel="stylesheet" href="../header.css"> -->
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberlogin.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
     <script>
        $(function () {
            $(".store").on("click", function () {
                    $("#form1").css("display","none");
                    $("#form2").css("display","block");
                    $("#form3").css("display","none");
                    /* $(".member > div").stop().animate({ opacity : 0}, 500); */
                    $(".store").css("backgroundColor","#d24729");
                    $(".admin").css("backgroundColor","white");
                    $(".store").css("color","white");
                    $(".member").css("backgroundColor","white");
                    $(".member").css("color","black");
                    $(".admin").css("color","black");
            })
            $(".member").on("click", function () {
                $("#form1").css("display","block");
                $("#form2").css("display","none");
                $("#form3").css("display","none");
                $(".store").css("backgroundColor","white");
                $(".store").css("color","black");
                $(".member").css("backgroundColor","#d24729");
                $(".admin").css("backgroundColor","white");
                $(".member").css("color","white");
                $(".admin").css("color","black");
            });
            $(".admin").on("click", function () {
                $("#form1").css("display","none");
                $("#form2").css("display","none");
                $("#form3").css("display","block");
                $(".store").css("backgroundColor","white");
                $(".member").css("backgroundColor","white");
                $(".admin").css("backgroundColor","#d24729");
                $(".admin").css("color","white");
                $(".store").css("color","black");
                $(".member").css("color","black");
            })
        })
        
        function memCheck() {
        	var form1 = $("#form1").serialize();
        	var email = $("#email").val();
        	var password = $("#password").val();
        	if(email == ""){
        		Swal.fire('이메일을 입력해주세요.');
        		return false;
        	}else if(password==""){
        		Swal.fire('비밀번호를 입력해주세요.');
        		return false;
        	}else{
        		$.ajax('${pageContext.request.contextPath}/memberLoginPro.do',{
        			type:"post",
        			data:form1,
        			success:function(data){
        				if(data == 1){
        					Swal.fire("로그인에 성공하셨습니다.");
        					location.href="${pageContext.request.contextPath}/main.do"
        				}else{
        					Swal.fire("이메일 또는 비밀번호를 확인해주세요.");
        					$("#email").val(email);
        					$("#password").val("");
        				}
        			}, error:function(data){
        				Swal.fire("에러가 발생했습니다.");
        			}
        		});
        	}
        }
        
        function storeCheck() {
        	var form = $("#form2").serialize();
        	var email = $("#email2").val();
        	var password = $("#password2").val();
        	console.log(email);
        	var password = $("#password2").val();
        	console.log(password);
        	if(email == ""){
        		Swal.fire("이메일을 입력하세요.");
        		return;
        	}else if(password==""){
        		Swal.fire("비밀번호를 입력하세요.");
        		return;
        	}else{
        		$.ajax('${pageContext.request.contextPath}/storeLoginAction.do',{
        			type:"post",
        			data:form,
        			success:function(data){
        				if(data == 1){
        					location.href="${pageContext.request.contextPath}/main.do"
        				}else{
        					Swal.fire("이메일 또는 비밀번호를 확인해주세요.");
        				}
        			}, error:function(data){
        				Swal.fire("에러가 발생했습니다.");
        			}
        		});
        	}
        }
        function adminCheck() {
        	var form = $("#form3").serialize();
        	var email = $("#email3").val();
        	var password = $("#password3").val();
        	console.log(email);
        	var password = $("#password3").val();
        	console.log(password);
        	if(email == ""){
        		Swal.fire("이메일을 입력하세요.");
        		return;
        	}else if(password==""){
        		Swal.fire("비밀번호를 입력하세요.");
        		return;
        	}else{
        		$.ajax('${pageContext.request.contextPath}/AdminLoginPro.do',{
        			type:"post",
        			data:form,
        			success:function(data){
        				if(data == 1){
        					location.href="${pageContext.request.contextPath}/main.do"
        				}else{
        					Swal.fire("이메일 또는 비밀번호를 확인해주세요.");
        				}
        			}, error:function(data){
        				Swal.fire("에러가 발생했습니다.");
        			}
        		});
        	}
        }
    </script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <div class="member-login">
        <div class="login_logo"><img src="${pageContext.request.contextPath}/images/logo.png"></div>
        <hr>

        <div class="login_subtext">LOGIN</div>
        <div class="login_choice">
	        <div class="member">회원</div>
	        <div class="store">강사</div>
	        <div class="admin">관리자</div>
        </div>
        <form id="form1" method="post">
	        <div class="login_box">
	        <div><input type="email" placeholder="이메일" id="email" name="email"></div>
	        <div><input type="password" placeholder="비밀번호" id="password" name="password"></div>
	        </div>
	        <div class="login_button">
	        	<button type="button" onclick="memCheck()">로그인</button>
	       		<button type="button" onclick="location.href='${pageContext.request.contextPath}/memberOrStore.do'">회원가입</button>
	        </div>
        </form>

        <form id="form2" method = "post">
	        <div class="login_box">
	        <div><input type="email" placeholder="이메일" id="email2" name="email"></div>
	        <div><input type="password" placeholder="비밀번호" id="password2" name="password"></div>

	        </div>
	        <div class="login_button">
	        <button type="button" onclick="storeCheck()" >로그인</button>
	        <button type="button" onclick="location.href='${pageContext.request.contextPath}/memberOrStore.do'">회원가입</button>
	        </div>
        </form>
         <form id="form3" method = "post">
	        <div class="login_box">
		        <div><input type="email" placeholder="이메일" id="email3" name="email"></div>
		        <div><input type="password" placeholder="비밀번호" id="password3" name="password"></div>
	        </div>
		        <div class="login_button">
		        <button type="button" onclick="adminCheck()" >로그인</button>
		        <button type="button" onclick="location.href='${pageContext.request.contextPath}/memberOrStore.do'">회원가입</button>
	        </div>
        </form>
        <div class="pwd_find">
        <p>혹시 비밀번호가 기억나지 않으신가요?</p>
   		<a href="javascript:void(0);" onclick="pwd_find(); return false;">비밀번호 찾기</a>
     	</div>
    </div>
</section>
<jsp:include page="../footer.jsp" />
<script>
function pwd_find(){
	window.open('${pageContext.request.contextPath}/member/pwdFind.jsp', '비밀번호 찾기',
	'width=500, height=400, menubar=no, status=no, toolbar=no');
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
</body>
</html>


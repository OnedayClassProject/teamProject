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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberlogin.css">
     <script>
        $(function () {
            $(".store").on("click", function () {
                    $("#form1").css("display","none");
                    $("#form2").css("display","block");
                    /* $(".member > div").stop().animate({ opacity : 0}, 500); */
                    $(".store").css("backgroundColor","lightgray");
                    $(".member").css("backgroundColor","white");
            })
            $(".member").on("click", function () {
                $("#form1").css("display","block");
                $("#form2").css("display","none");
                $(".store").css("backgroundColor","white");
                $(".member").css("backgroundColor","lightgray");
            })
        })
        
        function memCheck() {
        	var form1 = $("#form1").serialize();
        	var email = $("#email").val();
        	var password = $("#password").val();
        	if(email == ""){
        		alert("이메일을 입력하세요.");
        		return false;
        	}else if(password==""){
        		alert("비밀번호를 입력하세요.");
        		return false;
        	}else{
        		$.ajax('${pageContext.request.contextPath}/memberLoginPro.do',{
        			type:"post",
        			data:form1,
        			success:function(data){
        				if(data == 1){
        					alert("로그인에 성공하셨습니다.");
        					location.href="${pageContext.request.contextPath}/main.do"
        				}else{
        					alert("이메일 또는 비밀번호를 확인해주세요.");
        					$("#email").val(email);
        					$("#password").val("");
        				}
        			}, error:function(data){
        				alert("에러가 발생했습니다.");
        			}
        		});
        	}
        }
        
        function storeCheck() {
        	var form = $("#form2").serialize();
        	var email = $("#email2").val();
        	console.log(email);
        	var password = $("#password2").val();
        	if(email == ""){
        		alert("이메일을 입력하세요.");
        		return;
        	}else if(password==""){
        		alert("비밀번호를 입력하세요.");
        		return;
        	}else{
        		$.ajax('${pageContext.request.contextPath}/storeLoginAction.do',{
        			type:"post",
        			data:form,
        			success:function(data){
        				if(data == 1){
        					alert("로그인에 성공하셨습니다.");
        					location.href="${pageContext.request.contextPath}/main.do"
        				}else{
        					alert("이메일 또는 비밀번호를 확인해주세요.");
        				}
        			}, error:function(data){
        				alert("에러가 발생했습니다.");
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
        <div>CLASS+</div>
        <hr>

        <div>로그인</div>
        <table class="login_choice">
        <tr>
        <td class="member">회원로그인</td>
        <td class="store">업체로그인</td>
        </tr>
        </table>
        
        <form id="form1" method="post">
	        <div class="login_box">
	        <div><input type="email" placeholder="이메일" id="email" name="email"></div>
	        <div><input type="password" placeholder="비밀번호" id="password" name="password"></div>
	        </div>
	        <div class="login_button">
	        	<button type="button" onclick="memCheck()">LOGIN</button>
	       		<button type="button" onclick="location.href='${pageContext.request.contextPath}/memberOrStore.do'">CREATE</button>
	        </div>
        </form>

        <form id="form2" method = "post">
	        <div class="login_box">
	        <div><input type="email" placeholder="이메일" id="email2" name="email"></div>
	        <div><input type="password" placeholder="비밀번호"id="password2" name="password"></div>
	        </div>
	        <div class="login_button">
	        <button type="button" onclick="storeCheck()" >LOGIN</button>
	        <button type="button" onclick="location.href='${pageContext.request.contextPath}/memberOrStore.do'">CREATE</button>
	        </div>
        </form>
    </div>
</section>
</body>
</html>

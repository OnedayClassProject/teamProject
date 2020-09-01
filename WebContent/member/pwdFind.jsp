<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <script type="text/javascript">
function openPopUp(url,name){
	var options='width=500,height=500,resizable=no,scrollbars=no,location=no';
	window.open(url,name,options);
}

</script> -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
 <title>Insert title here</title>
</head>
<body>


	        <div class="login_box">
	        	<div><input type="email" placeholder="이메일" id="email" name="email"></div>
	       </div>
	       
	        <div class="login_button">
	        	<input type="button" onclick="email_check()" value="이메일 확인"/>
	        	<!-- 	<button type="button" onclick="email_send()">인증번호 전송</button>
	        -->
	       	<input type="hidden" class="authNum">
	       		<button type="button" onclick="location.href='${pageContext.request.contextPath}/memberOrStore.do'">>>>회원가입하러 가기</button>
	        </div>

	        <div>
			<input type="email" id="authNum" name="authNum" placeholder="" autofocus="">
			
			<label for="inputEmail">인증번호를 입력하세요.</label>
			</div>
			
			<div>
			<button type="button" class="authorize" onclick="checkAuthNum()">인증번호 확인</button>
			</div>

  

<script>
function email_check(){
	var email = $("#email").val();
	console.log(email); 

	if(email == ""){
	alert("이메일을 입력하지 않았습니다.");
	}else{
		$.ajax({
			type:"post",
			url:'${pageContext.request.contextPath}/pwdCheck.do',
			data:{ email : email},
			success:function(data,textStatus){
				
				if(data == 1){
				
					alert("입력하신 이메일로 인증번호를 확인하시기 바랍니다.");
					email_send();
			/* 		
					location.href="${pageContext.request.contextPath}/pwdFind.do";
				 */	}else{
					
					alert("가입되어 있지 않은 이메일입니다.");
					$("#email").val("");
					}
			},
			error:function(data){
				alert("에러가 발생했습니다.");
				console.log(data);
			}
		});
	}//else
	} //function email_check()
 	//이메일전송
	function email_send(){
		var email = $("#email").val();
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/pwdFind.do",
			data:{email:email},
			dataType: "text",
			success: function(data,textStatus){
				var authNum=data;
				$(".authNum").val(authNum);
			},
			error : function(data,textStatus){
				
			}
		});
	
	}
//인증번호 일치 확인
function checkAuthNum(){
		var email = $("#email").val();
		var checkNum = $("#authNum").val();
		var authNum=$.trim($(".authNum").val());
/* 		console.log(checkNum);
		console.log($.trim(authNum)); */
		
		
		if(checkNum==null){
			alert("인증번호를 입력하세요.");
		}else if(checkNum==authNum){
			alert("인증번호 확인완료");
			location.href="${pageContext.request.contextPath}/Newpwd_get.do?email="+email;
			
		}else{
			alert("인증번호가 일치하지 않습니다.");
		}
	}

</script>
</body>
</html>
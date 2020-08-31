<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<title>Insert title here</title>
</head>
<body>
<form id="updatepwd" action="${pageContext.request.contextPath}/Newpwd_set.do" method="post" onsubmit="return Check()">
 <input type="hidden" name="email" value="${email}">
 <div><input class="join_text" type="password" id="userpassword" name="userpassword" placeholder="PASSWORD"></div>
 <div><input class="join_text" type="password" id="pwdcheck" placeholder="PASSWORD"></div>

   <input type="submit" value="수정완료"/>
</form>        

<script>
function Check(){
			//비밀번호
  			var reg2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}$/; // 6~20문자 영대소문자, 숫자 혼합
  			var userpassword = $("#userpassword").val();
			var pwdcheck = $("#pwdcheck").val();
			var updatepwd=$("#updatepwd").serialize();
			
		    // 비밀번호 확인
		    var result2 = reg2.test(userpassword);
		    if (userpassword != pwdcheck){ // 비밀번호와 비밀번호확인란의 입력값이 같은지 확인 
		    	alert("비밀번호를 확인해주세요.");
		    	return false;
		    }else if(userpassword == ""){
		    	alert("비밀번호를 입력해주세요.");
		    	return false;
		    }else if(pwdcheck == ""){
		    	alert("비밀번호를 확인해주세요.");
		    	return false;
		    }else if(result2 != true){
		    	alert("비밀번호를 정확하게 입력해주세요.(6~20자 영어대소문자,숫자 혼합)");
		    	return false;
		    }else{
		    	$.ajax({
		    		type:"post",
		    		url:'${pageContext.request.contextPath}/Newpwd_set.do',
		    		data: updatepwd,
		    		dataType : "text",
		    		success:function(data,dataStatus){
		    			if(data==1){
		    				alert("비밀번호 변경되었습니다.");
		    				self.opener=self;
		    				window.close();
		    			}else if(data==0){
		    				alert("비밀번호 변경이 실패했습니다.");
		    				
		    			}
		    		
		    		},
		    		error:function(data,dataStatus){
		    			
		    		}
		    		
		    		
		    	});
		    	
		    }
		 
}

</script>
</body>
</html>
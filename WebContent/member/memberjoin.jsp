<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 10:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/member/memberjoin.css">

<script>
		$(document).ready(function(){
			$("#email").on("change",function(){
				$("#check").val("false");
			})
			
		});
		function email_check(){
			var email = $("#email").val();
			console.log(email);
			//정규표현식
			 //이메일
		    var reg1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		    var result1 = reg1.test(email);
		    
			if($("#email").val().trim() == ""){
				$("#check_result").empty();
				$("#check_result").append("이메일을 입력하세요.");
				$("#email").focus();
			}else{
				$.ajax('${pageContext.request.contextPath}/memberCheck.do',{
					type:"post",
					data:{ email : email},
					success:function(data,textStatus){
						
						if(data == 1){
							$("#check_result").empty();
							$("#check_result").text("이미 가입된 이메일입니다.");
							
						}else{
							if(result1 != true){
								$("#check_result").empty();
								$("#check_result").text("이메일을 정확하게 입력해주세요");
								
							}else{
								$("#check_result").empty();
								$("#check_result").text("사용가능한 이메일입니다.");
								$("#check").val("true"); // 이메일 중복체크 확인 후 사용가능하면 true로 바꾸기
							}
						}
					},
					error:function(data){
						alert("에러가 발생했습니다.");
						console.log(data);
					}
				});
			
			} //else
			
		}
		
		function Check() {
			
			   
			var email = $("#email").val();
			var check =$("#check").val(); // 이메일 중복체크 여부 확인후 이메일 사용가능 여부
			var userpassword = $("#userpassword").val();
			var pwdcheck = $("#pwdcheck").val();
			var username = $("#username").val();
			var phone = $("#phone").val();
			var postcode = $(".postcode").val();
			var address = $(".address").val();
			var detailadd = $(".detailadd").val();
			
			//정규표현식
			 //이메일
		    var reg1 = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			//비밀번호
		    var reg2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}$/; // 6~20문자 영대소문자, 숫자 혼합
		    //이름
		    var reg3 = /^[가-힣]{2,5}$/;
		    //전화번호
		    var reg4 = /^01(?:0|1|[6-9])[-]?(\d{3}|\d{4})[-]?(\d{4})$/; // 010-(3자리 또는 4자리 0부터 9까지)-(4자리 0부터 9까지)
		    
		    //우편번호
		    var reg5 = /^[가-힣a-zA-Z0-9~!@#$%^&*()_+-]{2,40}$/; // 상세주소
		    
		    
		    
		    // 이메일 확인
		    var result1 = reg1.test(email);
		    if(email == ""){
		    	alert("이메일을 입력해주세요");
		    	return false;
		    }else if( result1 != true){
		    	alert("이메일을 정확하게 입력해주세요");
		    	return false;
		    }
		    
		    // 이메일 중복체크 여부 확인
		    if(check == "false"){
		    	alert("이메일 중복체크를 해주세요.");
		    	return false;
		    }
		    
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
		    }
		    
		    // 이름 확인
		    var result3 = reg3.test(username);
		    if(username == ""){
		    	alert("이름을 입력해주세요.");
		    	return false;
		    } else if(result3 != true){
		    	alert("이름을 정확하게 입력해주세요");
		    	return false;
		    }
		    
		    // 전화번호 확인
		    var result4 = reg4.test(phone);
		    if(phone == ""){
		    	alert("전화번호를 입력해주세요.");
		    	return false;
		    } else if(result4 != true){
		    	alert("전화번호를 정확하게 입력해주세요.");
		    	return false;
		    }
		    
		    // 우편번호 확인
		    var result5 = reg5.test(detailadd); // 상세주소
		    if(postcode == ""){
		    	alert("우편번호를 입력해주세요.");
		    	return false;
		    }else if(address == ""){
		    	alert("주소를 입력해주세요.");
		    	return false;
		    }else if(detailadd == ""){
		    	alert("상세주소를 입력해주세요.");
		    	return false;
		    }else if(result5 != true){
		    	alert("상세주소를 정확하게 입력해주세요.");
		    	return false;
		    }
		    
			return true;
		}
	
</script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <div class="member_join">
        <form action="${pageContext.request.contextPath}/memberjoinPro.do" method="post" onsubmit="return Check()">
            <div>회원가입</div>
            <hr>
            <div class="join_main">
                <div class="join_text2">
                    <input type="email" name="useremail" id="email" placeholder="EMAIL">
                    <input type="button" value="중복확인" onclick="email_check()" >
                    <input type="hidden" value="false" id="check">
                </div>
                <div id="check_result"></div>
                <div><input class="join_text" type="password" id="userpassword"name="userpassword" placeholder="PASSWORD"></div>
                <div><input class="join_text" type="password" id="pwdcheck" placeholder="PASSWORD"></div>
                <div><input class="join_text" type="text" id="username"name="username" placeholder="NAME"></div>
                <div><input class="join_text" type="text" id="phone" name="phone" placeholder="PHONE NUMBER"></div>
                <div class="join_text2">
                    <input type="text" id="sample6_postcode" class="postcode" name="postcode" placeholder="우편번호">
                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                </div>
                <input class="join_text" type="text" id="sample6_address" class="address"name="address" placeholder="주소">
                <div class="join_text3">
                    <input type="text" id="sample6_detailAddress" class="detailadd" name="detailadd" placeholder="상세주소">
                    <input type="text" id="sample6_extraAddress" id="extraadd" name="extraadd" placeholder="참고항목">
                </div>
                <div class="join_text4">
                    <input type="submit" value="CREATE">
                </div>
            </div>
        </form>
    </div>
</section>
<jsp:include page="../footer.jsp" />
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>

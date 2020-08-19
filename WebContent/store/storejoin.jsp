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
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storejoin.css">
</head>
<body>

<jsp:include page="../header.jsp"/>
<section>
    <div class="member_join">
        <form onsubmit="return checkPassword()" action="./storejoinAction.do"  method="post">
            <div>가게 회원가입</div>
            <hr>
            <div class="join_main">
                <div class="join_text2">
                    <input type="email" id = "storeemail" name="storeemail" placeholder="EMAIL" required>
                    <input type="button" value="중복확인" onclick="checkEmail()">
                    <input type ="hidden" id = "checkemail" value="emailUnCheck">
                </div>
                <div><input class="join_text" type="password" id="pass1" name="storepw" placeholder="PASSWORD" required></div>
                <div><input class="join_text" type="password" id="pass2" placeholder="PASSWORD" required></div>
                <!-- <div><input class="join_text" type="text" name="username" placeholder="작가명"></div> -->
                <div><input class="join_text" type="text" name="storename" placeholder="가게이름" required></div>
                <div><input class="join_text" type="text" name="storetel" placeholder="PHONE NUMBER" required></div>
                <div class="join_text2">
                    <input type="text" id="sample6_postcode" placeholder="우편번호">
                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                </div>
                <input class="join_text" type="text" id="sample6_address" name ="storeplace" placeholder="주소">
                <div class="join_text3">
                    <input type="text" id="sample6_detailAddress" placeholder="상세주소">
                    <input type="text" id="sample6_extraAddress" placeholder="참고항목">
                </div>
                <div class="join_text4">
                    <input type="submit" value="CREATE">
                </div>
            </div>
        </form>
    </div>
</section>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
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
    function checkEmail(){
    	var check = document.getElementById("checkemail");
		$.ajax({
			type: "post",
			url : "store/checkEmail.jsp",
			data : { email : $('#storeemail').val()},
			success : function(data) {
				if(data == 0){
					alert("이메일이 존재합니다");
					$('#storeemail').focus();
					$('#storeemail').val("");
				}
				else if(data==1){
					alert("이메일을 사용할 수 있습니다.");
					check.value = "emailCheck";
				}
			}
		});
	}
    function checkPassword(){
    	var check = document.getElementById("checkemail");
    	if(check.value=="emailUnCheck"){
    		alert("아이디 중복체크를 해주세요");
    		return false;
    	}
    	else if($("#pass1").val() != $("#pass2").val()){
			alert("비밀번호가 서로 다릅니다.");
			$("#pass2").focus();
			$("#pass2").val("");
			return false;
    	}
    	return true;
    }
</script>
</body>
</html>

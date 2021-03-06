<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 10:02 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storeUpdate.css">
    <link href="https://fonts.googleapis.com/css2?family=Kumbh+Sans:wght@700&family=Noto+Sans+JP:wght@500&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<c:if test="${empty sessionScope.storeid }">
<script type="text/javascript">
	alert("로그인해주세요!!");
    location.href="${pageContext.request.contextPath}/login.do";
</script>
</c:if>
<section>
<div class="pic"><div>STOREPAGE</div></div>
    <div class="my_wrap">
        <div class="side_menu">
            <div class="side_detail">
              <a href='${pageContext.request.contextPath}/storeReserve.do'>
                <div>예약확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeRefund.do'> 
                <div>환불확인️</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>정보보기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage2.do'><div>수정하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage3.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
                <div class="member_update">
	            <div>정보수정</div>
	            <hr>
	            <form id ="updateform" method="post">
	            <div class="join_main">
            	<input type="hidden" id ="email" name ="storeemail" value ="${storeid}">

                <div class="update_sub"><input class="join_text" type="password" id="pass1" name="storepw" placeholder="PASSWORD"></div>
                <div class="update_sub"><input class="join_text" type="password" id="pass2" placeholder="PASSWORD"></div>
                <div class="update_sub"><input class="join_text" type="text" id="name" name="storename" placeholder="가게이름" value ="${store.storename}"}></div>
                <div class="update_sub"><input class="join_text" type="text" id="tel" name="storetel" placeholder="PHONE NUMBER" value ="${store.storetel}"></div>
                <div class="update_sub2">
                    <input type="text" name = "storepostcode" id="sample6_postcode" placeholder="우편번호" value ="${store.storepostcode}">
                    <input type="button"  onclick="sample6_execDaumPostcode()" value="우편번호">
                </div>
                <div class="update_sub">
                <input class="join_text" type="text" name ="storeaddress1" id="sample6_address" placeholder="주소" value ="${store.storeaddress1}">
                </div>
                <div class="update_sub">
                    <input type="text" name ="storeaddress2" id="sample6_detailAddress" placeholder="상세주소" value ="${store.storeaddress2}">
                 </div>
                 <div class="update_sub">   
                    <input type="text" name ="storeaddress3" id="sample6_extraAddress" placeholder="참고항목" value ="${store.storeaddress3}">
                </div>

                <div class="update_sub">
                    <input type="button" onclick = "return checkForm()" value="UPDATE">
                    <input type="button" onclick = "history.back()" value="CANCLE">
                </div>
            </div>
        	</form>
    			</div>
            </div>
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

    function checkForm(){
    	var check = document.getElementById("checkemail"); 
		var password = $("#pass1").val();
		var pwdcheck = $("#pass2").val();
		var name = $("#name").val();
		var tel = $("#tel").val();
		var postcode = $("#sample6_postcode").val();
		var address = $("#sample6_address").val();
		var detailadd = $("#sample6_detailAddress").val();
		
		//정규표현식
		//비밀번호
	    var reg2 = /(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,20}$/; // 6~20문자 영대소문자, 숫자 혼합
	    //이름
	    var reg3 = /^[가-힣]{2,5}$/;
	    //전화번호
	    var reg4 = /^01(?:0|1|[6-9])[-]?(\d{3}|\d{4})[-]?(\d{4})$/; // 010-(3자리 또는 4자리 0부터 9까지)-(4자리 0부터 9까지)
	    //우편번호
	    var reg5 = /^[가-힣a-zA-Z0-9~!@#$%^&*()_+-]{4,40}$/; // 상세주소
	    
	    // 비밀번호 확인
	    var result2 = reg2.test(password);
	    if (password != pwdcheck){ // 비밀번호와 비밀번호확인란의 입력값이 같은지 확인
	    	alert("비밀번호가 서로다릅니다.");
	    	return false;
	    }else if(password == ""){
	    	alert("비밀번호를 입력해주세요.");
	    	$("#pass1").focus();
	    	return false;
	    }else if(pwdcheck == ""){
	    	alert("비밀번호를 확인해주세요.");
	    	$("#pass2").focus();
	    	return false;
	    }else if(result2 != true){
	    	alert(password);
	    	alert(pwdcheck);
	    	alert("비밀번호를 정확하게 입력해주세요.(6~20자 영어대소문자,숫자 혼합)");
	    	$("#pass1").val("");
	    	$("#pass2").val("");
	    	return false;
	    }
	    
	    // 이름 확인
	    var result3 = reg3.test(name);
	    if(name == ""){
	    	alert("이름을 입력해주세요.");
	    	$("#name").focus();
	    	return false;
	    } else if(result3 != true){
	    	alert("이름을 정확하게 입력해주세요");
	    	$("#name").focus();
	    	$("#name").val("");
	    	return false;
	    }
	    
	    // 전화번호 확인
	    var result4 = reg4.test(tel);
	    if(tel == ""){
	    	alert("전화번호를 입력해주세요.");
	    	$("#tel").focus();
	    	return false;
	    } else if(result4 != true){
	    	alert("전화번호를 정확하게 입력해주세요.");
	    	$("#tel").focus();
	    	$("#tel").val("");
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
	    
    	updateCheck();
    	
    	return true;
    }
    
    function updateCheck(){
    	var form = $("#updateform").serialize();
   		$.ajax('${pageContext.request.contextPath}/storeUpdateAction.do',{
   			type:"post",
   			data:form,
   			success:function(data){
   				if(data == 1){
   					alert("회원수정완료.");
   					location.href="${pageContext.request.contextPath}/main.do"
   				}else{
   					alert("회원수정실패.");
   				}
   			}, error:function(data){
   				alert("에러가 발생했습니다.");
   			}
   		});
    }
</script>
</body>
</html>

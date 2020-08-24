<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function submitRadio(){
		alert("소중한 평가 감사합니다.");
		$("#button").hide();
	}
</script>
<body>
	<div style="border:1px solid black;">
	   	<div id ="title">답변에 만족하셨나요? 만족도 자료는 보다 정확한 자동답변 자료를 위해 소중히 사용하겠습니다.</div>
	   	<br>
	   	<div>
	   		<input type="radio" name ="ok">매우만족
	   		<input type="radio" name ="ok">만족
	   		<input type="radio" name ="ok" checked>보통
	   		<input type="radio" name ="ok">불만족
	   		<input type="radio" name ="ok">매우불만족<br><br>
	   		<button onclick="submitRadio()" id ="button">제출하기</button>
	   	</div>
	   	<br>
   	</div>
</body>
</html>
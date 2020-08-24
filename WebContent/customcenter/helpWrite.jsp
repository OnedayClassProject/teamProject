<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	function submit(){
		
	}
</script>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">문의하기</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/helpPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu3"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<form id ="form" method ="post">
        		제목 <input type="text" name ="title" style="width: 650px; height: 30px;"><br><br>
        		내용 <br><textarea rows="30" cols="100" name="content"></textarea><br>
        		<button onclick ="submit()">제출하기</button>
        	</form>
        </div>
    </div>
</section>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/customcenter/help.css">
</head>
<script type="text/javascript">
	function checkID(id, num){
		$.ajax('${pageContext.request.contextPath}/checkWriter.do',{
			type:"post",
			data : { check : id},
			success:function(data){
				if(data == 1){
					location.href="${pageContext.request.contextPath}/helpPage.do?num="+num;
				}else{
					alert("작성자가 아닙니다.");
				}
			}, error:function(e){
				alert(e);
			}
		});
	}
</script>
<body>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">문의하기</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/helpMainPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu3"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<div><h2>문의하기</h2></div>
        	<div>
        		<table border = "1px solid">
        			<tr>
        				<th>No</th><th>제목</th><th>작성자</th><th>날짜</th>
        			</tr>
        			<c:forEach var = "list" items="${requestScope.list }">
        				<tr>
        				
        					<td>${list.num }</td><td><a href="javascript:void(0);" onclick="checkID('${list.writer}','${list.num }'); return false;">${list.title }</a></td><td>${list.writer }</td><td>${list.date }</td>
        				</tr>
        			</c:forEach>
        		</table>
        		<br>
        		<button onclick="location.href='${pageContext.request.contextPath}/helpWrite.do'">글쓰기</button>
        	</div>
        </div>
    </div>
</section>
</body>
</html>
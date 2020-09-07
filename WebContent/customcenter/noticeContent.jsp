<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/customcenter/help.css">
</head>
<body>
<script type="text/javascript">
	function deletePage(num,pageNum){
		if (confirm("삭제하시겠습니까?")) {
			$.ajax('${pageContext.request.contextPath}/noticeDelete.do',{
				type:"post",
				data: {number : num},
				success:function(data){
					if(data==1){
						alert("삭제했습니다.");
						location.href="${pageContext.request.contextPath}/noticeMainPage.do?pageNum="+pageNum;
					}else{
						alert("오류가 발생했습니다.");
					}
				},
				error:function(e){
					alert("에러가 발생했습니다.");
				}
			});
        }
	}
</script>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<jsp:include page="../header.jsp"/>
<section>
<div class="pic"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">문의하기</div>
           <div class="line"></div>
           <div class="side_detail">
               <a href="${pageContext.request.contextPath}/noticeMainPage.do"class="current_menu2"><div>공지사항</div></a>
            </div>
            <hr>
                <a href="${pageContext.request.contextPath}/helpMainPage.do" class="current_menu2"><div>문의하기</div></a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu3"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
       		<p><h2>${bean.title}</h2><br><hr>
       		<p><h2>내용</h2><br>${bean.content}<br><hr>
       		<button type="button" onclick ="location.href='${pageContext.request.contextPath}/noticeMainPage.do?pageNum=${pageNum}'">목록으로</button>
       		<c:if test="${sessionScope.userid == 'admin' }">
       			<button type="button" onclick ="location.href='${pageContext.request.contextPath}/noticeUpdate.do?num=${bean.num}&pageNum=${pageNum}'">수정하기</button>
       			<button type="button" onclick ="deletePage('${bean.num}','${pageNum}')">삭제하기</button><br><br>
       		</c:if>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/customcenter/help.css">
</head>
<script type="text/javascript">
	function checkID(id, num, pageNum){
		$.ajax('${pageContext.request.contextPath}/checkWriter.do',{
			type:"post",
			data : { check : id},
			success:function(data){
				if(data == 1){
					location.href="${pageContext.request.contextPath}/helpPage.do?num="+num +"&pageNum="+pageNum;
				}else{
					alert("작성자가 아닙니다.");
				}
			}, error:function(e){
				alert(e);
			}
		});
	}
	function checkSession(){
		$.ajax('${pageContext.request.contextPath}/checkSession.do',{
			type:"post",
			success:function(data){
				if(data == 1){
					location.href='${pageContext.request.contextPath}/helpWrite.do';
				}else{
					alert("로그인 해주세요");
					location.href='${pageContext.request.contextPath}/login.do';
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
               <a href="${pageContext.request.contextPath}/faqMainPage.do"class="current_menu2"><div>FAQ</div></a>
            </div>
            <hr>
        </div>
        <div class="my_main">
        	<div><h2>문의하기</h2></div>
        	<div>
        			<div class="help_subject">
        				<div>No</div>
        				<div>제목</div>
        				<div>작성자</div>
        				<div>날짜</div>
        			</div>
        	
        			<c:if test="${count != 0}">
	        			<c:forEach var = "list" items="${requestScope.list }">
	        				<div class="help_board">
	        					<div>${list.num }</div>
	        					<div><a href="javascript:void(0);" onclick="checkID('${list.writer}','${list.num }','${pageNum }'); return false;">${list.title }</a></div>
	        					<div>${list.writer }</div>
	        					<c:set var ="date" value = "${list.date }"></c:set>
	        					<div>${fn:substring(date,0,10) }</div>
	        				</div>
	        			</c:forEach>
        			</c:if>
        			<c:if test="${count == 0 }">
	        		<div class="nolist">목록이 없습니다.</div>
	        	</c:if>
        			<div class="write_button">
        		<button onclick="checkSession()">글쓰기</button>
        		</div>
        	</div>
        	<div>
	        	<c:if test="${count!=0}">
	        		<c:if test="${startPage > pageBlock}">
	        			<a href="${pageContext.request.contextPath}/helpMainPage.do?pageNum=${startPage - pageBlock}">Prev</a>
	        		</c:if>
	       			<c:forEach var= "i" begin="${startPage }" end="${endPage}">
	       				<a href="${pageContext.request.contextPath}/helpMainPage.do?pageNum=${i}">${i}</a>
	       			</c:forEach>
	        		<c:if test="${endPage < pageCount }">
	        			<a href="${pageContext.request.contextPath}/helpMainPage.do?pageNum=${startPage+pageBlock}">Next</a>
	        		</c:if>
	        	</c:if>
        	</div>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp"/>
</body>
</html>
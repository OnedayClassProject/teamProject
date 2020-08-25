<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
	function submitForm(){
		var title = $("#title").val();
		var content = $("#content").val();
		if(title==""){
			alert("제목을 입력해주세요");
			$("#title").focus();
			return false;
		}else if(content==""){
			alert("내용을 입력해주세요");
			$("#content").focus();
			return false;
		}else{
			writeAction();
		}
		return true;
	}
    function writeAction(){
    	var form = $("#form").serialize();
   		$.ajax('${pageContext.request.contextPath}/helpUpdateAction.do',{
   			type:"post",
   			data:form,
   			success:function(data){
   				if(data == 1){
   					alert("수정하셨습니다.");
   					location.href="${pageContext.request.contextPath}/helpMainPage.do";
   				}else{
   					alert("수정 실패.");
   				}
   			}, error:function(data){
   				alert("에러가 발생했습니다.");
   			}
   		});
    }
</script>
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
        	<form id ="form" method ="post">
        		<input type="hidden" name = "num" value = "${bean.num}">
        		제목 <input type="text" id ="title" name ="title" style="width: 650px; height: 30px;" value = "${bean.title }"><br><br>
        		내용 <br><textarea rows="30" cols="100" id="content" name="content">${bean.content }</textarea><br><br>
        		<button onclick ="return submitForm()">제출하기</button>
        	</form>
        </div>
    </div>
</section>
</body>
</html>

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

<section>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">공지사항</div>
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
        <div>공지글쓰기</div><br>
        	<form id ="form" method ="post">
        		<c:choose>
        			<c:when test="${bean.header == 1 }">
						공지<input type="checkbox" id = "header" name ="header" checked><br>
        			</c:when>
        			<c:when test="${bean.header == 0 }">
						공지<input type="checkbox" id = "header" name ="header"><br>
        			</c:when>
        		</c:choose>
        		제목 <input type="text" id ="title" name ="title" style="width: 650px; height: 30px;" value="${bean.title}"><br><br>
        		내용 <br><textarea rows="30" cols="100" id="content" name="content">${bean.content }</textarea><br><br>
        		<button type="button" onclick ="submitForm('${bean.num}','${pageNum }')">수정하기</button>
        	</form>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp" />
<script type="text/javascript">
	function submitForm(num,pageNum){
		var title = $("#title").val();
		var content = $("#content").val();
		if(title==""){
			alert("제목을 입력해주세요");
			$("#title").focus();
			return;
		}else if(content==""){
			alert("내용을 입력해주세요");
			$("#content").focus();
			return;
		}else{
			writeAction(num,pageNum);
		}
	}
    function writeAction(_num,pageNum){
    	var _title = $("#title").val();
		var _content = $("#content").val();
		var _header = document.getElementById("header");
		if(_header.checked == false){
			_header.value = "0";
		}else{
			_header.value = "1";
		}
   		$.ajax('${pageContext.request.contextPath}/noticeUpdateAction.do',{
   			type:"post",
   			data:{title:_title, content: _content, header:_header.value, num:_num},
   			dataType:"text",
   			success:function(data,status){
   				 if(data == 1){
   					 alert("수정 완료");
   					location.href="${pageContext.request.contextPath}/noticePage.do?num="+_num +"&pageNum="+pageNum;
   				}else{
   					alert("수정 실패.");
   				} 
   			}, error:function(data){
   				alert("에러가 발생했습니다.");
   			}
   		});
    }
</script>
</body>
</html>

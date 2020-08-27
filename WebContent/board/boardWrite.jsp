<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/15
  Time: 11:31 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/board/boardWrite.css">
    <script>
        var sel_file;
        $(document).ready(function () {
            $("#input_img").on("change", handleImgFileSelect);
            
            $("#review_create").on("click",function(){
            	var productContent = CKEDITOR.instances["p_content"].getData();
                
            	var content = $('#p_content').val(productContent);
            	if(content == ""){
            		alert("후기 내용을 작성하세요");
            	}else if($("#rating").val() == ""){
            		alert("평점을 입력해주세요");
            	} else{
            	var form = $("form")[0];
            	var form1 = new FormData(form);
            	$.ajax({
            		type : "post",
            		url : "${pageContext.request.contextPath}/reviewWrite.do",
            		processData : false,
            		contentType : false,
            		data : form1,
            		dataType : "text",
            		success : function(data,status){
            			console.log(data);
            			if(data != 0){
            				alert("후기 등록 성공");
            			}else{
            				alert("후기 등록 실패했습니다.");
            			}
            		},
            		error : function(data,status){
            			alert("에러가 발생했습니다.");
            		}
            	});
            	}
            })
            
        });

        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function (f) {
                if (!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
                sel_file = f;
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
        function fileCheck(obj) {
            var file_kind = obj.value().lastIndexOf('.');
            var file_name = obj.value().substring(file_kind + 1, obj.length);
            var file_type = file_name.toLowerCase();

            var check_file_type = new Array();
            check_file_type = ['jpg', 'gif', 'png', 'jpeg'];
            if (check_file_type.indexOf(file_type) == -1) {
                alert('이미지 파일만 선택 할 수 있습니다.');
                var parent_Obj = obj.parentNode;
                var node = parent_Obj.replaceChild(obj.cloneNode(true).obj);
                return false;
            }
        }
        $(function(){
        	
	        $(".starRev input").on("click",function(){
	        	var star = $(this).val();
	        	  $(this).parent().children("input").removeClass("on");
	        	  $(this).addClass("on").prevAll("input").addClass("on");
	        	  $(".st").empty();
	        	  $(".st").append("<input type='text' name='rating' value='"+star+"' >");
	        	  
	        	  return false;
	       })
	      
	       
       }) 
        
    </script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <form method="post" enctype="multipart/form-data">
    <div class="review">
        <div>후기등록</div>
        <!-- 클래스 등록번호 -->
        <input type="hidden" name="class_regisitrynum" value="1"> 
        <!-- 업체 번호 -->
        <input type="hidden" name="storenum" value="1">
        
        <div>업체이름 <input type="hidden" name="company_name" value="가죽공방"></div>
        <div>클래스명 <input type="hidden" name="class_name" value="가죽지갑만들기"></div>
        <div>회원이메일
        	<div>${sessionScope.userid }</div>
        </div>
        <div>수업참가날짜<input type="hidden" name="reservation_date" value="2020.10.01"></div>
        <div class = "starRev">
        	<input class="staR" value="1">
        	<input class="staR" value="2">
        	<input class="staR" value="3">
        	<input class="staR" value="4">
        	<input class="staR" value="5">
			<div class="st"><input type='text' name='rating' id="rating"></div>
        </div>
        <div>후기</div>
        <textarea id="p_content" name="content"></textarea>
        <div>대표이미지</div>
        <div class="file_box">
            <label for="input_img">IMAGE FILE</label>
            <input type="file" accept="image/jpg,image/jpeg,image/png,image/gif," name="image" id="input_img"
                   onchange="fileCheck(this)">
        </div>
        <div class="imgMain">
            <img id="img"/>
        </div>
        <button type="button" id ="review_create">등록</button>
        <button type="button">취소</button>
    </div>
    </form>
</section>
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script>
    $(function () {
        CKEDITOR.replace( 'p_content', {
            height: 350,
            removePlugins: 'resize',
        filebrowserBrowseUrl : '${pageContext.request.contextPath}/ckfinder/ckfinder.html',
    	filebrowserFlashBrowseUrl : "${pageContext.request.contextPath}/ckfinder/ckfinder.html?type=Flash",
    	filebrowserUploadUrl : "${pageContext.request.contextPath}/ckfinder/core/connector/java/connctor.java?command=QuickUpload&type=Files",
    	filebrowserImageUploadUrl : "${pageContext.request.contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images",
    	filebrowserFlashUploadUrl : "${pageContext.request.contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash"
        });
    });
</script>
</body>
</html>

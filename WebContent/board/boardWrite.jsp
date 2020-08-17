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
    </script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <form>
    <div class="review">
        <div>후기등록</div>
        <div>업체이름</div>
        <div>클래스명</div>
        <div>회원이메일</div>
        <div>수업참가날짜</div>
        <div><input type="text" name="rating">/5</div>
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
        <button type="submit">등록</button>
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storejoin.css">
</head>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<body>

<jsp:include page="../header.jsp"/>
<section>
    <div class="member_join">
        <form id = "joinform" method="post">
            <div>정보보기</div>
            <hr>
            <div class="join_main">
                <table border = "1px solid">
                	<tr>
	                	<td>이메일 : ${bean.storeemail}</td>
                	</tr>
                	<tr>
                		<td>업체 이름 : ${bean.storename }</td>
                	</tr>
                	<tr>
                		<td>연락처 : ${bean.storetel }</td>
                	</tr>
                	<tr>
                		<td>우편번호 : ${bean.storepostcode }</td>
                	</tr>
                	<tr>
						<td>주소 : ${bean.storeaddress1 }&nbsp;${bean.storeaddress2 }&nbsp;${bean.storeaddress3 }</td>
                	</tr>
                </table>
                <div class="join_text4">
                    <input type="button" onclick = "location.href = '${pageContext.request.contextPath}/storeUpdate.do'" value="GO UPDATE">
                    <input type="button" onclick = "location.href = '${pageContext.request.contextPath}/storeDelete.do'" value="GO DELETE">
                </div>
            </div>
        </form>
    </div>
</section>
</body>
</html>

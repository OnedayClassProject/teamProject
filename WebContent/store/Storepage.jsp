<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/21
  Time: 11:34 오전
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/storepage.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
    <div class="my_wrap">
        <div class="side_menu">
            <div class="side_detail">
              <a href='${pageContext.request.contextPath}/storeReserve.do'>
                <div>예약확인</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeRefund.do'> 
                <div>환불확인️</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                <a href='${pageContext.request.contextPath}/storeCheckInfoPage.do'><div>정보보기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage2.do'><div>수정하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeCheckInfoPage3.do'><div>탈퇴하기</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
                 <a href='${pageContext.request.contextPath}/storeMyClassInfo.do'><div>내가 등록한 클래스</div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
                <div class="my_subject">MY PAGE</div>
                <div class="my_main2">
                    <div class="my_main3">
                        <div>좋아요❤️</div>
                        <div>0</div>
                    </div>
                    <div class="my_main3">
                        <div>등급</div>
                        <div>0</div>
                    </div>
                    <div class="my_main3">
                        <div>예약</div>
                        <div>0</div>
                    </div>
                    <div class="my_main3">
                        <div>환불</div>
                        <div>0</div>
                    </div>
                </div>
                <hr>
                <div class="reserve_list">
                    STORE 예약
                </div>
                <div class="reserve_list2">
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="move_reserveList">
                    <div>더보기</div>
                    </div>
                </div>
                <hr>
                <div class="reserve_list">
                    STORE 환불
                </div>
                <div class="reserve_list2">
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="move_reserveList">
                        <div>더보기</div>
                    </div>
                </div>
                <hr>
                <div class="reserve_list">
                    STORE 좋아요
                </div>
                <div class="reserve_list2">
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="best-class">
                        <div class="thumbnail">사진</div>
                        <div class="class-name">
                            <div class="class-name1">카테고리 난이도</div>
                            <div class="class-name2">클래스명</div>
                            <div class="class-name3">업체명</div>
                        </div>
                    </div>
                    <div class="move_reserveList">
                        <div>더보기</div>
                    </div>
                </div>
            </div>
        </div>
</section>
<jsp:include page="../footer.jsp" />
</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/17
  Time: 11:36 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <link rel="stylesheet" href="../header.css">
    <link rel="stylesheet" href="classCreate.css">
    <script>
        var sel_file;
        $(document).ready(function () {
            $("#input_img").on("change", handleImgFileSelect);

            $(".sale").on("click", function () {
                $(".sale1").append("<input type='text'>%");
            });
            $("#calander_backcolor").on("click", function () {
                $("#box").css("display", "none");
                $("#calander_backcolor").css("display", "none");
            })
            $('.reserve').on("click", function () {
                $("#box").css("display","block");
                $("#calander_backcolor").css("display","block");
            });
            $('.send').on('click', function () {
            	var date  = $("#current-year-month").text();
            	var day = $("#dateInput").text().substring(8);
            	var start = []
            	var end = []
				 for(var i=0; i < $('.time_start').length; i++){
					start[i] = $('.time_start').eq(i).val();
					end[i] = $('.time_end').eq(i).val();
				} 
				console.log(start);
				console.log(end);
				console.log(date);
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/timeSave.do",
					data : { "start" : start, "end" : end,"date":date , "day" : day},
					dataType: "text",
					traditional : true,
					success:function(data, status){
						if(data == 1){
							alert('저장성공');
						} else {
						 	alert('저장실패');
						}
					}
				});
			});
            
            
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
<div id="calander_backcolor"></div>
<jsp:include page="/header.jsp"/>
<div>
    <div>
        <div>클래스명</div>
        <div><input type="text"></div>
        <div>카테고리</div>
        <div><input type="text"></div>
        <div>업체명</div>
        <div>업체위치</div>
        <div>
            <select name="level">
                <option value="hard">상</option>
                <option value="nomal">중</option>
                <option value="easy">하</option>
            </select>
        </div>
        <div>소요시간</div>
        <div><input type="text">시간 <input type="text">분</div>
        <div>수업인원</div>
        <div><input type="text">명</div>
        <div>가격</div>
        <div><input type="text">원</div>
        <div>할인여부</div>
        <div class="sale">적용</div>
        <div class="">안함</div>
        <div class="sale1"></div>
        <div class="reserve">일정</div>
        <div>주차장여부</div>
        <div><input type="text"></div>
        <textarea id="p_content"></textarea>
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
    <div id="box">
        <div class="content-right">
            <table id="calendar">
                <thead>
                <tr class="btn-wrap clearfix">
                    <td>
                        <label id="prev">
                            &#60;
                        </label>
                    </td>
                    <td align="center" id="current-year-month" colspan="5"></td>
                    <td>
                        <label id="next">
                            &#62;
                        </label>
                    </td>
                </tr>
                <tr>
                    <div class="main">
                        <td class="sun" align="center">Sun</td>
                        <td align="center">Mon</td>
                        <td align="center">Tue</td>
                        <td align="center">Wed</td>
                        <td align="center">Thu</td>
                        <td align="center">Fri</td>
                        <td class="sat" align="center">Sat</td>
                </tr>
                </thead>
                <tbody id="calendar-body" class="calendar-body"></tbody>
            </table>
        </div>
        <div class="time">
            <div class="time_main">
                <div id="dateInput"></div>
                <div class="sub_plus">
                    <div id="plus">+</div>
                    <div id="sub">-</div>
                </div>
            </div>
            <div class="timesetting"></div>
        </div>
        <div class="store">
            <div class="send">저장</div>
            <div>닫기</div>
        </div>
    </div>
</div>
</section>
<script src="/ckeditor/ckeditor.js"></script>
<script>
    $(function () {
        CKEDITOR.replace('p_content', {
            height: 350,
            removePlugins: 'resize'
        });
    })
    var currentTitle = document.getElementById('current-year-month');
    var calendarBody = document.getElementById('calendar-body');
    var today = new Date();
    var first = new Date(today.getFullYear(), today.getMonth(), 1);
    var dayList = ['Sunday', 'Monday', 'Tuesday', 'Wednesday',
        'Thursday', 'Friday', 'Saturday'];
    var monthList = ['January', 'February', 'March', 'April', 'May',
        'June', 'July', 'August', 'September', 'October',
        'November', 'December'];
    var leapYear = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var notLeapYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    var pageFirst = first;
    var pageYear;
    if (first.getFullYear() % 4 === 0) {
        pageYear = leapYear;
    } else {
        pageYear = notLeapYear;
    }

    /* 달력을 보여주는 작업 */
    function showCalendar() {
        var current_year_month = document
            .getElementById('current-year-month');
        current_year_month.innerText = first.getFullYear()
            + "-"
            + (first.getMonth() + 1 > 9 ? first.getMonth() + 1
                : "0" + (first.getMonth() + 1));

        let monthCnt = 100;
        let cnt = 1;
        for (var i = 0; i < 6; i++) {
            var $tr = document.createElement('tr');
            $tr.setAttribute('id', monthCnt);
            for (var j = 0; j < 7; j++) {
                if ((i === 0 && j < first.getDay())
                    || cnt > pageYear[first.getMonth()]) {
                    var $td = document.createElement('td');
                    $tr.appendChild($td);
                } else {
                    var $td = document.createElement('td');
                    $td.textContent = cnt;
                    $td.setAttribute('id', cnt);
                    var yyyy = first.getFullYear();
                    var MM = first.getMonth() + 1;
                    MM = MM < 10 ? "0" + MM : MM;
                    var dd = cnt;
                    dd = dd < 10 ? "0" + dd : dd;
                    $td.setAttribute('value', yyyy + "-" + MM + "-" + dd);
                    $td.setAttribute("class", 'abled_td');
                    /* $td.setAttribute('value', first.getFullYear() + "-"
                            + ((first.getMonth() + 1)<10?"0"+(first.getMonth() + 1):(first.getMonth() + 1)) + "-" + cnt <10?"0"+cnt:cnt); */

                    $td.onclick = function () {
                        if (new Date(this.getAttribute("value") + " 23:59:59") < new Date()) {
                            alert("이전 날짜로 예약 할 수 없습니다.");
                            return;
                        }
                        document.getElementById("dateInput").textContent = this.getAttribute("value");
                        document.getElementById("sub").style.display = "inline-block";
                        document.getElementById("plus").style.display = "inline-block";

                        var tds = document.querySelectorAll('.abled_td');
                        for (var i = 0; i < tds.length; i++) {
                            tds[i].setAttribute("class", "abled_td");
                        }
                        this.setAttribute("class", "abled_td clicked_td");
                    };
                    $tr.appendChild($td);
                    cnt++;
                    // console.log($td.getAttribute('value'));
                }
            }
            monthCnt++;
            calendarBody.appendChild($tr);
        }
    }

    showCalendar();

    /* 화면에있던 기존의 달력을 지우는 작업 */
    function removeCalendar() {
        let
            catchTr = 100;
        for (var i = 100; i < 106; i++) {
            var $tr = document.getElementById(catchTr);
            $tr.remove();
            catchTr++;
        }
    }

    /* > 버튼 클릭시 */
    var nextBtn = document.getElementById("next");
    nextBtn.addEventListener("click", function () {
        removeCalendar();
        first = new Date(today.getFullYear(), today.getMonth() + 1, 1);
        showCalendar();
        today = new Date(today.getFullYear(), today.getMonth() + 1, 1);
        x()
    });

    /* < 버튼 클릭시 */
    var prevBtn = document.getElementById("prev");
    prevBtn.addEventListener("click", function () {
        removeCalendar();
        first = new Date(today.getFullYear(), today.getMonth() - 1, 1);
        showCalendar();
        today = new Date(today.getFullYear(), today.getMonth() - 1, 1);
        x()
    })
    var plus = document.getElementById("plus");
    plus.onclick = function () {
        if ($(".timeSet").length <= 5) {
            $(".timesetting").append("<div class='timeSet'><input type=\"text\" class='time_start'> ~ <input type=\"text\" class='time_end'></div>");
            $(".time_start").flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });
            $(".time_end").flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });
        }
    }
    $("#sub").on("click", function () {
        if ($(".timeSet").eq(0).length == 0) {
            alert("추가해주세요~");
            return;
        }
        $(".timeSet").last().remove();
    })
    x();

    function x() {
        console.log($(".abled_td").length);
        console.log($("#current-year-month").text());
        // $.ajax({
        //     type:"post",
        //     url:"",
        //     dataType:{},
        //     success:function (data, status) {
        //         for(var i=0; i < $(".abled_td").length; i++){
        //             if(data[i] == $(".abled_td").eq(i).text()){
        //                 $(".abled_td").eq(i).css("background", "red");
        //             }
        //         }
        //     }
        // })
        // for(var i = 0; i < $(".abled_td").length; i++){
        //     console.log($(".abled_td").eq(i).text());
        // }
    }
</script>
</body>
</html>

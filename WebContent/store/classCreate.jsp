<%--
  Created by IntelliJ IDEA.
  User: gyu
  Date: 2020/08/17
  Time: 11:36 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.1.0.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/store/classCreate.css">
    <script>
        var sel_file;
        $(document).ready(function () {
            $("#input_img").on("change", handleImgFileSelect);

            $(".sale").on("click", function () {
            	$(".sale1").empty();
                $(".sale1").append("<input type='text' name='sale' id='input_sale'>%");
                $("#sale_check").val("true");
            });
            $(".cal_close").on("click", function () {
            	var num = $('.class_registryNum2').val();
            	if(confirm("저장된 내용은 전부 삭제됩니다. 닫으시겠습니까?") == true){
                $("#box").css("display", "none");
                $("#calander_backcolor").css("display", "none");
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/allCancle.do",
                    data: {num :  num},
                    dataType: "text",
                    success:function(data, status){
							  if(data == 1){  
                   	 			alert('삭제성공^^');
                   	 			location.href='${pageContext.request.contextPath}/main.do';
		                     	} else {
		                     	location.href='${pageContext.request.contextPath}/main.do';
		                    	}
                    		},
                    error:function(data,status){
                   	 alert("에러");
                    }
                    	});
                
            	}
            });
            $('.reserve').on("click", function () {
                $("#box").css("display","block");
                $("#calander_backcolor").css("display","block");
            });
            $('.send').on('click', function () {
            	
            	var personal  = $('#class_personal').val();
            	var date  = $("#current-year-month").text();
            	var day = $("#dateInput").text().substring(8);
            	var num = $('.class_registryNum2').val();
            	var start = []
            	var end = []
				 for(var i=0; i < $('.timeStart').length; i++){
					start[i] = $('.timeStart').eq(i).val();
					end[i] = $('.timeend').eq(i).val();
				} 
				console.log(personal);
				$.ajax({
					type : "POST",
					url : "${pageContext.request.contextPath}/timeSave.do",
					data : {	"personal":personal, "start" : start, "end" : end,"date":date , "day" : day, "num" : num},
					dataType: "text",
					traditional : true,
					success:function(data, status){
						if(data == 1){
							alert('저장성공');
							$('.timeStart').attr("disabled",true);
							$('.timeend').attr("disabled",true);
							x();
						} else {
						 	alert('저장실패');
						}
					},
					error:function(data, status){
						alert('error');
					}
				});
			});
            
            $(".nosale").on("click", function () {
            	$("#sale_check").val("fal");
            	$(".sale1").empty();
			});
            $("#class_registry").on('click', function () {
            	 var productContent = CKEDITOR.instances["p_content"].getData();
                 $('#p_content').val(productContent);
            	var reg1 = /^[0-9]{1,3}$/;
            	var reg2 = /^[0-9]{1,7}$/;
            	
            	var result = reg1.test($("#hour").val())
            	var result1 = reg1.test($("#minute").val())
            	var result2 = reg1.test($("#class_personal").val())
            	var result3 = reg2.test($("#price").val())
          		var result4 = reg1.test($("#input_sale").val())
            	if($("#classname").val().trim() == ""){
            		alert("클래스명 입력해주세요.");
            		return;
            	}  else if($("#hour").val().trim() == ""){
            		alert("시간을 입력해주세요.");
            		return;
            	} else if($("#minute").val().trim() == ""){
            		alert("분을 입력해주세요.");
            		return;
            	} else if(result != true){
            		alert("시간 : 숫자만 입력해주세요.");
            		return;
            	} else if(result1 != true){
            		alert("분  : 숫자만 입력해주세요.");
            		return;
            	} else if($("#class_personal").val().trim() == ""){
            		alert("인원수를 입력해주세요.");
            		return;
            	} else if(result2 != true){
            		alert("인원수 : 숫자만 입력해주세요.");
            		return;
            	} else if($("#price").val().trim() == ""){
            		alert("가격을 입력해주세요.");
            		return;
            	} else if(result3 != true){
            		alert("가격 : 숫자만 입력해주세요.");
            		return;
            	} else if($("#sale_check").val() == "true"){
            		if($("#input_sale").val().trim() == ""){
            			alert("할인창에 입력해주세요.");
            			return;
            		} else if(result4 != true){
            			alert("할인 : 숫자만 입력해주세요.");
            			return;
            		}
            	} else if($('#p_content').val().trim() == ""){
            		alert("내용을 입력해주세요");
            		return;
            	} else  if ($("#input_img").val() == '') {
                    alert("이미지파일을 선택해주세요.")
                    return;
                } else {
            	 var form = $("form")[0];
                 var form1 = new FormData(form);
                 $.ajax({
                     type: "post",
                     url: "${pageContext.request.contextPath}/classRegistry.do",
                     processData: false,
                     contentType: false,
                     data: form1,
                     dataType: "text",
                     success:function(data, status){
							                   	 	
                    	 var res1 = JSON.parse(data);
                    	 var res2 = res1.data;
                    	 console.log(res2[0].result)
							  if(res2[0].result == 1){  
                    	 		alert("운영시간을 등록해주세요!!!!");
                    	 		 $("#box").css("display","block");
                                 $("#calander_backcolor").css("display","block");
                                 $(".class_registryNum").append("<input type='hidden' class='class_registryNum2' value='"+res2[0].num+"'>");
		                     	} else {
		                     	alert('실패!!!!ㅜㅜㅜㅜㅜㅜㅜ');
		                    	}
                     	},
                     	error:function(data,status){
                    		 alert("에러");
                     	}
                     	
                     });
                	  
                }
            
        	});
            $("#cancle_back").on("click", function () {
				
            	var num = $('.class_registryNum2').val();
            	if(confirm("취소하시면 기록이 사라집니다.취소하시겠습니까?") == true){
            	$.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/classCancle.do",
                    data: {num :  num},
                    dataType: "text",
                    success:function(data, status){
							  if(data == 1){  
								               	 
                   	 			alert('삭제성공^^');
                   	 			location.href='${pageContext.request.contextPath}/main.do';
		                     	} else {
		                     	location.href='${pageContext.request.contextPath}/main.do';
		                    	}
                    		},
                    error:function(data,status){
                   	 alert("에러");
                    }
                    	});
            	} 
			});
            
    		$('.main').on('click', function(){
    			
				location.href='${pageContext.request.contextPath}/storeMyClassInfo.do';    			
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
<c:if test="${empty sessionScope.storeid }">
<script type="text/javascript">
	alert("로그인해주세요!!");
    location.href="${pageContext.request.contextPath}/login.do";
</script>
</c:if>
<section>
<form method="post" enctype="multipart/form-data">
<div class="class_wrap">
		<div>클래스 개설</div>
    	<div class="class_menu">
	        <div class="class_title" >클래스명</div>
	        <div><input type="text" name="classname" id="classname"></div>
	    </div>
	    <div class="class_menu">
	        <div class="class_title"  >카테고리</div>
	        <div>
	        	<select name="category" >
	        		<option value="디퓨저">디퓨저</option>
	        		<option value="캔들">캔들</option>
	        		<option value="요리">요리</option>
	        		<option value="베이킹">베이킹</option>
	        		<option value="도자기">도자기</option>
	        		<option value="향수">향수</option>
	        		<option value="비누">비누</option>
	        	</select>
	        </div>
	    </div>
	    <div class="class_menu">
	        <div class="class_title" >업체명</div>
	        <div>${sbean.storename }</div>
	        <input type="hidden" name="class_company" value="${sbean.storename }">
	   </div>
	   <div class="class_menu">
        <div  class="class_title"  >업체위치</div>
        <div>${sbean.storeaddress1 } ${sbean.storeaddress2} ${sbean.storeaddress3}</div>
        <input type="hidden" name="location" value="${sbean.storeaddress1 }">
        </div>
        <div class="class_menu">
        <div  class="class_title"  >난이도</div>
        <div>
            <select name="level">
                <option value="hard">상</option>
                <option value="nomal">중</option>
                <option value="easy">하</option>
            </select>
        </div>
        </div>
        <div class="class_menu">
        <div class="class_title"  >소요시간</div>
        <div><input type="text" name="hour" id="hour" class="class_input">시간 <input type="text" class="class_input" name="minute" id="minute">분</div> 
        </div>
        <div class="class_menu">
        <div class="class_title"  >수업인원</div>
        <div><input type="text" class="class_input" name="class_personal" id="class_personal">명</div>
        </div>
        <div class="class_menu">
        <div class="class_title"  >가격</div>
        <div><input type="text" class="class_input" name="price" id="price">원</div>
        </div>
       <!--  <tr>
        <td class="class_title"  colspan="3">할인여부</td>
        <td class="sale">적용</td>
        <input type="hidden" value="fal" id="sale_check">
        <td class="nosale">안함</td>
        <td class="sale1"></td>
        </tr> -->
        <div class="class_menu">
        <div class="class_title" >주차장여부</div>
        <div><input type="text" name="parking"></div>
        </div>
        <div class="class_menu">
        <div class="class_title class_content"  >글쓰기</div>
        <div ><textarea id="p_content" name="content"></textarea></div>
        </div>
        <div class="class_menu">
        <div class="class_title class_img" >대표이미지</div>
        <div class="file_box">
            <label for="input_img">+</label>
            <input type="file" accept="image/jpg,image/jpeg,image/png,image/gif," name="image" id="input_img"
                   onchange="fileCheck(this)">
        </div>
        <div class="imgMain">
            <img id="img"/>
        </div>
        </div>
        <input type="hidden" name="storenum" value="${sbean.storenum }">
        <div class="class_buttons">
        <button type="button" id="class_registry">등록</button>
        <button type="button" id="cancle_back">취소</button>
        </div>
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
        	<input type="button" class="main" value="마이페이지">
            <input type="button" class="send" value="저장">
            <input type="button" class="cal_close" value="닫기">
        </div>
        <div class="class_registryNum"></div>
    </div>

</form>
</section>
<jsp:include page="../footer.jsp" />
<script src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script>
    $(function () {
        CKEDITOR.replace('p_content', {
            height: 350,
            removePlugins: 'resize',
            filebrowserBrowseUrl : '${pageContext.request.contextPath}/ckfinder/ckfinder.html',
        	filebrowserFlashBrowseUrl : "${pageContext.request.contextPath}/ckfinder/ckfinder.html?type=Flash",
        	filebrowserUploadUrl : "${pageContext.request.contextPath}/ckfinder/core/connector/java/connctor.java?command=QuickUpload&type=Files",
        	filebrowserImageUploadUrl : "${pageContext.request.contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images",
        	filebrowserFlashUploadUrl : "${pageContext.request.contextPath}/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash"
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
                        var date  = $("#current-year-month").text();
                        var day = $("#dateInput").text().substring(8);
                        var num = $('.class_registryNum2').val();
						$.ajax({
							type : "post",
							url : "${pageContext.request.contextPath}/saveGetTime.do",
							data : {day : day , date : date, num:num },
							dataType : "text",
							success:function (data, status){
								var result = JSON.parse(data);
								var time = result.time;
								$(".timesetting").empty();
								for(var i = 0; i < time.length; i++){
									$(".timesetting").append("<div class='timeSet'>"
													+"<input type=\"text\" disabled='disabled' class='time_start' value='"+time[i].start+"' > ~ "
													+"<input type=\"text\" disabled='disabled' class='time_end' value='"+time[i].end+"'></div>");
								}
							},
							error:function(data,status){
								alert('error');
							}
						});
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
        x();
    });

    /* < 버튼 클릭시 */
    var prevBtn = document.getElementById("prev");
    prevBtn.addEventListener("click", function () {
        removeCalendar();
        first = new Date(today.getFullYear(), today.getMonth() - 1, 1);
        showCalendar();
        today = new Date(today.getFullYear(), today.getMonth() - 1, 1);
        x();
    })
    var plus = document.getElementById("plus");
    $("#plus").on("click", function name() {
    	if ($(".timeSet").length <= 5) {
    		$(".timesetting").empty();
            $(".timesetting").append("<div class='timeSet'><input type=\"text\" id='time_start1' class='timeStart'> ~ <input type=\"text\" id='time_end1' class='timeend'></div>"
            						+"<div class='timeSet'><input type=\"text\" id='time_start2' class='timeStart'> ~ <input type=\"text\" id='time_end2' class='timeend'></div>"
            						+"<div class='timeSet'><input type=\"text\" id='time_start3' class='timeStart'> ~ <input type=\"text\" id='time_end3' class='timeend'></div>"
            						+"<div class='timeSet'><input type=\"text\" id='time_start4' class='timeStart'> ~ <input type=\"text\" id='time_end4' class='timeend'></div>"
            						+"<div class='timeSet'><input type=\"text\" id='time_start5' class='timeStart'> ~ <input type=\"text\" id='time_end5' class='timeend'></div>"
            						+"<div class='timeSet'><input type=\"text\" id='time_start6' class='timeStart'> ~ <input type=\"text\" id='time_end6' class='timeend'></div>");
            document.getElementById('time_start1').flatpickr(
            		{ enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            		});
            document.getElementById('time_end1').flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });  
            document.getElementById('time_start2').flatpickr(
            		{ enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            		});
            document.getElementById('time_end2').flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });  
            document.getElementById('time_start3').flatpickr(
            		{ enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            		});
            document.getElementById('time_end3').flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });  
            document.getElementById('time_start4').flatpickr(
            		{ enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            		});
            document.getElementById('time_end4').flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });  
            document.getElementById('time_start5').flatpickr(
            		{ enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            		});
            document.getElementById('time_end5').flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });  
            document.getElementById('time_start6').flatpickr(
            		{ enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            		});
            document.getElementById('time_end6').flatpickr({
                enableTime: true,
                noCalendar: true,
                dateFormat: "H:i",
            });  
        }
	});
        
    
    $("#sub").on("click", function () {
        if ($(".timeSet").eq(0).length == 0) {
            alert("추가해주세요~");
            return;
        }
        $(".timeSet").last().remove();
    });
    function x(){
        console.log($(".abled_td").length);
      	 var num = $(".class_registryNum2").val();
        var date= $("#current-year-month").text();
         $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/timeSetting.do",
            dataType: "text",
            data: { date : date, num : num },
             success:function (data, status) {
            	 var result = JSON.parse(data);
            	 var all = result.all;
            	 if(all.length != 0 ){
                  for(var i = 0; i < all.length; i++){
                	  $(".abled_td").eq(all[i].day - 1).css("background","#FACB87");
                	  $(".abled_td").eq(all[i].day - 1).css("border-radius","50%");
                 } 
            	 }
             },
             error:function(data,status){
            	 alert('error');
             }
         }); 
    } 
    
    
</script>
</body>
</html>

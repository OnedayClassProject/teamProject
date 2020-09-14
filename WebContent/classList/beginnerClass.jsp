<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/classList/seoulClass.css">
</head>
<body>
<jsp:include page="../header.jsp"/>
<section>
<div class="pic" style="background-image: url('${pageContext.request.contextPath}/images/class2.png');"></div>
    <div class="my_wrap">
        <div class="side_menu">
           <div class="side_detail">
           <div class="current_menu">클래스</div>
           <div class="line"></div>
                <a href="${pageContext.request.contextPath}/popularClass.do" class='current_menu2'><div>인기클래스</div>
                </a>
            </div>
            <hr>
            <div class="side_detail">
               <a href="${pageContext.request.contextPath}/beginnerClass.do" class='current_menu2'><div>입문클래스</div>
                </a>
            </div>
            <hr>
        </div>
            <div class="my_main">
            <div>입문 클래스</div>
            <c:if test="${count != 0}">
            <c:set var="i" value="1"/>
            <c:forEach var="classBean" items="${requestScope.Vector}">
            <div class="best-class">
                 <div class="thumbnail" >
                 <a href="${pageContext.request.contextPath}/ClassInfo.do?class_registrynum=${classBean.class_registrynum}" >
                 <img src="${pageContext.request.contextPath}/thumbnailImage/${classBean.thumbnail}">
                 </a>
                 <div class="like_image"> 
                 
                  <img class="like" src="${pageContext.request.contextPath}/images/heart_empty.png">
                 <input type="hidden" value="${classBean.class_registrynum}" class="num">
                 <img class="favor" src="${pageContext.request.contextPath}/images/star2.png">
                 </div>
                 </div>
                     <div class="class-name">
                         <div class="class-name1">카테고리 : ${classBean.category}</div>
                         <div class="class-name2">클래스명 : ${classBean.class_name}</div>
                         	<input type="hidden" class="rating" value="${classBean.rating }">
                         	<div class = "starRev">
				        	<input class="staR" value="1">
				        	<input class="staR" value="2">
				        	<input class="staR" value="3">
				        	<input class="staR" value="4">
				        	<input class="staR" value="5">
        					</div>
                    </div>
            	 </div>
           	

	            <c:if test="${i%3 == 0}">
	            	<br>
	            </c:if>
	            <c:set var="i" value="${i+1}"/>
            </c:forEach>
            
            <div class="pageNum">
            	<c:if test="${pageNum > 1}">
            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/beginnerClass.do?pageNum=${1}'"> << </div>
            	</c:if>
            	<c:if test="${pageNum > startPage}">
            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/beginnerClass.do?pageNum=${pageNum-1}'"> < </div>
            	</c:if>
            	<c:forEach var = "i" begin="${startPage}" end ="${endPage}">
            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/beginnerClass.do?pageNum=${i}'">${i}</div>
            	</c:forEach>
            	<c:if test="${pageNum < pageCount}">
            		<div class="pageNum2" onclick="location.href='${pageContext.request.contextPath}/beginnerClass.do?pageNum=${pageNum+1}'"> > </div>
            	</c:if>
            	<c:if test="${pageNum < pageCount}">
            		<div class="pageNum3" onclick="location.href='${pageContext.request.contextPath}/beginnerClass.do?pageNum=${pageCount}'"> >> </div>
            	</c:if>
            </div>
	    </div>
	    </c:if>
	          	<c:if test="${count == 0 }">
	          		<div class="no_list">LIST가 없습니다.</div>
	          	</c:if>
	          	
            </div>
</section>
<jsp:include page="../footer.jsp" />
<script type="text/javascript">


//하트 아이콘 눌렀을 때
$(".like").on("click",function(){
	var image = $(this).attr("src");
	var num = $(this).next().val();
	var likeOn = "${pageContext.request.contextPath}/images/heart_full.png";
	var likeOff = "${pageContext.request.contextPath}/images/heart_empty.png"
	console.log(num);
       
	if( '${sessionScope.userid}' != ""){
		if(image == likeOff){
			$(this).attr("src",likeOn)
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/likeOn.do",
					data : {num : num},
					dataType : "text",
					async : true,
					success:function(data,status){
						if(data == 1){
							alert("좋아요");
						}
					},
					error : function(data,status){
						alert("에러가 발생했습니다.")
					}
				});
		}else if(image == likeOn){
			$(this).attr("src",likeOff)
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/likeOff.do",
					data : {num : num},
					dataType : "text",
					async : true,
					success : function(data,status){
						if(data == 1){
							alert("좋아요 취소");
						}else{
							alert("실패");
						}
					},
					error : function(data,status){
						alert("에러가 발생했습니다.");
					}
				});
			}
		}else{
			alert("로그인 후 눌러주세요.");
		}
});
    
	for(var i = 0; i<"${fn:length(Vector)}"; i++){
       
		var cla = $(".like_image").eq(i);
		var num = cla.children(".num").val();
		var current = $(".starRev").eq(i);
		var rating  = $(".rating").eq(i).val();
		
		if(rating == "0"){
			var rating1 = current.children(".staR").eq(rating)
		} else {
			var rating1 = current.children(".staR").eq(rating-1)
          rating1.parent().children("input").removeClass("on");
          rating1.addClass("on").prevAll("input").addClass("on");
		}
		console.log("i = "+i);
		console.log("num = "+num);

		like();
	}
	
function like(){
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/isLike.do",
		data : {num : num},
		async : false,
		dataType : "text",
		success : function(data,status){
		console.log("data" + data);
			if(data == 1){
				cla.children(".like").attr("src","${pageContext.request.contextPath}/images/heart_full.png");
				console.log(cla.children(".like").attr("src"))
			}
		},
		error: function(data,status){
			alert("에러가 발생했습니다.");
		}
	});
}
    
    

		/*favor 눌렀을때*/
		$(".favor").on("click",function(){
			var ima = $(this).attr('src');
			var num = $(this).prev(".num").val();
			console.log(ima);
			console.log(num);
			
			if( '${sessionScope.userid}' != ""){
			if(ima == '${pageContext.request.contextPath}/images/star2.png'){
				$(this).attr('src','${pageContext.request.contextPath}/images/star1.png');
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/favorReg.do",
				data:{num:num},
				async : true,
				dataType:"text",
				success : function(data,status){
					console.log(data);
					if(data==1){
						alert('저장성공');
					}else{
						alert('실패');
					}
				},
				error:function(data,status){
					alert('에러발생');
					}
				
			});
			
       
		}else if(ima=="${pageContext.request.contextPath}/images/star1.png"){
			$(this).attr('src','${pageContext.request.contextPath}/images/star2.png');
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/favorCancle.do",
					data:{num:num},
					dataType:"text",
					async : true,
					success:function(data,status){
						if(data==1){
							alert('저장성공');
						}else{
							alert('실패');
						}
					},
					error:function(data,status){
						alert('에러발생');
					}
				});
				
			}
			}else{
				alert("로그인 후 눌러주세요.");
			}
			
		});
		
               
    for(var i=0;i< "${fn:length(Vector)}";i++){
       var cla=$('.like_image').eq(i);
       var num=cla.children('.num').val();
       console.log(num);
       $.ajax({
          type:"post",
          url : "${pageContext.request.contextPath}/isFavor.do",
          data:{num:num},
          async:false,
          dataType:"text",
          success:function(data,status){
             console.log(data);
             if(data==1){
                cla.children('.favor').attr("src","${pageContext.request.contextPath}/images/star1.png")
             }
          },error:function(data,status){
             alert('에러발생');
          }
       });
    }
    <!-- Channel Plugin Scripts -->
    (function() {
      var w = window;
      if (w.ChannelIO) {
        return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
      }
      var ch = function() {
        ch.c(arguments);
      };
      ch.q = [];
      ch.c = function(args) {
        ch.q.push(args);
      };
      w.ChannelIO = ch;
      function l() {
        if (w.ChannelIOInitialized) {
          return;
        }
        w.ChannelIOInitialized = true;
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
        s.charset = 'UTF-8';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
      }
      if (document.readyState === 'complete') {
        l();
      } else if (window.attachEvent) {
        window.attachEvent('onload', l);
      } else {
        window.addEventListener('DOMContentLoaded', l, false);
        window.addEventListener('load', l, false);
      }
    })();
    ChannelIO('boot', {
      "pluginKey": "23441f9e-c08a-4bd9-8ec4-21d31c9851cf"
    });
  <!-- End Channel Plugin -->
	</script>
</body>
</html>
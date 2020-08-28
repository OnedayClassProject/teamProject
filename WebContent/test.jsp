<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
</head>
<body>
	<div class="class_class">
		<div>즐겨찾기</div>
		<div>좋아요</div>
		<input type="hidden" class="num" value="0">
		<img alt="좋아요" src="${pageContext.request.contextPath}/images/star2.png" class="like" width="100px" height="100px">
	</div>
	<div class="class_class">
		<div>즐겨찾기</div>
		<div>좋아요</div>
		<input type="hidden" class="num" value="1" >
		<img alt="좋아요" src="${pageContext.request.contextPath}/images/star2.png" class="like"  width="100px" height="100px">
	</div>
	<div class="class_class">
		<div>즐겨찾기</div>
		<div>좋아요</div>
		<input type="hidden" class="num" value="2">
		<img alt="좋아요" src="${pageContext.request.contextPath}/images/star2.png" class="like"  width="100px" height="100px">
	</div>
	<div class="class_class">
		<div>즐겨찾기</div>
		<div>좋아요</div>
		<input type="hidden" class="num" value="3">
		<img alt="좋아요" src="${pageContext.request.contextPath}/images/star2.png" class="like"  width="100px" height="100px">
	</div>
	<script>
		
		//좋아요를 클릭하면 이미지가 바뀌는 코드
		//좋아요 눌렀을 시에 Ajax실행
		$(".like").on("click", function () {
			//클릭한 좋아요 이미지 src 값을 저장
			var ima = $(this).attr('src');
			var num	= $(this).prev().val();
			console.log(ima);
		 	console.log(num);
			//형제요소 선택자 
			//자기 이전의 형제요소를 선택하여 value값 저장
			//클래스등록번호 저장
			//좋아요 버튼 클릭시 선택이 안된 이미지이면 true
			if(ima == '${pageContext.request.contextPath}/images/star2.png'){
				//선택된 이미지로 바꿔줌
				$(this).attr('src', '${pageContext.request.contextPath}/images/star1.png');
			
		
				//좋아요 테이블에 클래스등록번호와 아이디값을 저장하는 ajax	
				/*  $.ajax({
					type:"post",
					url:"/likeOn.do",
					data{num : num},
					dataType:"text",
					success:function(data, status){
						if(data == 1){
							alert('저장성공');
						} else{
							alert('실패');
						}
					},
					error:function(data, status){
						alert('저장실패');
					}
				
				}); */
				
			} else if(ima == "${pageContext.request.contextPath}/images/star1.png"){//선택해제를 하면 좋아요 테이블에서 삭제
				//선택된이미지에서 안된 이미지로 변경
				$(this).attr('src', '${pageContext.request.contextPath}/images/star2.png');
				//좋아요 해제하면 좋아요 테이블에서 삭제
				/* $.ajax({
					type:"post",
					url:"/likeOff.do",
					data{num : num},
					dataType:"text",
					success:function(data, status){
						if(data == 1){
							alert('저장성공');
						} else{
							alert('실패');
						}
					},
					error:function(data, status){
						alert('저장실패');
					}
				
				});  */
				
			}
		});
		
	
		/* 리스트화면에 회원이 좋아요를 했는지 안했는지 체크하는 코드 */
		// 그 사람이 좋아요를 눌렸으면 좋아요클릭되있는 상태로 보여진다.
		//for문안에 4번을 반복하게 만들어 놓았습니다.
		//원래는 리스트길이 만큼 반복하여 돌아야합니다.
		//JSTL을 이용하여 밑에 리스트배열길이를 가져오는 코드를 사용할겁니다. 
		<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		${fn:length(list) } --%>
		for(var i = 0; i < 4; i++){
			//화면에 보이는 클래스등록번호를 가져오는 코드
			//위 body안에 있는 클래스명(.class_class) 4개 다 동일하다.
			var cla = $('.class_class').eq(i); /* 클래스명(.class_class) 몇 번째 요소인지를 구분하는 선택자 */
			var num = cla.children('.num').val(); /* 해당 클래스명(.class_class) 자식요소를 선택하여 value 값을 가져옵니다. */
			console.log(num);
			//여기 밑에는  ajax가 실행될겁니다.
			/* $.ajax({
				type:"post",
				//클래스등록번호를 넘겨서 이 액션페이지에가 동작 
				//클래스등록번호를 select where문을 이용하여 조건문에 아이디값과 클래스등록번호를 넣어주고
				// 만약 있으면  1을 리턴 없으면 0을 리턴한다.
				url:"/likeCheck.do", 
				data: {num : num},
				async
			 	dataType: "text",
			  	success:function(data, status){
			  		if(data == 1){
						//ture니까 여기선 이미지값을 좋아요를 선택안된 이미지 -> 선택된 이미지로 바꿔준다.
			  			cla.children('.like').attr("src","선택된이미지");
			  		}
			  	},
			  	error:function(data, status){
			  		alert('ERROR');
			  	}
			}); */
		}
	
	</script>
</body>
</html>
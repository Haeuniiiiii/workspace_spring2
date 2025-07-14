<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 </title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-3">
  <h2>게시글 상세</h2>
  <input type="hidden" id="boardNo" name="boardNo" value="${detailVO.boardNo }"
  > 
<!--   <form action="/board/regist.do" method="post" id="boardRegistForm"> -->
  <form>
    <div class="mb-3 mt-3">
      <label for="boardTitle">게시글 제목</label>
      <input type="text" class="form-control" id="title" name="title" value="${detailVO.title }" readonly>
    </div>
    <div class="mb-3">
      <label for="boardWriter">작성자</label>
      <input type="text" class="form-control" id="writer" name="writer" value="${detailVO.writer }" readonly>
    </div>
    <div class="mb-3">
      <label for="boardContent">게시글 내용</label>
      <input type="text" class="form-control" id="content" name="content" value="${detailVO.content }" readonly>
    </div>
    <div class="mb-3">
      <label for="regDt">등록일</label>
      <input type="text" class="form-control" id="regDate" name="regDate" value="${detailVO.regDate }" readonly>
    </div>
    <div class="mb-3">
	 <label for="boardHit">조회수</label>
	 <input type="text"	class="form-control" id="boardHit" name="boardHit" value="0" readonly>
	</div>
	    <button id="updateBtn" type="button" class="btn btn-warning">수정</button>
	    <button id="saveBtn" type="button" class="btn btn-primary">저장</button>
	    <button id="cancelBtn" type="button" class="btn btn-danger">취소</button>
	    <button id="deleteBtn"type="button" class="btn btn-danger">삭제</button>
	    <button id="listBtn"type="button" class="btn btn-secondary"
	    	onclick="javascript:location.href='/board/list.do'">목록</button>
			<!-- /  절대 경로로 지정하여야 제대로 링크를 먹음 /를 넣지 않으면 상대 경로로 인식 -->	    	
  </form>
</div>
 	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>

$(function(){
	$("#saveBtn").hide();	
	$("#cancelBtn").hide();	
	
	let boardNo = $("#boardNo").val();
	let deleteBtn = $("#deleteBtn");
	let updateBtn = $("#updateBtn");
	
	deleteBtn.on("click", function(){
		if(confirm("해당 게시글을 삭제하시겠습니까?")){
			
				let data = {
					boardNo
				}
				
			$.ajax({
				url:"/board/delete.do",
				method:"post",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success: function(result){
					if(result === "SUCCESS"){
						alert("해당 게시글을 삭제했습니다.");
						location.href="/board/list.do";
						
					}else{
						alert("게시글 삭제에 실패했습니다.\n 다시 시도해주세요.");
						return
					}
				},
				error:function(){
					alert("비동기 통신 도중 에러 발생...!");
				}
			});			
		}
	});
	
	updateBtn.on("click", function(){
		$("#saveBtn").show();	
		$("#cancelBtn").show();	

		$("#updateBtn").hide();	
		$("#deleteBtn").hide();	
		$("#listBtn").hide();	
		
		// readonly 속성을 유지할 input ID 목록 
		let excludeIds = ["regDate", "boardHit"];
		
		// 모든 input 요소에 대해 반복 처리
		$("input").each(function(index, element){
			let $input = $(element);
			let id = $input.attr("id");
			
			// readonly 속성이 있고, 제외 대상이 아니라면 
			if($input.is("[readonly]") && !excludeIds.includes(id)){
				$input.removeAttr("readonly"); 		// readonly 속성 제거 (수정 가능하게 변경);
			}
		});
	});
	
	$("#cancelBtn").on("click", function(){
		location.reload();
	});
	
	$("#saveBtn").on("click",function(){
		let title = $("#title").val();
		let writer = $("#writer").val();
		let content = $("#content").val();
		
		console.log("title ::: " , title);
		console.log("writer ::: " , writer);
		console.log("content ::: " , content);
		
		let data = {
			boardNo,	// 키값과 밸류값이 이름이 같으면 생략이 가능해용 
			title,
			writer,
			content
		}
		
		$.ajax({
			url:"/board/update.do",
			method:"post",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			success:function(result){
				if(result != null){
					alert("게시글 수정에 성공 하였습니다!!");
					$("#title").val(result.title);
					$("#writer").val(result.writer);
					$("#content").val(result.content);
					
					$("#saveBtn").hide();	
					$("#cancelBtn").hide();	

					$("#updateBtn").show();	
					$("#deleteBtn").show();	
					$("#listBtn").show();	
					
					// 다시 readonly 상태로 되돌릴 input Id 제외 목록
					let excludeIds = ["regDate", "boardHit"];
					
					// 모든 input 요소 순회
					$("input").each(function(index, element){
						let $input = $(element);
						let id = $input.attr("id");
						// readonly가 없고 제외대상이 아니라면
						if(!$input.is("[readonly]") && !excludeIds.includes(id)){
							$input.attr("readonly",true);	// readonly 속성 다시 추가 !
						}
					});
				}else{
					alert("게시글 수정에 실패했습니다.");
					return; 
				}
			},
			error:function(){
				alert("이 알러트는 뜨지 않았으면 좋겠어...");
			}
		});
	});
});
</script>  
</body>
</html>
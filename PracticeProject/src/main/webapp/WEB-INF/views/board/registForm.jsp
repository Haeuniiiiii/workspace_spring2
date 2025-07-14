<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
</head>
<body>
<div class="container mt-3">
  <h2>게시글 등록</h2>
<!--   <form action="/board/regist.do" method="post" id="boardRegistForm"> -->
  <form>
    <div class="mb-3 mt-3">
      <label for="boardTitle">게시글 제목</label>
      <input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title">
    </div>
    <div class="mb-3">
      <label for="boardWriter">작성자</label>
      <input type="text" class="form-control" id="writer" placeholder="작성자를 입력해주세요" name="writer">
    </div>
    <div class="mb-3">
      <label for="boardContent">게시글 내용</label>
      <input type="text" class="form-control" id="content" placeholder="내용을 입력해주세요" name="content">
    </div>
    <button id="cancleBtn" type="button" class="btn btn-danger">취소</button>
    <button id="registBtn"type="button" class="btn btn-primary">등록</button>
  </form>
</div>
 	
 	
 	
 	
 	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script
  src="https://code.jquery.com/jquery-3.7.1.js"
  integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
  crossorigin="anonymous"></script>
<script>
$(function(){
	
	$("#cancleBtn").on("click",function(){
		if(confirm("정말 취소하시겠습니까?\n진행중인 작성은 저장되지 않습니다.")){
			location.href="/board/list.do";
		}
	});
	
	$("#registBtn").on("click",function(){

		let title = $("#title").val();
		let writer = $("#writer").val();
		let content = $("#content").val();
		
		console.log("title ::: ", title);
		console.log("writer ::: ", writer);
		console.log("content ::: ", content);
		
		if(title == null || title.trim() == ""){
			alert("제목을 작성해주세요...!");
			$("#title").focus();
			return false;
		}
		
		if(writer == null || writer.trim() == ""){
			alert("작성자를 작성해주세요...!");
			$("#writer").focus();
			return false;
		}
		
		if(content == null || content.trim() == ""){
			alert("내용을 작성해주세요...!");
			$("#content").focus();
			return false;
		}
		
		let data = {
				title,
				writer,
				content
		}
		
		$.ajax({
			url:"/board/insert.do",
			method:"post",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			success:function(result){
				if(result.result === "SUCCESS"){
					alert("게시글 등록에 성공하셨습니다.");
					location.href="/board/detail.do?boardNo=" + result.boardNo;
				}
			},
			error:function(){
				alert("비동기 통신중 에러!!!!");
			}			
		});
	});
});
</script>	
</body>
</html>
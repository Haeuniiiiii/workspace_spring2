<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>DDIT BOARD</title>
<%@ include file="../skydash/headPart.jsp" %>
</head>
<body>
	<div class="container-scroller">
		<%@ include file="../skydash/header.jsp" %>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="../skydash/aside.jsp" %>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">자유 게시판</h4>
									<form class="forms-sample" id="fForm" action="/free/insert.do" method="post">
										<c:set value="등록" var="text" />
										<c:if test="${status eq 'u'}">
											<input type="hidden" name="frNo" value="${free.frNo }">
											<c:set value="수정" var="text" />
										</c:if>
										<div class="form-group">
											<label for="frTitle">제목</label> 
											<input type="text" class="form-control" name="frTitle" id="frTitle" value="${free.frTitle }" placeholder="제목을 입력해주세요...!">
										</div>
										<div class="form-group">
											<label for="frWriter">작성자</label> 
											<input type="text" class="form-control" name="frWriter" id="frWriter" value="${free.frWriter }" placeholder="작성자를 입력해주세요...!">
										</div>
										<div class="form-group">
											<label for="frContent">내용</label>
											<textarea class="form-control" name="frContent" id="frContent" rows="4">${free.frContent }</textarea>
										</div>
									</form>
								</div>
								<div class="card-body">
									<button type="button" class="btn btn-inverse-primary mr-2" id="addBtn">${text }</button>
									<c:set value="취소" var="cancelText" />
									<c:choose>
										<c:when test="${status eq 'u'}">
											<button type="button" class="btn btn-inverse-danger mr-2" onclick="location.href='/board/${free.frNo }'">${cancelText }</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-inverse-danger mr-2" id="cancelBtn">${cancelText }</button>
										</c:otherwise>
									</c:choose>
									<button type="button" class="btn btn-inverse-info mr-2" id="listBtn">목록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="../skydash/footer.jsp" %>
			</div>
		</div>
	</div>

	<%@ include file="../skydash/footerPart.jsp" %>
</body>
<script type="text/javascript">
$(function(){
	let addBtn = $("#addBtn"); 
	let cancelBtn = $("#cancelBtn"); 
	let listBtn = $("#listBtn"); 
	let fForm = $("#fForm"); 
	
	addBtn.on("click", function(){
		console.log("등록 버튼클릭");
		
		// 제목, 작성자, 내용에 대한 기본 유효성 검사를 진행한다.
		// input element의 입력된 데이터를 가져오려면 val() 메서드를 활용할 수 있다.
		let title = $("#frTitle").val();
		let writer = $("#frWriter").val();
		let content = $("#frContent").val();
		
		if(title == null || title == "") {
			alert("제목을 입력해주세요!");
			return false;
		}
		
		if(writer == null || writer == "") {
			alert("제목을 입력해주세요!");
			return false;
		}
		
		if(content == null || content == "") {
			alert("제목을 입력해주세요!");
			return false;
		}
		
		if($(this).text() == "수정") {
			fForm.attr("action", "/free/update.do");
		}
		fForm.submit();
	});
	
	
	cancelBtn.on("click", function(){
		console.log("취소 버튼클릭");
		location.href = "/free/list.do";
	});
	
	
	listBtn.on("click", function(){
		console.log("목록 버튼클릭");
		location.href = "/free/list.do";
	});
	
});

</script>
</html>
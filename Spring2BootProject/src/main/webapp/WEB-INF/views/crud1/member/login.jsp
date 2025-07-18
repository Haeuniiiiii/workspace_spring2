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
									<h4 class="card-title">로그인화면으로 오셨습니다</h4>
<!-- 									<form class="forms-sample" id="bForm" action="/board/insert.do" method="post"> -->
<%-- 										<c:set value="등록" var="text" /> --%>
<%-- 										<c:if test="${status eq 'u'}"> --%>
<%-- 											<input type="hidden" name="boNo" value="${board.boNo }"> --%>
<%-- 											<c:set value="수정" var="text" /> --%>
<%-- 										</c:if> --%>
<!-- 										<div class="form-group"> -->
<!-- 											<label for="boTitle">제목</label>  -->
<%-- 											<input type="text" class="form-control" name="boTitle" value="${board.boTitle }" id="boTitle" placeholder="제목을 입력해주세요...!"> --%>
<!-- 										</div> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label for="boWriter">작성자</label>  -->
<%-- 											<input type="text" class="form-control" name="boWriter" value="${board.boWriter }"id="boWriter" placeholder="작성자를 입력해주세요...!"> --%>
<!-- 										</div> -->
<!-- 										<div class="form-group"> -->
<!-- 											<label for="boContent">내용</label> -->
<%-- 											<textarea class="form-control" name="boContent" id="boContent" rows="4">${board.boContent }</textarea> --%>
<!-- 										</div> -->
<!-- 									</form> -->
								</div>
								<div class="card-body">
<%-- 									<button type="button" class="btn btn-inverse-primary mr-2" id="addBtn">${text }</button> --%>
<%-- 									<c:set value="취소" var="cancelText" /> --%>
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${status eq 'u'}"> --%>
<%-- 											<button type="button" class="btn btn-inverse-danger mr-2" onclick="location.href='/board/${board.boNo }'">${cancelText }</button> --%>
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<%-- 											<button type="button" class="btn btn-inverse-danger mr-2" id="cancelBtn">${cancelText }</button> --%>
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
<!-- 									<button type="button" class="btn btn-inverse-info mr-2" id="listBtn">목록</button> -->
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
	let bForm = $("#bForm"); 
	
	addBtn.on("click", function(){
		console.log("등록 버튼클릭");
		
		// 제목, 작성자, 내용에 대한 기본 유효성 검사를 진행한다.
		// input element의 입력된 데이터를 가져오려면 val() 메서드를 활용할 수 있다.
		let title = $("#boTitle").val();
		let writer = $("#boWriter").val();
		let content = $("#boContent").val();
		
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
			
			bForm.attr("action", "/board/update.do");
		}
		bForm.submit();
	});
	
	
	cancelBtn.on("click", function(){
		console.log("취소 버튼클릭");
		location.href = "/board/list.do";
	});
	
	
	listBtn.on("click", function(){
		console.log("목록 버튼클릭");
		location.href = "/board/list.do";
	});
	
});

</script>
</html>
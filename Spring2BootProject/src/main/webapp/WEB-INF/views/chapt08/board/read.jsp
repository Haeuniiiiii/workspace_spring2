<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>DDIT BOARD</title>
<%@ include file="../../skydash/headPart.jsp" %>
</head>
<body>
	<div class="container-scroller">
		<%@ include file="../../skydash/header.jsp" %>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="../../skydash/aside.jsp" %>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-lg-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-header">
									<h4 class="card-title">Chapt08</h4>
								</div>									
									<div class="card-body">
										<p class="card-description">BOARD READ</p>
										<table class="table table-bordered">
											<tr>
												<td>제목</td>
												<td>${board.title }</td>
											</tr>
											<tr>
												<td>작성자</td>
												<td>${board.writer }</td>
											</tr>
											<tr>
												<td>내용</td>
												<td>${board.content }</td>
											</tr>
											<tr>
												<td>작성일</td>
												<td>${board.regDate }</td>
											</tr>
										</table>
										<input type="button" id="btnModify" value="수정" class="btn btn-primary"/>
										<input type="button" id="btnDelete" value="삭제" class="btn btn-danger"/>
										<input type="button" id="btnList" value="목록" class="btn btn-success" onclick="javascript:location.href='/crud/board/list'"/>
									</div>
								<form action="/crud/board/remove" method="post" id="delForm">
									<input type="hidden" name="boardNo" value="${board.boardNo }" /> 
								</form>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="../../skydash/footer.jsp" %>
			</div>
		</div>
	</div>
	<%@ include file="../../skydash/footerPart.jsp" %>
</body>
<script type="text/javascript">
$(function(){
	
// 	let btnList = $("#btnList");
	let delForm = $("#delForm");
	let btnModify = $("#btnModify");
	let btnDelete = $("#btnDelete");
	
	// 수정 버튼 이벤트
	btnModify.on("click", function(){
		alert("수정버튼체킁");
		delForm.attr("action", "/crud/board/modify");
		delForm.attr("method", "get");
		delForm.submit();
	});
	
	// 삭제 버튼 이벤트
	btnDelete.on("click", function(){
		alert("삭제버튼체킁");
		if(confirm("정말로 삭제하시겠습니까?")) {
			delForm.submit();
		}  
	});
	
	// 목록 버튼 이벤트
// 	btnList.on("click", function(){
// 		alert("목록버튼체킁");
// 		location.href = "/crud/board/list";
// 	});
});

</script>
</html>
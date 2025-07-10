<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
									<h4 class="card-title">일반 게시판</h4>
									<div class="form-group">
										<h3>${board.boTitle }</h3>
										<label>${board.boWriter }${board.boDate }${board.boHit }</label> 
									</div>
									<div class="form-group">
										<label for="boContent">내용</label>
										<h5>${board.boContent }</h5>
									</div>
								</div>
								<div class="card-body">
									<button type="button" class="btn btn-inverse-primary mr-2" id="udtBtn">수정</button>
									<button type="button" class="btn btn-inverse-danger mr-2" id="delBtn">삭제</button>
									<button type="button" class="btn btn-inverse-info mr-2" id="listBtn">목록</button>
								</div>
								<form action="/board/delete.do" method="post" id="delForm">
									<input type="hidden" name="boNo" value="${board.boNo }">
								</form>
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
	
$(function() {
	
	let udtBtn = $("#udtBtn");
	let delBtn = $("#delBtn");
	let listBtn = $("#listBtn");
	let delForm = $("#delForm");

	udtBtn.on("click", function(){
		delForm.attr("action", "/board/update.do");
		delForm.attr("method", "get");
		delForm.submit();
	});
	
	
	delBtn.on("click", function(){
		if(confirm("정말 삭제하시겠습니까?")) {
			delForm.submit();
		} 
	});
	
	
	listBtn.on("click", function(){
		location.href = "/board/list.do";
	});
	
});

</script>
</html>
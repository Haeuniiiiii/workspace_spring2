<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
								<div class="card-body">
									<h4 class="card-title">NOTICE VIEW</h4>
									<div class="form-group">
										<h3>${notice.ntTitle }</h3>
										<label>작성자 | ${notice.ntWriter }&nbsp;&nbsp;
												작성일 | ${notice.ntDate }&nbsp;&nbsp;
												조회수 | ${notice.ntHit }</label>
									</div>
									<div class="form-group">
										<label for="ntContent">내용</label>
										<h5>${notice.ntContent }</h5>
									</div>
								</div>
								<div class="card-body">
									<button type="button" class="btn btn-inverse-primary mr-2" id="updBtn">수정</button>
									<button type="button" class="btn btn-inverse-danger mr-2" id="delBtn">삭제</button>
									<button type="button" class="btn btn-inverse-info mr-2" id="listBtn">목록</button>
								</div>
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
	
$(function() {
	
// 	let updBtn = $("#updBtn");
// 	let delBtn = $("#delBtn");
// 	let listBtn = $("#listBtn");
// 	let delForm = $("#delForm");

// 	delBtn.on("click", function(){
// 		if(confirm("정말 삭제하시겠습니까?")) {
// 			delForm.submit();
// 		} 
// 	});
	
// 	listBtn.on("click", function(){
// 		location.href = "/crud1/board/list.do";
// 	});
	
	// 수정 버튼 누르면 view가 form으로 변경되도록 비동기 처리
// 	updBtn.on("click", function(){
// 		delForm.attr("action", "/crud1/board/update.do");
// 		delForm.attr("method", "get");
// 		delForm.submit();
		

// 		$.ajax({
// 			url : "/crud1/board/update.do",
// 			type : "get",
// 			data : {
// 				boNo : "${board.boNo }"
// 			},
// 			success : function(data) {
// 				location.href = "/crud1/board/update.do";
// 			}
// 			error : function(error) {
// 				console.log(error);
// 			}
// 		});





// 	});
	
	
});
</script>
</html>
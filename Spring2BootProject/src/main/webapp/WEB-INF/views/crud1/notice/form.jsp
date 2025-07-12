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
									<h4 class="card-title">NOTICE INSERT</h4>
								</div>									
								<div class="card-body">
									<form action="/crud1/notice/insert.do" method="post" id="registerForm">
										<label for="exampleFormControlInput1" class="form-label">제목</label>
										<input class="form-control" name="ntTitle" id="ntTitle" /><br/>
										<label for="exampleFormControlInput1" class="form-label">작성자</label>
										<input class="form-control" name="ntWriter" id="ntWriter" /><br/>
										<label for="exampleFormControlInput1" class="form-label">내용</label>
										<input class="form-control" name="ntContent" id="ntContent" /><br/>
									</form>
									<br />
									<div class="d-grid gap-2 d-md-flex justify-content-md-end">
										<input id="subBtn" type="button" value="등록" class="btn btn-outline-primary mb-3" />
									</div>
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

$(function(){
	console.log("레디펑션체크")
	
	let registerForm = $("#registerForm");
	let subBtn = $("#subBtn");
	
// 	let ntTitle = $("#ntTitle").val();
// 	let ntWriter = $("#ntWriter").val();
// 	let ntContent = $("#ntContent").val();
	
	subBtn.on("click", function(){
// 		alert("체킁");
// 		console.log(ntTitle);
// 		console.log(ntWriter);
// 		console.log(ntContent);

// 		if(!ntTitle) {
// 			alert("제목을 입력하세요!")
// 			return false;			 
// 		}
// 		if(!ntWriter) {
// 			alert("작성자를 입력하세요!")
// 			return false;			 
// 		}
// 		if(!ntContent) {
// 			alert("내용을 입력하세요!")
// 			return false;			 
// 		}
		
		registerForm.submit(); 
	});
	
	
	
	
	
});






</script>
</html>
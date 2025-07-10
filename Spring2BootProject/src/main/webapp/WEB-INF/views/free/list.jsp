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
									<h4 class="card-title">일반 게시판</h4>
									<form id="frm">
										<input type="hidden" name="page" id="page" />
									</form>
									<div class="table-responsive">
										<table class="table table-hover">
											<thead>
												<tr>
													<th>번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
													<th>조회수</th>
												</tr>
											</thead>
											<tbody>
											<c:set value="${pagingVO.dataList }" var="boardList" />
											<c:choose>
												<c:when test="${empty boardList }">
													<tr>
														<td colspan="5">조회하신 게시글이 존재하지 않습니다.</td>
													</tr>
												</c:when>
												<c:otherwise>
													<c:forEach items="${boardList }" var="board">
														<tr class="boardLine" data-boardno="${board.boNo }">
															<td>${board.boNo }</td>
															<td>${board.boTitle }</td>
															<td>${board.boWriter }</td>
															<td>${board.boDate }</td>
															<td>${board.boHit }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
											</tbody>
										</table>
									</div>
								</div>
								<div class="card-body" id="pagingArea">
									${pagingVO.pagingHTML }
								</div>
								<div class="card-body">
									<button type="button" class="btn btn-inverse-info" id="addBtn">등록</button>
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

$(function() {
	
	let boardLine = $(".boardLine");
	let pagingArea = $("#pagingArea");
	let frm = $("#frm");	// 페이징 처리하기 위한 form 태그
	
	let addBtn = $("#addBtn");
	
	boardLine.on("click", function(){
		let ck = $(this).data("boardno");
		alert("디테일하게 보겠슴당 체킁" + ck);
		location.href = "/board/" + ck;
	});
	
	pagingArea.on("click", "a" , function(e){
		e.preventDefault();
		
		let pageNo = $(this).data("page");	// page번호 가져오기
		console.log(pageNo);
		
		frm.find("#page").val(pageNo);		// id가 page인 태그를 찾아라
		frm.submit();
	});
	
	addBtn.on("click", function(){
		location.href = "/board/form.do";
	});
	
});


</script>
</html>



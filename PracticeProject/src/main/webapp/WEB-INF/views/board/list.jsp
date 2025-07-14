<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
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
								<div class="card-header">
									<h4 class="card-title">연습용 게시판</h4>
								</div>									
								<div class="card-body">
								<div align="right">
									<form class="input-group input-group-sm" method="post" id="searchForm" style="width: 440px;">
										<input type="hidden" name="page" id="page"/>
										<select class="form-control" name="searchType">
											<!-- 
												 사용자가 이전에 검색했던 타입을 그대로 유지해주기 위해 서버에서 그 값을 확인해 
											     필요한 곳에만 selected를 붙여주는 거
											 -->
											<option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
											<option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
										</select>
										<input type="text" name="searchWord" class="form-control float-right" value="${searchWord}" placeholder="Search">
										<div class="input-group-append">
											<button type="submit" class="btn btn-dark">
												<i class="fas fa-search"></i>검색
											</button>
										</div>
									</form>
									</div>
									<table class="table">
										<thead>	
										<tr>
											<th>#</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
										</tr>
										</thead>
										<tbody>
											<c:set value="${pagingVO.dataList}" var="boardList"/>										
											<c:choose>
												<c:when test="${empty boardList }">
													존재하는 게시글이 없습니다.
												</c:when>
												<c:otherwise>
													<c:forEach items="${boardList }" var="board">
														<tr class="board" data-boardno="${board.boardNo}">
															<td>${board.boardNo }</td>
															<td>${board.title }</td>
															<td>${board.writer }</td>
															<td>${board.regDate }</td>
														</tr>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										
										</tbody>
									</table>
									<a class="btn btn-primary" href="/board/insert.do">등록</a>
								</div>
								<div class="card-footer clearfix mt-4" id="pagingArea">${pagingVO.pagingHTML}</div>
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
<script>
$(function(){
	let pagingArea = $("#pagingArea");
	let searchForm = $("#searchForm");
	let board = $(".board");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		// a태그가 가지고 있는 페이지 번호 추출
		let pageNo = $(this).data("page");	// data-page
		
		// 추출한 페이지 번호를 서버로 전송하기 위해 검색 영역으로 활용할 form 태그 내 추출된 페이지번호를 넣는다.
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
	
	board.on("click",function(){
		let boardNo = $(this).data("boardno");
		location.href="/board/detail.do?boardNo="+boardNo;
		
		
	});
	
});
	
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
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
									<p class="card-description">LIST</p>
									
									<form action="/crud/board/search" method="post">
										<input type="text" name="title" value="${board.title}" placeholder="제목으로 검색하세요." />
										<input type="submit" value="검색" />
									</form>
									
									<table class="table table-bordered">
										<tr>
											<td align="center" width="20%">번호</td>
											<td align="center" width="40%">제목</td>
											<td align="center" width="20%">작성자</td>
											<td align="center" width="20%">작성일</td>
										</tr>
										<c:choose>
											<c:when test="${empty boardList }">
												<tr>
													<td colspan="4">조회하실 게시물이 존재하지 않습니다.</td>											
												</tr>
											</c:when>
											<c:otherwise>
											<c:forEach items="${boardList }" var="board">
												<tr data-boardno=${board.boardNo } class="boardLine">
													<td>${board.boardNo }</td>										
													<td>${board.title}</td>										
													<td>${board.writer }</td>
													<td>
														<fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd HH:mm"/>
													</td>										
												</tr>
											</c:forEach>
											</c:otherwise>
										</c:choose>
									</table>
									<a href="/crud/board/register">등록</a>
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
	
	let btnRegister = $("#btnRegister");
	let btnList = $("#btnList");
	let board = $("#board");
	let boardLine = $(".boardLine");
	
	
	boardLine.on("click", function(){
		let link = $(this).data("boardno");
// 		alert($(this).data("boardno"));
		location.href = `/crud/board/read?boardNo=\${link }`;
	});
	
	// 등록 버튼 이벤트
	btnRegister.on("click", function(){
		alert("등록버튼체킁이라구?");
		
		let title = $("#title").val();			// 제목 값
		let writer = $("#writer").val();		// 작성자 값
		let content = $("#content").val();		// 내용 값
		
		if(title == null || title == "") {
			alert("제목을 입력해주세요!");
			return false;
		}
		
		if(writer == null || writer == "") {
			alert("작성자를 입력해주세요!");
			return false;
		}
		
		if(content == null || content == "") {
			alert("내용을 입력해주세요!");
			return false;
		}
		board.submit();
	});
	
	
	// 목록 버튼 이벤트
	btnList.on("click", function(){
		alert("목록버튼체킁");
		location.href = "/crud/board/list";
	});
	
});

</script>
</html>
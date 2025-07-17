<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.108.0">
<title>DDIT BOARD LIST</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/album/">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}
</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<body>
	<header>
		<div class="collapse bg-dark" id="navbarHeader">
		</div>
		<div class="navbar navbar-dark bg-dark shadow-sm">
			<div class="container"></div>
		</div>
	</header>
	<main>
		<section class="py-1 text-center container">
			<div class="row py-lg-4">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">DDIT 상세보기</h1>
				</div>
			</div>
		</section>
		<section class="py-1 container">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<!-- 삭제 숨겨두기 delete 주소로 boNo 넘겨주고 삭제 시키기-->
						<form action="/tagboard/delete" method="post" id="delForm">
							<input type="hidden" name="boNo" value="${tbVO.boNo }"/>
						</form>
						<div class="card-header">제목 ${tbVO.boTitle }</div>
						<div class="card-body">[작성자] ${tbVO.boWriter } | [작성일] <fmt:formatDate value="${tbVO.boDate }" pattern="yyyy-MM-dd HH:mm"/> | [조회수] ${tbVO.boHit }</div>
						<div class="card-body">
							내용<br />
							${tbVO.boContent }	
						</div>
						<div class="card-body">
							 <c:if test="${tbVO.tagList[0].tagName ne null }">
								<c:forEach items="${tbVO.tagList }" var="tag">
									<span class="badge bg-success"># ${tag.tagName }</span>
								</c:forEach>
							</c:if>
						</div>
						
						<div class="card-footer">
							<button type="button" class="btn btn-warning" id="modifyBtn">수정</button>
							<button type="button" class="btn btn-danger" id="delBtn">삭제</button>
							<button type="button" class="btn btn-info" id="listBtn" onclick="javascript:location.href='/tagboard/list'">목록</button>
						</div>
						${msg }
					</div>
				</div>
			</div>
		</section>
	</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">
$(function(){
	
// 	alert("디테일페이징");
	
	let modifyBtn = $("#modifyBtn");
	let delBtn = $("#delBtn");
	let delForm = $("#delForm");
	
	modifyBtn.on("click", function(){
		delForm.attr("action", "/tagboard/update");
		delForm.attr("method", "get");
		delForm.submit();
	});
	
	delBtn.on("click", function(){
		if(confirm("삭제하시겠습니까?")){
			delForm.submit();
		}
	});
	
});
</script>

</html>
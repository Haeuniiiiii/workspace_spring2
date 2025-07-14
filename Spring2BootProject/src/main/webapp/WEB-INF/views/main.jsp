<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>DDIT BOARD</title>
<%@ include file="skydash/headPart.jsp" %>
</head>
<body>
	<div class="container-scroller">
		<%@ include file="skydash/header.jsp" %>
		<div class="container-fluid page-body-wrapper">
			<%@ include file="skydash/aside.jsp" %>
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-12 grid-margin">
							<div class="row">
								<div class="col-12 col-xl-8 mb-4 mb-xl-0">
									<h3 class="font-weight-bold">대덕인재개발원 306호 CRUD 기본기부터!</h3>
									<h6 class="font-weight-normal mb-0">#연습 #반복 #해보기 #또해보기 #계속해보기! #연습만이 #살길이다!</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 grid-margin stretch-card">
							<div class="card tale-bg">
								<div class="mt-auto">
									<img src="${pageContext.request.contextPath }/skydash/images/debug.png" alt="debug">
								</div>
							</div>
						</div>
					</div>
				</div>
				<%@ include file="skydash/footer.jsp" %>
			</div>
		</div>
	</div>

	<%@ include file="skydash/footerPart.jsp" %>
</body>
</html>
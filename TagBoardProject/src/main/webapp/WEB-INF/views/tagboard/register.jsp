<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DDIT BOARD LIST</title>
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
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
					<h1 class="fw-light">DDIT 등록</h1>
				</div>
			</div>
		</section>
		<section class="py-1 text-center container">
			<form class="album py-1 bg-light" action="/tagboard/register" method="post" id="dditboard">
			<!-- 시작은 등록 -->
			<c:set value="등록" var="btnText"/>
			<!-- 만약 서버에서 받은 status가 u라면 수정 btn -->
			<c:if test="${status eq 'u' }">
				<c:set value="수정" var="btnText"/>
				<input type="hidden" name="boNo" value="${tbVO.boNo }"/>
			</c:if>
				<div class="">
					<div class="container">
						<div class="card-body">
							<div class="input-group input-group-lg">
								<span class="input-group-text" id="inputGroup-sizing-lg">제목</span>
								<input type="text" id="boTitle" class="form-control" name="boTitle" value="${tbVO.boTitle }"/>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-text" id="inputGroup-sizing-lg">작성자</span>
								<input type="text" id="boWriter" class="form-control" name="boWriter" value="${tbVO.boWriter }"/>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-text" id="inputGroup-sizing-lg">내용</span>
								<textarea class="form-control" aria-label="With textarea" rows="12" name="boContent" id="boContent">${tbVO.boContent }</textarea>
							</div>
							<div class="input-group input-group-lg">
								<span class="input-group-text" id="inputGroup-sizing-lg">태그</span>
								<input type="text" class="form-control" name="tagNm" 
									<c:if test="${tbVO.tagList[0].tagNm eq null }" >
										value="${tags }"
									</c:if>
								/>
							</div>
						</div>
						<div class="card-footer" align="right">
							<button type="button" class="btn btn-primary" id="registerBtn">${btnText }</button>
							<button type="button" class="btn btn-info" id="listBtn" onclick="javascript:location.href='/tag/list'">목록</button>
						</div>
					</div>
				</div>
			</form>
		</section>
	</main>
	<script src="${pageContext.request.contextPath }/assets/dist/js/bootstrap.bundle.min.js"></script>
</body>

<script type="text/javascript">
$(function(){
	
    let dditboard = $("#dditboard");
    let registerBtn = $("#registerBtn");

    registerBtn.on("click", function(){
        let title = $("#boTitle").val();
        let writer = $("#boWriter").val();
        let content = $("#boContent").val();
        let tagNm = $("#tagNm").val();

        if (!title) { 
        	alert("제목을 입력하세요!"); 
        	return false; 
        }
        
        if (!writer) { 
        	alert("작성자를 입력하세요!"); 
        	return false; 
        }
        
        if (!content) { 
        	alert("내용을 입력하세요!"); 
        	return false; 
        }
        
//         if (!tagNm) { 
//         	alert("하나라도 입력해주세요...!!!"); 
//         	return false; 
//         }

//         let tagList = tagNm.split(/\s+/); // 공백 기준으로 자르기
//         console.log(tagList); // 확인용

        dditboard.submit();
    });
});
</script>
</html>
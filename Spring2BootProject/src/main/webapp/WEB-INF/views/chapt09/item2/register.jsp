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
									<h4 class="card-title">Chapt09</h4>
								</div>									
								<div class="card-body">
									<p class="card-description">FILEUPLOAD REGISTER</p>
									<form action="/item2/register" method="post" enctype="multipart/form-data" id="item">
										<table class="table table-bordered">
											<tr>
												<td>상품명</td>
												<td>
													<input class="form-control" type="text" name="itemName" id="itemName" />
												</td>										
											</tr>
											<tr>
												<td>가격</td>
												<td>
													<input class="form-control" type="text" name="price" id="price" />
												</td>										
											</tr>
											<tr>
												<td>파일</td>
												<td>
													<input type="file" name="picture" id="inputFile" />
													<div class="uploadedList">
														<!-- 업로드된 사진이 쌓일 공간 , 비동기방식 -->
													</div>
												</td>										
											</tr>
											<tr>
												<td>개요</td>
												<td>
													<textarea class="form-control" rows="5" cols="20" name="description"></textarea>
												</td>										
											</tr>
										</table>
										<br />
										<button class="btn btn-primary" type="submit">REGISTER</button>
										<button class="btn btn-success" type="button" onclick="javascript:location.href='/item2/list'">LIST</button>
									</form>
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
	
	let inputFile = $("#inputFile");		// open 파일을 위한 element
	let item = $("#item");					// form에 대한 element
	
	inputFile.on("change", function(e){
		console.log("체인지이벤트!");
		
		let files = e.target.files;
		let file = files[0];
		
		console.log(file);
		
		let formData = new FormData();
		formData.append("file", file);	// 서버야, key, value 받아랑..
		
		$.ajax({
			url : "/item2/uploadFile"
			, type : "post"
			, contentType : false
			, processData : false
			, data : formData	// 서버야 파일보낼겨..
			, dataType : "text" // 미디어타입
			, success : function(result){
				console.log(result);
				
				let html = "";
				if(checkImageType(result)) {
					// 이미지라면 이미지태그를 이용하여 출력
					html = "<div><br/>";
					html += "	<a href='/item2/displayFile?fileName=" + result +"'>";
					html += "	<img style='width:200px; border-radius:0%; height:200px;' src='/item2/displayFile?fileName=" + getThumbnailName(result) + "'>";
					html += "	</a>";
					html += "	<span class='btn btn-danger'>X</span>";
					html += "</div>";
				} else {
					// 파일이면 파일명에 대한 링크로만 출력
					html = "<div><br/>";
					html += "	<a href='/item2/displayFile?fileName=" + result +"'>";
					html += "		" + getOriginalName(result);
					html += "	</a>";
					html += "	<span class='btn btn-danger'>X</span>";
					html += "</div>";
				}
				$(".uploadedList").append(html);
			},
			error : function(error, status, thrown){
				console.log(error);
				console.log(status);
				console.log(thrown);
			}
		});
		
	});
	
	
	// 업로드한 이미지 또는 파일의 X 버튼 클릭
	$(".uploadedList").on("click", "span", function(){
		// 살아있는애 객체 찾고 그안에 이벤트 먹인다
		$(this).parent("div").remove();
	});
	
	item.submit(function(){
		let html = "";
		$(".uploadedList a").each(function(index){ // a태그에 index
			let value = $(this).attr("href");
			value = value.substr(28); 				// '?fileName=' 다음에 나오는 값
			
			html += "<input type='hidden' name='files["+index+"]' value='"+value+"'/>";
		});
		
		$(this).append(html);
	});
	
	
	// 이미지 파일인지 확인
	function checkImageType(fileName) {
		let pattern = /jpg|gif|png|jpeg/i;
		return fileName.match(pattern);	// 패턴과 일피하면 true(너 이미지구나?!)
	}
	
	// 임시 파일로 썸네일 이미지 만들기
	function getThumbnailName(fileName){
		let front = fileName.substr(0,12);	// /2025/07/16/ 폴더
		let end = fileName.substr(12);		// 뒤 파일명
		return front + "s_" + end;			// 썸네일 이미지 파일명 생성
	}

	// 파일명 추출
	function getOriginalName(fileName){
		// 이미지 파일이면 return
		if(checkImageType(fileName)) {
			return;
		}
		
		let idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
});


</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<h3>동기방식으로 일반데이터 전송하기</h3>
	<form action="/bokhang01/register" method="post">
		상품명 : <input type="text" name="prodName" /><br/>
		상품브랜드 : <input type="radio" name="prodBrand" value="samsung" />Samsung&nbsp;
					<input type="radio" name="prodBrand" value="lg" />LG&nbsp;
					<input type="radio" name="prodBrand" value="apple" />Apple&nbsp; <br/>
		상품타입 : <input type="radio" name="prodType" value="notebook" />노트북&nbsp;
					<input type="radio" name="prodType" value="tablet" />테블릿&nbsp;
					<input type="radio" name="prodType" value="phone" />핸드폰&nbsp;<br/>
		상품크기 : <input type="text" name="prodSize" /><br/>
		상품설명 : <textarea rows="5" cols="10" name="prodDescript"></textarea><br/>
		<input type="submit" value="전송"/><br/>
	</form>
	
	<br/>
	
	<h3>동기방식으로 일반 + 파일데이터 전송하기</h3>
	<form action="/bokhang01/register2" method="post" enctype="multipart/form-data">
		상품명 : <input type="text" name="prodName" /><br/>
		상품이미지 : <input type="file" name="prodImage"/><br/>
		상품브랜드 : <input type="radio" name="prodBrand" value="samsung" />Samsung&nbsp;
				  <input type="radio" name="prodBrand" value="lg" />LG&nbsp;
				  <input type="radio" name="prodBrand" value="apple" />Apple&nbsp; <br/>
		상품타입 : <input type="radio" name="prodType" value="notebook" />노트북&nbsp;
				<input type="radio" name="prodType" value="tablet" />테블릿&nbsp;
				<input type="radio" name="prodType" value="phone" />핸드폰&nbsp;<br/>
		상품크기 : <input type="text" name="prodSize" /><br/>
		상품설명 : <textarea rows="5" cols="10" name="prodDescript"></textarea><br/>
		<input type="submit" value="전송"/><br/>
	</form>
	
	<br/>
	
	<h3># 비동기방식으로 일반데이터 전송하기</h3>
	<form id="registerForm">
		상품명 : <input type="text" name="prodName" id="prodName" /><br/>
		상품브랜드 : <input type="radio" name="prodBrand" class="prodBrand" value="samsung" />Samsung&nbsp;
				  <input type="radio" name="prodBrand" class="prodBrand"  value="lg" />LG&nbsp;
				  <input type="radio" name="prodBrand" class="prodBrand"  value="apple" />Apple&nbsp; <br/>
		상품타입 : <input type="radio" name="prodType" class="prodType"  value="notebook" />노트북&nbsp;
				<input type="radio" name="prodType" class="prodType"  value="tablet" />테블릿&nbsp;
				<input type="radio" name="prodType" class="prodType"  value="phone" />핸드폰&nbsp;<br/>
		상품크기 : <input type="text" name="prodSize" id="prodSize" /><br/>
		상품설명 : <textarea rows="5" cols="10" name="prodDescript" id="prodDescript" ></textarea><br/>
		<input type="button" value="전송" id="sendBtn"/><br/>
	</form>
	<div id="registerResult"></div>
	
	<hr/>
	
	<h3>4. 비동기방식으로 일반 + 파일데이터 전송하기</h3>
	<form id="registerForm2">
		상품명 : <input type="text" name="prodName" id="prodName2" /><br/>
		상품이미지 : <input type="file" name="prodImage" id="prodImage" /><br/>
		상품브랜드 : <input type="radio" name="prodBrand" class="prodBrand2" value="samsung" />Samsung&nbsp;
				  <input type="radio" name="prodBrand" class="prodBrand2" value="lg" />LG&nbsp;
				  <input type="radio" name="prodBrand"class="prodBrand2"  value="apple" />Apple&nbsp; <br/>
		상품타입 : <input type="radio" name="prodType" class="prodType2" value="notebook" />노트북&nbsp;
				<input type="radio" name="prodType" class="prodType2"  value="tablet" />테블릿&nbsp;
				<input type="radio" name="prodType" class="prodType2"  value="phone" />핸드폰&nbsp;<br/>
		상품크기 : <input type="text" name="prodSize" id="prodSize2" /><br/>
		상품설명 : <textarea rows="5" cols="10" name="prodDescript" id="prodDescript2" ></textarea><br/>
		<input type="button" value="전송" id="sendBtn2"/><br/>
	</form>
	<div id="registerResult2"></div>
</body>
<script type="text/javascript">
$(function(){
	let sendBtn = $("#sendBtn");
	let sendBtn2 = $("#sendBtn2");
	
	sendBtn.on("click", function(){
		// 입력받은 input 요소의 값들을 JSON "객체{중괄호}"로 만든다.
		// 이벤트 스코프와 객체데이터의 스코프가 다르다
// 		alert("체킁킁")
		let prodName = $("#prodName").val();
		
		let dataObject = {
			// key : value
			 prodName : prodName
			,prodBrand : $(".prodBrand").val()
			,prodType : $(".prodType").val()
			,prodSize : $("#prodSize").val()
			,prodDescript : $("#prodDescript").val()
			
		};
		
		$.ajax({
			url : "/bokhang01/ajax/register"
			,type: "post"
			,contentType : "application/json; charset=utf-8"
			,data: JSON.stringify(dataObject)
			,success : function(result){
				if(result === "OK") {
					$("#registerResult").append(`\${prodName } 상품 등록이 완료되었습니다!<br />`);
				}
			},
			error : function(){
				
			},
		});
	});
	
	sendBtn2.on("click", function(){
		// 입력받은 input 요소의 값들을 JSON "객체{중괄호}"로 만든다.
// 		alert("체킁킁")
		let prodName = $("#prodName2").val();
		
		// 파일을 보내려면 무조건 formData
		let formData = new FormData();
		// 무조건 세팅하고 봐라
		formData.append("prodName", prodName);
		formData.append("prodImage", $("#prodImage")[0].files[0]);
		formData.append("prodBrand", $(".prodBrand2").val());
		formData.append("prodSize", $(".prodSize2").val());
		formData.append("prodType", $("#prodType2").val());
		formData.append("prodDescript", $("#prodDescript2").val());
		
		$.ajax({
			url : "/bokhang01/ajax/register2"
			,type: "post"
			,data: formData	
			,contentType : false
			,processData : false
			,success : function(result){
				if(result === "OK") {
					$("#registerResult2").append(`\${prodName } 상품 등록이 완료되었습니다!<br />`);
				}
			},
			error : function(){
				
			},
		});
	});
});
</script>
</html>








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 Form</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
td {
	border:1px solid black;
}
</style>
</head>
<body>
<!-- 
		문제01) 회원가입 양식을 만들고 서버로 전송해주세요.
			항 목		|	name							|		value
		───────────────────────────────────────────────────────────────────────────
			아이디	|	userId 							|
			비밀번호	|	password  						|
			이름		|	userName 						|
			이메일	|	eamil 							|
			생년월일	|	dateOfBirth 					|
			성별		|	gender							|	남자(male), 여자(female)
		개발자 여부	|	developer						|	개발자(Y), 비개발자(null)
		외국인 여부	|	foreigner						|	외국인(true), 내국인(false)
			국적		|	nationality						|	대한민국(korea),독일(germany),캐나다(canada),미국(usa)
			소유차량	|	cars, carArray, carList			|	BMW,AUDI,VOLVO,JEEP
			취미		|	hobby, hobbyArray, hobbyList	|	운동(sports),독서(book),영화감상(movie),음악감상(music)
			우편번호	|	postCode						|
			주소		|	location						|
		카드1-번호		|	no								|
		카드1-유효년월	|	validMonth						|	날짜 데이터
		카드2-번호		|	no								|
		카드2-유효년월	|	validMonth						|	날짜 데이터
			소개		|	introduction					|
		───────────────────────────────────────────────────────────────────────────
		** 사용 변수 및 타입은 자유
		문제02) 입력한 데이터를 '/chapt05/test/result'로 전송해주세요. (result.jsp는 'chapt05/test/result.jsp')
 -->

<div>
	<h3>Register Form</h3>
	<form action="/chapt05/test/result" method="post" id="testForm">
		<table style="border:2px solid black;">
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="userId" id="userId" placeholder="아이디를 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="userName" id="userName" placeholder="이름을 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="email" id="email" placeholder="이름을 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>
					<input type="text" name="birthDay" id="birthDay" placeholder="생년월일을 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td >성별</td>
				<td>
					<input type="radio" name="gender" id="gender" value="male" checked="checked" /> 남자
					<input type="radio" name="gender" id="gender" value="female"/> 여자
				</td>
			</tr>
			<tr>
				<td >개발자 여부</td>
				<td>
					<input type="checkbox" name="developer" id="developer" value="Y"/> 개발자
				</td>
			</tr>
			<tr>
				<td >외국인 여부</td>
				<td>
					<input type="checkbox" name="foreigner" id="foreigner" value="true" /> 외국인
				</td>
			</tr>
			<tr>
				<td >국적</td>
				<td>
					<select name="nationality">
						<option value="korea">대한민국</option>
						<option value="germany">독일</option>
						<option value="austrailia">호주</option>
						<option value="canada">캐나다</option>
						<option value="usa">미국</option>
					</select>
				</td>
			</tr>
			<tr>
				<td >소유차량</td>
				<td>
					<select name="cars" multiple="multiple">
						<option value="bmw">BMW</option>
						<option value="jeep">JEEP</option>
						<option value="audi">AUDI</option>
						<option value="volvo">VOLVO</option>
					</select>
				</td>
			</tr>
			<tr>
				<td >취미</td>
				<td>
					<input type="checkbox" id="hobby" name="hobby" value="sports" /> Sports
					<input type="checkbox" id="hobby"  name="hobby" value="music" /> Music
					<input type="checkbox" id="hobby"  name="hobby" value="movie" /> Movie
				</td>
			</tr>
			<tr>
				<td >우편번호</td>
				<td>
					<input type="text" name="postCode" id="postCode" placeholder="우편번호를 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td >주소</td>
				<td>
					<input type="text" name="location" id="location" placeholder="주소를 입력해주세요." />
				</td>
			</tr>
			<tr>
				<td >카드1 - 번호</td>
				<td>
					<input type="text" name="no1" />
				</td>
			</tr>
			<tr>
				<td >카드1 - 유효년월</td>
				<td>
					<input type="text" name="validMonth1" />
				</td>
			</tr>
			<tr>
				<td >카드2 - 번호</td>
				<td>
					<input type="text" name="no2" />
				</td>
			</tr>
			<tr>
				<td >카드2 - 유효년월</td>
				<td>
					<input type="text" name="validMonth2" />
				</td>
			</tr>
			<tr>
				<td >소개</td>
				<td>
					<input type="text" name="introduction" id="introduction" placeholder="자기소개를 입력해주세요." />
				</td>
			</tr>
		</table>
		<input type="submit" id="submitBtn" value="전송" />
		<button type="reset" id="resetBtn">리셋</button>
		<button type="button" id="testBtn">테스트</button>
	</form>
</div>
</body>
<script type="text/javascript">
$(function(){
	
	
	let submitBtn = $("#submitBtn");
	let testBtn = $("#testBtn");
	let hobby = $("#hobby").val();

	
})
		

</script>
</html>
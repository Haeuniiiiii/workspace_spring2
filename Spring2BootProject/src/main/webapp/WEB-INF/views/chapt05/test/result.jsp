<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	결과페이지<br/>
	유저ID ${member.userId }<br/>
	패스워드 ${member.password }<br/>
	이메일 ${member.email }<br/>
	생년월일 ${member.birthDay }<br/>
	성별 ${member.gender }<br/>
	개발자여부 ${member.developer }<br/>
	외국인여부 ${member.foreigner }<br/>
	국적 ${member.nationality }<br/>
	소유차량 ${member.cars }<br/>
	취미 ${member.hobby }<br/>
	우편번호 ${address.postCode }<br/>
	주소 ${address.location }<br/>
	카드1(번호) ${card.no1 }<br/>
	카드1(유효년월) ${card.validMonth1 }<br/>
	카드2(번호) ${card.no2 }<br/>
	카드2(유효년월) ${card.validMonth2 }<br/>
	소개 ${member.introduction }<br/>
<!-- 
[아래 결과처럼 출력해주세요.]
	
	유저ID			a001
	패스워드			1234
	이름				조현준
	E-MAIL			wh-guswns123@hanmail.net
	생년월일			2023년 08월 25일
	성별				남자
	개발자여부			개발자
	외국인여부			외국인
	국적				대한민국
	소유차량			소유차량 없음
	취미				운동 영화시청
	우편번호			45617
	주소				대전광역시 서구  오류동
	카드1(번호)		1451-1234-1234-1122
	카드1(유효년월)	2040년 09월 09일
	카드2(번호)		1234-1234-1234-1234
	카드2(유효년월)	2040년 09월 09일
	소개				반갑습니다
	
	** 조건
	- 선택한 성별에 따라 남자/여자로 나타내주세요.
	- 개발자 여부 체크에 따라 개발자/일반으로 나타내주세요.
	- 외국인 여부 체크에 따라 외국인/내국인으로 나타내주세요.
	- 국적에 따라 대한민국/독일/호주/캐나다로 나타내주세요.
	- 소유차량 선택에 따라 소유차량 없음/JEEP/VOLVO/BMW/AUDI로 나타내주세요.
		선택 갯수에 따라 아래처럼 출력해주세요.
		> 소유차량 없음
		> JEEP
		> JEEP VOLVO AUDI
	- 취미 선택에 따라 운동/영화시청/음악감상로 나타내주세요.
		선택 갯수에 따라 아래처럼 출력해주세요.
		> 취미 없음
		> 음악감상
		> 운동 영화시청
	- 날짜는 꼭 포멧을 지정해서 출력하지 않고 날짜 데이터만 출력해도 됩니다
 -->
 
 <div>
 	
 
 </div>
</body>
</html>
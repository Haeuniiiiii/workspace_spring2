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
									<p class="card-description">FILEUPLOAD MANUAL</p>
										[ 9장. 파일 업로드 ] <br />
										1. 파일업로드 설명 <br />
										- 서블릿 3.0에서 지원하는 파일 업로드 기능과 스프링 웹에서 제공하는 컴포넌트를 사용하여 파일을 업로드한다.<br /><br />
											
										# 파일 업로드 설정<br />
										1) 서블릿 3.0 이상 지원<br />
										2) 서블릿 표준 파일 업로드 기능을 활성화<br />
										3) 스프링 MVC와 연계<br />
										4) 업로드 된 파일 저장 위치 설정<br /><br />
										
										# 환경 설정<br />
										1) 의존 관계 정의<br />
										- 파일을 처리하기 위해서 의존 라이브러리를 추가한다.<br />
										- 스프링부트 프로젝트 초기 설정 시, 해당 dependency에 포함<br />
										> pom.xml commons-io 추가<br />
										> pom.xml commons-fileupload 추가<br /><br />
													
										2) application.properties 설정<br />
										- spring.servlet.multipart.max-file-size=10MB<br />
										- spring.servlet.multipart.max-request-size=12MB<br />
										- spring.servlet.multipart.max-file-size-threshould=12MB<br /><br />
										
										# 파일 업로드 경로 설정<br />
										1) 파일 업로드 외부 local 경로 설정<br />
										- config 패키지 내, FileConfiguration 클래스 생성<br />
										> 파일 업로드 외부 local 경로와 웹 경로를 맵핑하기 위한 설정<br /><br />
										
										# 데이터 베이스 준비<br />
										- item 테이블 생성 (item, item2, item2_attach)<br /><br />
										
										2. 이미지 업로드<br />
										- 한개의 이미지를 업로드 하는 기본 파일 업로드 기능을 구현합니다.<br /><br />
										
										# 파일 업로드 구현 설명<br />
										- 파일업로드 등록 화면 컨트롤러 만들기 (Chapter09FileUploadController)<br />
										- 파일업로드 등록 화면 컨트롤러 메서드 만들기 (itemRegisterForm:get)<br />
										- 파일업로드 등록 화면 만들기 (item/register.jsp)<br />
										- 여기까지 확인<br /><br />
										
										- 파일업로드 등록 기능 컨트롤러 메서드 만들기 (itemRegister:post)<br />
										- 파일업로드 등록 기능 서비스 인터페이스 메소드 만들기<br />
										- 파일업로드 등록 기능 서비스 클래스 메소드 만들기<br />
										- 파일업로드 등록 기능 Mapper 인터페이스 메소드 만들기<br />
										- 파일업로드 등록 기능 Mapper xml 쿼리 만들기<br />
										- 파일업로드 등록 완료 페이지 만들기<br />
										- 여기까지 확인<br /><br />
										
										- 파일업로드 목록 화면 컨트롤러 메서드 만들기 (itemList:get)<br />
										- 파일업로드 목록 화면 서비스 인터페이스 메소드 만들기<br />
										- 파일업로드 목록 화면 서비스 클래스 메소드 만들기<br />
										- 파일업로드 목록 화면 Mapper 인터페이스 메소드 만들기<br />
										- 파일업로드 목록 화면 Mapper xml 쿼리 만들기<br />
										- 파일업로드 목록 화면 만들기 (item/list.jsp)<br />
										- 여기까지 확인<br /><br />
										 
										- 파일업로드 수정 화면 컨트롤러 메서드 만들기 (itemModifyForm:get)<br />
										- 파일업로드 수정 화면 서비스 인터페이스 메소드 만들기<br />
										- 파일업로드 수정 화면 서비스 클래스 메소드 만들기<br />
										- 파일업로드 수정 화면 Mapper 인터페이스 메소드 만들기<br />
										- 파일업로드 수정 화면 Mapper xml 쿼리 만들기<br />
										- 파일업로드 수정 화면 만들기 (item/modify.jsp)<br />
										- 여기까지 확인<br /><br />
										
										- 파일업로드 수정 기능 컨트롤러 메서드 만들기 (itemModify:post)<br />
										- 파일업로드 수정 기능 서비스 인터페이스 메소드 만들기<br />
										- 파일업로드 수정 기능 서비스 클래스 메소드 만들기<br />
										- 파일업로드 수정 기능 Mapper 인터페이스 메소드 만들기<br />
										- 파일업로드 수정 기능 Mapper xml 쿼리 만들기<br />
										- 파일업로드 수정 완료 페이지 만들기<br />
										- 여기까지 확인<br /><br />
										
										- 파일업로드 삭제 화면 컨트롤러 메서드 만들기 (itemRemoveForm:get)<br />
										- 파일업로드 삭제 화면 서비스 인터페이스 메소드 만들기<br />
										- 파일업로드 삭제 화면 서비스 클래스 메소드 만들기<br />
										- 파일업로드 삭제 화면 Mapper 인터페이스 메소드 만들기<br />
										- 파일업로드 삭제 화면 Mapper xml 쿼리 만들기<br />
										- 파일업로드 삭제 화면 만들기 (item/remove.jsp)<br />
										- 여기까지 확인<br /><br />
										
										- 파일업로드 삭제 기능 컨트롤러 메서드 만들기 (itemRemove:post)<br />
										- 파일업로드 삭제 기능 서비스 인터페이스 메소드 만들기<br />
										- 파일업로드 삭제 기능 서비스 클래스 메소드 만들기<br />
										- 파일업로드 삭제 기능 Mapper 인터페이스 메소드 만들기<br />
										- 파일업로드 삭제 기능 Mapper xml 쿼리 만들기<br />
										- 파일업로드 삭제 완료 페이지 만들기<br />
										- 여기까지 확인<br /><br />
 									<button class="btn btn-primary" onclick="javascript:location.href='/item/list'">목록</button>
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
</html>
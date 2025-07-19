<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="./lModule/headerPart.jsp" %>
<body class="hold-transition ${bodyText }" >
	<div class="register-box">
		<div class="card card-outline card-danger mt-4 mb-4" id="card-signup">
			<div class="card-header text-center">
				<a href="" class="h1"><b>DDIT</b>BOARD</a>
			</div>
			<div class="card-body">
				<p class="login-box-msg">회원가입</p>
				
				<form action="/notice/signup.do" method="post" id="signupForm" enctype="multipart/form-data">
					<div class="input-group mb-3 text-center">
						<img class="profile-user-img img-fluid img-circle" id="profileImg"
							 src="/resources/dist/img/AdminLTELogo.png" alt="User profile picture"
							 style="width: 150px; height: 150px;">
					</div>
					<div class="input-group mb-3">
						<label for="inputDescription">프로필 이미지</label> 
					</div>
					<div class="input-group mb-3">
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="imgFile" id="imgFile"> 
							<label class="custom-file-label" for="imgFile">프로필 이미지를 선택해주세요</label>
						</div>
					</div>
					<div class="input-group mb-3">
						<label for="inputDescription">프로필 정보</label> 
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memId" name="memId" placeholder="아이디를 입력해주세요" value="${member.memId }"> 
						<span class="input-group-append">
							<button type="button" class="btn btn-secondary btn-flat" id="idCheckBtn">중복확인</button>
						</span>
						<span class="error invalid-feedback" style="display:block;">${errors.memId }</span>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memPw" name="memPw" placeholder="비밀번호를 입력해주세요">
						<span class="error invalid-feedback" style="display:block;">${errors.memPw }</span>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memName" name="memName" placeholder="이름을 입력해주세요" value="${member.memName }">
						<span class="error invalid-feedback" style="display:block;">${errors.memName }</span>
					</div>
					<div class="input-group mb-3">
						<div class="form-group clearfix">
							<div class="icheck-primary d-inline">
								<input type="radio" id="memGenderM" name="memGender" value="M" checked="checked">
								<label for="radioPrimary1">남자</label>
							</div>
							<div class="icheck-primary d-inline">
								<input type="radio" id="memGenderF" name="memGender" value="F">
								<label for="radioPrimary2">여자</label>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memEmail" name="memEmail" placeholder="이메일을 입력해주세요" value="${member.memEmail }">
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memPhone" name="memPhone" placeholder="전화번호를 입력해주세요" value="${member.memPhone }">
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memPostcode" name="memPostcode" readonly="readonly"> 
						<span class="input-group-append">
							<button type="button" class="btn btn-secondary btn-flat" onclick="DaumPostcode()">우편번호 찾기</button>
						</span>
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memAddress1" name="memAddress1" placeholder="주소를 입력해주세요" readonly="readonly">
					</div>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memAddress2" name="memAddress2" placeholder="상세주소를 입력해주세요">
					</div>
					<div class="input-group mb-3">
						<div id="map" style="width: 100%; height: 300px; display: none;"></div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="memAgree" name="memAgree" value="Y">
								<label for="memAgree"> 개인정보 사용을 동의해주세요 <a href="#">개인정보방침</a></label>
							</div>
						</div>
						<div class="col-4">
							<button type="button" class="btn btn-dark btn-block" id="signupBtn">가입하기</button>
						</div>
						<button type="button" class="btn btn-secondary btn-block mt-4">뒤로가기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="./lModule/footerPart.jsp" %>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f0b41a3f1563d6458e1548908ecf532d&libraries=services"></script>
<script type="text/javascript">
$(function(){
	
	let imgFile = $("#imgFile");			// 프로필 이미지 Element (input file)
	let profileImg = $("#profileImg");		// 이미지 태그 Element
	let idCheckBtn = $("#idCheckBtn");		// 중복 확인 Element
	let error = $(".error");				// error 메세지 출력을 위한 error 클래스 Element
	let idCheckFlag = false;				// 중복확인 flag(true: 중복체크 완료, false:중복체크 미완료)
	let memAddress2 = $("#memAddress2");	// 지도를 출력하기 위한 상세주소 Element
	let signupBtn = $("#signupBtn");		// 가입하기 버튼 Element
	let signupForm = $("#signupForm");		// 가입하기 Form Element
	
	// 정규표현식 설정에 대한 영역
	let regExpId = /^[a-z0-9]{4,12}$/;	// 아이디는 영소문자, 숫자조합으로 4-12자 설정
	let regExpPw = /^[^가-힣]{4,12}$/;	// 비밀번호는 영소대문자, 숫자, 특수문자 조합으로 4-12자 설정
	let regExpName = /^[가-힣]{2,5}$/;	// 이름은 한글로 2-5자 설정
	
	// 프로필 이미지 선택 이벤트
	imgFile.on("change", function(e){
		
		// 선택한 파일 가져오기
		let file = e.target.files[0];	
		
		// 이미지 파일 검증
		if(isImageFile(file)) {
			let reader = new FileReader();
			reader.onload = function(e){
				profileImg.attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{
			// 에러가 나면 스윗알러트창으로 알림창 띄우기
			sweetAlert("error", "이미지파일을 선택해주세요!");
		}
	});
	
	
	// 아이디 중복확인을 클릭했을 때 이벤트
	idCheckBtn.on("click", function(){
		let id = $("#memId").val(); // 아이디 입력 값
		
		// 만약에 false로 돌아오는 함수가 있다면 "빈값(에러메세지)"으로 초기화작업
		error.eq(0).html("");		
		
		// 아이디 입력 누락 및 정규식 설정
		if(id == null || id == "") {
			sweetAlert("error", "아이디를 입력해주세요!");
			return false;
		}else{
			if(!regExpId.test(id)){
				error.eq(0).html("아이디는 영소문자, 숫자 조합인 4-12자로 입력해주세요!");
				return false;
			}
		}
		
		
		$.ajax({
			url : "/notice/idCheck.do"
			, type : "post"
			, data : JSON.stringify({memId : id})
			, contentType : "application/json; charset=utf-8"
			, success : function(result) {
				console.log("아이디 중복확인 callback : " + result);
// 				let err = $(".error")[0];		// error 클래스를 가진 element 요소들 중 1개를 가져올 때 사용하자
				if(result === "NOTEXIST") {		// 아이디 사용 가능
					sweetAlert("success", "사용 가능한 아이디입니다!");
					error.eq(0).html("사용 가능한 아이디입니다.").css("color", "green");
					idCheckFlag = true;			// 아이디 중복확인했다는 flag 설정
				}else{							// 아이디 사용 불가
					sweetAlert("error", "이미 사용중인 아이디입니다!");
					error.eq(0).html("이미 사용중인 아이디입니다.").css("color", "red");
					idCheckFlag = false;		// 아이디 중복확인했다는 flag 설정
				}
			},
			error : function(error, status, thrown) {
				console.log(error);
				console.log(status);
				console.log(thrown);
			}
		});
	});
	
	// 상세주소 입력 후 focus가 out 되었을 때
	memAddress2.focusout(function(){
		let address1 = $("#memAddress1").val();		// 기본주소 입력 데이터
		let address2 = $("#memAddress2").val();		// 상세주소 입력 데이터
		
		// 두개의 주소를 합쳐서 지도 표시함
		// 지도는 기본주소가 필수로 입력되어있을 때 나타나야 하므로, 기본주소가 입력되었을 때
		if(address1 != null || address1 != "") {
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
			mapContainer.style.display = "block";			   // none이었던 지도 표시
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다 (두개의 주소를 합쳐서 주소를 전달함)
			geocoder.addressSearch(address1 + " " + address2, function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			    	 
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">HOME</div>'
			        });
			        infowindow.open(map, marker);
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			        
			    } // if end
			    
			}); // geocoder end
			
			// CSS 추가
			$("#card-signup").css("top", "140px");
		} // first if end 
		
	});
	
	// 가입하기 버튼 이벤트
	signupBtn.on("click", function(){
		let memFile = $("#imgFile")[0].files[0];	// 프로필 사진 데이터
		let memId = $("#memId").val();				// 아이디 입력 데이터
		let memPw = $("#memPw").val();				// 비밀번호 입력 데이터
		let memName = $("#memName").val();			// 이름 입력 데이터
		let memPostcode = $("#memPostcode").val();	// 우편번호 입력 데이터
		let memAddress1 = $("#memAddress1").val();	// 기본주소 입력 데이터
		let agreeFlag = true;						// 개인 정보 동의 flag("체크":true , "해제" false)
		
		// 사용자 아이디부터 개인정보 처리방침까지 입력하면서 에러메세지를 출력하게 되어있는데,
		// 이때, 사용자 아이디는 제외하고, 각 항목에 대한 에러메세지를 초기화("")해야하므로 idx 1번째 부터 초기화를 진행
		for(let i=1; i < error.length; i++) {
			error.eq(i).html("");
		}
		
		// 프로필 이미지 선택 검증
		if(memFile == null || memFile.size == 0) {
			sweetAlert("error", "프로필 이미지를 선택해주세요!");
			return false;
		}
		
		// 아이디 입력 검증
		if(memId == null || memId == "") {
			sweetAlert("error", "아이디를 입력해주세요!");
			return false;
		}else{
			// 아이디 정규표현식 검증(일치 : true -> false / 불일치 : false -> true)
			if(!regExpId.test(memId)) {
				error.eq(0).html("아이디는 영소문자, 숫자 조합으로 4-12자로 입력해주세요!");
				return false;
			}
		}
		
		// 비밀번호 입력 검증
		if(memPw == null || memPw == "") {
			sweetAlert("error", "비밀번호를 입력해주세요!");
			return false;
		}else{
			if(!regExpPw.test(memPw)) {
				error.eq(1).html("비밀번호는 영소/대문자, 숫자, 특수문자 조합으로 4-12자로 입력해주세요!");
				return false;
			}
		}
		
		// 이름 입력 검증
		if(memName == null || memName == "") {
			sweetAlert("error", "이름을 입력해주세요!");
			return false;
		}else{
			if(!regExpName.test(memName)) {
				error.eq(2).html("이름은 한글로 2-5자 입력해주세요!");
				return false;
			}
		}
		
		// 우편번호 입력 검증
		if(memPostcode == null || memPostcode == "") {
			sweetAlert("error", "우편번호를 입력해주세요!");
			return false;
		}
		
		// 기본주소 입력 검증
		if(memAddress1 == null || memAddress1 == "") {
			sweetAlert("error", "기본주소를 입력해주세요!");
			return false;
		}
		
		// 개인정보 체크 검증
		// 개인정보 처리방침을 동의하게 되면 체크가 되어있으므로 true, 체크하지 않으면 false
		let memAgree = $("#memAgree").is(":checked");
		if(!memAgree) {
			agreeFlag = false;		// 개인정보 처리방침 동의 체크 안함
		}
		
		// 정상적인 범주내의 입력이 완성되었다면
		// 개인정보 처리방침을 동의했습니까?
		// 아이디 중복체크를 이행하고 오셨습니까?
		// - 오셨다구요? 그럼 가입하기를 진행합니다.
		// - 안했어요? 그럼 가입하기를 할 수 없습니다.
		if(agreeFlag) {
			if(idCheckFlag) {
				console.log("가입하기 진행 가능합니다 :D ");
				signupForm.submit();
			}else{
				sweetAlert("error", "아이디 중복체크를 해주세요!");
			}
			
		}else{
			sweetAlert("error", "개인정보 동의를 체크해주세요!");
		}		
		
	});
	
});

// 이미지 파일인지 체크 (선택하파일받음)
function isImageFile(file) {
	let ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 가져옵니다.
	return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}

// daum 주소 API (주소 검색)
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('memPostcode').value = data.zonecode;
            document.getElementById("memAddress1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("memAddress2").focus();
        }
    }).open();
}

</script>
</html>

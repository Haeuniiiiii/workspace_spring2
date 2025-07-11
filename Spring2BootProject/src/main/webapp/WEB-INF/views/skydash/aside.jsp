<%@ page language="java" pageEncoding="UTF-8"%>
<style>
.spring2-sidebar-li{
	list-style-type: none; 
	margin-left:-30px;
}
</style>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
	<ul class="nav">
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="">
				<i class="icon-grid-2 menu-icon"></i>
				<span class="menu-title">SPRING01-CRUD</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="tables">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="/board/list.do">BOARD</a></li>
					<li class="nav-item"><a class="nav-link" href="/free/list.do">FREE</a></li>
					<li class="nav-item"><a class="nav-link" href="/notice/list.do">NOTICE</a></li>
					<li class="nav-item"><a class="nav-link" href="/login">LOGIN</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#tables" aria-expanded="false" aria-controls="">
				<i class="icon-grid-2 menu-icon"></i>
				<span class="menu-title">SPRING02-CRUD</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="tables">
				<ul class="nav flex-column sub-menu">
					<li class="nav-item"><a class="nav-link" href="/crud/board/list">BOARD</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#chapt04" aria-expanded="false" aria-controls="">
				<i class="icon-grid-2 menu-icon"></i>
				<span class="menu-title">CHAPT 04</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="chapt04">
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">void 타입</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0101">goHome0101</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/sub/goHome0102">goHome0102</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">String 타입</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0201">goHome0201</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0202">goHome0202</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/sub/goHome0203">goHome0203</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/sub/goHome0204">goHome0204</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">자바빈즈 클래스 타입</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0301">goHome0301</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">List 컬렉션 타입</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0401">goHome0401</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">Map 컬렉션 타입</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0501">goHome0501</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">ResponseEntity&#60;Void&#62; 타입</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0601">goHome0601</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">ResponseEntity&#60;String&#62; 타입</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt04/goHome0701">goHome0701</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#chapt05" aria-expanded="false" aria-controls="">
				<i class="icon-grid-2 menu-icon"></i>
				<span class="menu-title">CHAPT 05</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="chapt05">
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">컨트롤러 요청 처리</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt05/registerForm">Test Page</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">Ajax 요청 처리</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt05/ajax/registerForm">Test Page</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">파일업로드 Ajax 요청 처리</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt05/ajax/registerFileForm">Test Page</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#chapt06" aria-expanded="false" aria-controls="">
				<i class="icon-grid-2 menu-icon"></i>
				<span class="menu-title">CHAPT 06</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="chapt06">
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">Model</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt06/read01">read01</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt06/read02">read02</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt06/read03">read03</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt06/read04">read04</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">@modelattribute</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt06/modelattribute/form">Form</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">RedirectAttributes</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt06/redirectattribute/registerForm">Form</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#chapt07" aria-expanded="false" aria-controls="">
				<i class="icon-grid-2 menu-icon"></i>
				<span class="menu-title">CHAPT 07</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="chapt07">
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">JSP</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jsp/home0101">home0101</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jsp/home0201">home0201</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jsp/home0202">home0202</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jsp/home0301">home0301</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jsp/home0401">home0401</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">JSTL</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jstl/home0101">c:set</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jstl/home0201">c:if/when/otherwise</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jstl/home0301">c:forEach/Tokens</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jstl/home0401">c:import</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/jstl/home0501">c:redirect</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">fmttag</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/fmttag/home0101">formatNumber</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/fmttag/home0201">parseNumber</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/fmttag/home0301">formatDate</a></li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/fmttag/home0401">parseDate</a></li>
				</ul>
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">EL표현식</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/chapt07/el/home0101">EL함수-Total</a></li>
				</ul>
			</div>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="collapse" href="#fileupload" aria-expanded="false" aria-controls="">
				<i class="icon-grid-2 menu-icon"></i>
				<span class="menu-title">FILE UPLOAD</span>
				<i class="menu-arrow"></i>
			</a>
			<div class="collapse" id="fileupload">
				<ul class="nav flex-column sub-menu">
					<li class="spring2-sidebar-li">
						<font color="white">동기/비동기</font>
					</li>
					<li class="nav-item"><a class="nav-link" href="/fileupload/register">파일업로드</a></li>
					<li class="nav-item"><a class="nav-link" href="/fileupload/registerTest">파일업로드연습</a></li>
				</ul>
			</div>
		</li>
	</ul>
</nav>
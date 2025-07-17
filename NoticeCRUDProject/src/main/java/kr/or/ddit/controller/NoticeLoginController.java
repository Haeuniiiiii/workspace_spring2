package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeLoginController {

	// 로그인 페이지
	@GetMapping("/login.do")
	public String noticeLogin() {
		return "notice/login";
	}
	
	// 회원가입 페이지
	@GetMapping("/signup.do")
	public String noticeSignupForm() {
		return "notice/register";
	}
			
	// 아이디 & 비밀번호 찾기 페이지
	@GetMapping("/forget.do")
	public String noticeForgetIdAndPw() {
		return "notice/forget";
	}
	
}

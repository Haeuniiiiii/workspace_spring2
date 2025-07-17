package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeProfileController {

	// 마이페이지 화면
	@GetMapping("/profile.do")
	public String noticeForm() {
		return "notice/profile";
	}
	
}

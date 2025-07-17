package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeRetreiveController {
	
	@GetMapping("/list.do")
	public String noticeList() {
		return "notice/list";
	}
	
	@GetMapping("/detail.do")
	public String noticeDetail() {
		return "notice/detail";
	}

}

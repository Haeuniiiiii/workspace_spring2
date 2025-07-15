package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.controller.service.IBoardService;
import kr.or.ddit.vo.TagBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/tagboard")
public class TagBoardController {
	
	// DI 링거 주입
	@Autowired
	private IBoardService service;
	
	// get:register 페이지로 이동시키기 위한 컨트롤러
	@GetMapping("/register")
	public String tagBoard() {
		log.info("tagBoard() 실행!!!!");
		// 가라.. register 페이지로 viewresolver가 잡아줄것이다
		return "board/register";
	}
	
	// post:register 등록기능을 위한 컨트롤러
	@PostMapping("/register")
	public String tagBoardRegister(TagBoardVO tagBoardVO, Model model) {
		log.info("tagBoardRegister() 실행!!!!");
		
		service.insert(tagBoardVO);
		model.addAttribute("msg", "등록이 완료되었습니다!");
		
		return "board/detail";
	}
	
	// get:detail 페이지로 이동시키기 위한 컨트롤러
	@GetMapping("/detail")
	public String tagBoardDetail(int boNo, Model model) {
		log.info("tagBoardDetail() 실행!!!!");
			
		TagBoardVO tagBoard = service.detail(boNo);
		model.addAttribute("tagBoard", tagBoard);
		model.addAttribute("msg", "detailpage");
			
		return "board/detail";
	}
}

package kr.or.ddit.controller.free.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.controller.free.service.IFreeService;
import kr.or.ddit.vo.FreeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/free")
public class FreeInsertController {
	
	@Autowired
	private IFreeService freeService;

	// 일반게시판 등록 페이지
	@GetMapping("/form.do")
	public String freeForm() {
		log.info("freeForm() 실행.....!!!");
		return"free/form";
	}
	
	
	// 일반게시판 등록 기능 (setter메서드)
	@PostMapping("/insert.do")
	public String freeInsert(FreeVO freeVO, Model model) {
		log.info("freeInsert() 실행.....!!!");
		
		String goPage = "";
		int status = freeService.insert(freeVO);
		
		if(status > 0) { // 등록 성공
			goPage = "redirect:/free/" + freeVO.getFrNo();	// 등록 후 상세정보 페이지로 이동
		} else { // 등록 실패
			model.addAttribute("free", freeVO);
			goPage = "free/form";
		}
		return goPage;
	}
}

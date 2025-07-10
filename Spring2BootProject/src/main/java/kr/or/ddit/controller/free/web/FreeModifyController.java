package kr.or.ddit.controller.free.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.controller.free.service.IFreeService;
import kr.or.ddit.vo.FreeVO;
import lombok.extern.slf4j.Slf4j;

// 수정페이지, 수정기능, 삭제 기능을 처리할 컨트롤러
@Slf4j
@Controller
@RequestMapping("/free")
public class FreeModifyController {
	
	@Autowired
	private IFreeService freeService;
	
	// 자유게시판 상세정보 페이지
	@GetMapping("/{frNo}")
	public String freeDetail(@PathVariable int frNo, Model model) {
		log.info("freeDetail() 실행.....!!!");
		
		FreeVO freeVO = freeService.detail(frNo);
		
		model.addAttribute("free", freeVO);
		
		return "free/view";
		
	}
	
}

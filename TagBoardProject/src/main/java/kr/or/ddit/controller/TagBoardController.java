package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.controller.service.ITagBoardService;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.TagBoardVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/tagboard")
public class TagBoardController {
	
	// DI 링거 주입
	@Autowired
	private ITagBoardService service;
	
	// get:register 페이지로 이동시키기 위한 컨트롤러
	@GetMapping("/register")
	public String tagBoard() {
		log.info("tagBoard() 실행!!!!");
		// 가라.. register 페이지로 viewresolver가 잡아줄것이다
		return "tagboard/register";
	}
	
	// post:register 등록기능을 위한 컨트롤러
	@PostMapping("/register")
	public String tagBoardRegister(TagBoardVO tbVO, Model model) {
		log.info("tagBoardRegister() 실행!!!!");
		
		service.insert(tbVO);
		model.addAttribute("msg", "등록이 완료되었습니다!");
		
		return "redirect:/tagboard/detail?boNo=" + tbVO.getBoNo();
	}
	
	// get:detail 페이지로 이동시키기 위한 컨트롤러
	@GetMapping("/detail")
	public String tagBoardDetail(int boNo, Model model) {
		log.info("tagBoardDetail() 실행!!!!");
			
		TagBoardVO tbVO = service.detail(boNo);
		model.addAttribute("tbVO", tbVO);
		model.addAttribute("msg", "디테일 페이지입니다!");
			
		return "tagboard/detail";
	}
	
	
	// get:전체list를 가지고 오기 위한 컨트롤러
	@GetMapping("/list")
	public String tagBoardList(@RequestParam(name="page", required = false, defaultValue = "1") int currentPage	
							 , Model model) {
		PaginationInfoVO<TagBoardVO> pagingVO = new PaginationInfoVO<>();
		
		// 페이징 처리를 위한 과정 프로세스
		// 1. 현재 페이지 번호를 설정 후, 총 4가지 필드를 설정한다.
		// - startRow, endRow, startPage, endPage
		pagingVO.setCurrentPage(currentPage);

		
		// 2. 총 게시글 수를 설정 후, 총 페이지 수를 설정한다.
		// - totalPage
		int totalRecord = service.selectTagBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		// 3. 위와 같은 설정에 의해서 만들어진 필드를 기준으로 startRow ~ endRow 사이의 게시글 목록을 가져온다.
		// - dataList 
		// - 1페이지에 해당하는 screenSize만큼의 게시글 목록
 		List<TagBoardVO> dataList = service.selectTagBoardList(pagingVO);
 		pagingVO.setDataList(dataList);
 		
 		model.addAttribute("pagingVO", pagingVO);
 		
 		return "tagboard/list";
	}
	
	
	
}

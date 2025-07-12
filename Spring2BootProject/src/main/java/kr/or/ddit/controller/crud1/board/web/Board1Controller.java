package kr.or.ddit.controller.crud1.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.crud1.board.service.IBoard1Service;
import kr.or.ddit.vo.Board1VO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller // 컨트롤러 어노테이션을 붙임으로 서버가 런 하는 순간 자바빈으로 등록 됩니다!
@RequestMapping("/crud1/board")
public class Board1Controller {
	
	// DI 
	@Autowired
	private IBoard1Service boardService;
	
	// 일반게시판 등록 페이지
	@GetMapping("/form.do")
	public String board1Form() {
		log.info("board1Form() 실행.....!!!");
		return "crud1/board/form";
	}
	
	// 일반게시판 등록 기능 (setter메서드)
	@PostMapping("/insert.do")
	public String board1Insert(Board1VO board1VO, Model model) {
		log.info("board1Insert() 실행.....!!!");
		
		String goPage = "";
		int status = boardService.insert(board1VO);
		
		if(status > 0) { // 등록 성공
			goPage = "redirect:/crud1/board/" + board1VO.getBoNo();	// 등록 후 상세정보 페이지로 이동
		} else { // 등록 실패
			model.addAttribute("board", board1VO);
			goPage = "crud1/board/form";
		}
		return goPage;
	}
	
	// 일반게시판 상세정보 페이지
	@GetMapping("/{boNo}")
	public String board1Detail(@PathVariable int boNo, Model model) {
		log.info("board1Detail() 실행.....!!!");
		
		Board1VO board1VO = boardService.detail(boNo);
		
		model.addAttribute("board", board1VO);
		
		return "crud1/board/view";
	}
	
	// 일반게시판 수정 페이지
	@GetMapping("/update.do")
	public String board1UpdateForm(int boNo, Model model) {
		log.info("board1UpdateForm() 실행.....!!!");
		
		Board1VO board1VO = boardService.detail(boNo);
		
		model.addAttribute("board", board1VO);
		model.addAttribute("status", "u");
		
		return "crud1/board/form";
	}
	
	// 일반게시판 수정 기능
	@PostMapping("/update.do")
	public String board1Update(Board1VO boardVO, Model model) {
		log.info("board1Update() 실행.....!!!");
		
		String goPage = "";
		int status = boardService.update(boardVO);
		
		if(status > 0) { // 수정 성공
			goPage = "redirect:/crud1/board/" + boardVO.getBoNo();	// 수정 후 상세정보 페이지로 이동
		} else { // 수정 실패
			model.addAttribute("board", boardVO);
			model.addAttribute("status", "u");
			goPage = "crud1/board/form";
		}
		return goPage;
	}
	
//	@ResponseBody
//	@PostMapping("/update.do")
//	public ResponseEntity<String> board1Update(Board1VO board1vo) {
//		log.info("board1Update() 실행.....!!!");
//		log.info("no" + board1vo.getBoNo());
//		log.info("title" + board1vo.getBoTitle());
//		log.info("content" + board1vo.getBoContent());
//		
//		
//		
//		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//	}
	
	// 일반게시판 삭제 기능
	@PostMapping("/delete.do")
	public String board1Delete(int boNo, Model model) {
		log.info("board1Delete() 실행.....!!!");
		
		String goPage = "";
		int status = boardService.delete(boNo);
		
		if(status > 0) { // 삭제 성공
			goPage = "redirect:/crud1/board/list.do";	// 삭제 후 목록 페이지로 이동
		} else { // 삭제 실패
			goPage = "redirect:/crud1/board/" + boNo;
		}
		return goPage;
	}
	
	
	// 일반게시판 전체목록 조회
	@GetMapping("/list.do")
	public String boardList(@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
							,Model model) {
		PaginationInfoVO<Board1VO> pagingVO = new PaginationInfoVO<>();
		
		// 페이징 처리를 위한 과정 프로세스
		// 1. 현재 페이지 번호를 설정 후, 총 4가지 필드를 설정한다.
		// - startRow, endRow, startPage, endPage
		pagingVO.setCurrentPage(currentPage);

		
		// 2. 총 게시글 수를 설정 후, 총 페이지 수를 설정한다.
		// - totalPage
		int totalRecord = boardService.selectBoardCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		// 3. 위와 같은 설정에 의해서 만들어진 필드를 기준으로 startRow ~ endRow 사이의 게시글 목록을 가져온다.
		// - dataList 
		// - 1페이지에 해당하는 screenSize만큼의 게시글 목록
 		List<Board1VO> dataList = boardService.selectBoardList(pagingVO);
 		pagingVO.setDataList(dataList);
 		
 		model.addAttribute("pagingVO", pagingVO);
 		
 		return "crud1/board/list";
	}
	
	
}

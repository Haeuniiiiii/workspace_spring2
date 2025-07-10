package kr.or.ddit.controller.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.controller.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller // 컨트롤러 어노테이션을 붙임으로 서버가 런 하는 순간 자바빈으로 등록 됩니다!
@RequestMapping("/board")
public class BoardController {
	
	// DI 
	@Autowired
	private IBoardService boardService;
	
	// 일반게시판 등록 페이지
	@GetMapping("/form.do")
	public String boardForm() {
		log.info("boardForm() 실행.....!!!");
		return "board/form";
	}
	
	// 일반게시판 등록 기능 (setter메서드)
	@PostMapping("/insert.do")
	public String boardInsert(BoardVO boardVO, Model model) {
		log.info("boardInsert() 실행.....!!!");
		
		String goPage = "";
		int status = boardService.insert(boardVO);
		
		if(status > 0) { // 등록 성공
			goPage = "redirect:/board/" + boardVO.getBoNo();	// 등록 후 상세정보 페이지로 이동
		} else { // 등록 실패
			model.addAttribute("board", boardVO);
			goPage = "board/form";
		}
		return goPage;
	}
	
	// 일반게시판 상세정보 페이지
	@GetMapping("/{boNo}")
	public String boardDetail(@PathVariable int boNo, Model model) {
		log.info("boardDetail() 실행.....!!!");
		
		BoardVO boardVO = boardService.detail(boNo);
		
		model.addAttribute("board", boardVO);
		
		return "board/view";
	}
	
	// 일반게시판 수정 페이지
	@GetMapping("/update.do")
	public String boardUpdateForm(int boNo, Model model) {
		log.info("boardUpdateForm() 실행.....!!!");
		
		BoardVO boardVO = boardService.detail(boNo);
		
		model.addAttribute("board", boardVO);
		model.addAttribute("status", "u");
		
		return "board/form";
	}
	
	// 일반게시판 수정 기능
	@PostMapping("/update.do")
	public String boardUpdate(BoardVO boardVO, Model model) {
		log.info("boardUpdate() 실행.....!!!");
		
		String goPage = "";
		int status = boardService.update(boardVO);
//		System.out.println("status"+ status);
		
		if(status > 0) { // 수정 성공
			goPage = "redirect:/board/" + boardVO.getBoNo();	// 수정 후 상세정보 페이지로 이동
		} else { // 수정 실패
			model.addAttribute("board", boardVO);
			model.addAttribute("status", "u");
			goPage = "board/form";
		}
		return goPage;
	}
	
	// 일반게시판 삭제 기능
	@PostMapping("/delete.do")
	public String boardDelete(int boNo, Model model) {
		log.info("boardDelete() 실행.....!!!");
		
		String goPage = "";
		int status = boardService.delete(boNo);
		
		if(status > 0) { // 삭제 성공
			goPage = "redirect:/board/list.do";	// 삭제 후 목록 페이지로 이동
		} else { // 삭제 실패
			goPage = "redirect:/board/" + boNo;
		}
		return goPage;
	}
	
	
	// 일반게시판 전체목록 조회
	@GetMapping("/list.do")
	public String boardList(@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
							,Model model) {
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<>();
		
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
 		List<BoardVO> dataList = boardService.selectBoardList(pagingVO);
 		pagingVO.setDataList(dataList);
 		
 		model.addAttribute("pagingVO", pagingVO);
 		
 		return "board/list";
 		
	}
	
	
}

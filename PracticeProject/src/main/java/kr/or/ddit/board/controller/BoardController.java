package kr.or.ddit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.board.ServiceResult;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	
	/*
		#User-Agent 정보
		[형태 : Mozilla 정보/버전 + 운영체제 정보 + 브라우저 정보 + 브라우저 렌더링 엔진 정보 + 브라우저 버전 정보]
		User-Agent는 위와 같이 사용자의 운영체제, 브라우저 정보 등을 가지고 있으므로 파일 다운로드, 수집 정보 
		등을 핸들링 할 때 활용도가 높은 정보입니다.
		
		#Accept 
		클라이언트가 서버로부터 어떤 ContentType(MimeType)의 데이터를 받을 수 있는지를 서버에게 알려주는 
		역할을 합니다.
		즉, 클라이언트가 처리할 수 있는 데이터 형식을 서버에게 명시적으로 전달합니다.
		[ex) Accept : text/html, application/xhtml+xml, application/xml;q=0.9 ...]
		- Html 문서 가장 선호 뒤로 갈수록 우선순위 떨어짐 1이 가장높음 XMl은 우선순위가 조금 하위..		
	 */
		
	@Autowired
	private IBoardService service;
	
	@RequestMapping("/list.do")
	public String boardList(
			/*
			 * @RequestParam 클라이언트가 요청한 URL에 포함된 쿼리 파라미터 값을 매개변수로 쉽게 받아오기 위해서...
			 *  사용자가 페이지 번호나 검색 조건을 입력했을 때 그 값을 컨트롤러에서 처리할 수 있도록 연결해주는 역할...
			 */
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord,
			Model model 
			) {
			PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<>();
		
			if(StringUtils.isNotBlank(searchWord)) {	// 검색한 단어가 있다면 
				pagingVO.setSearchType(searchType);	
				pagingVO.setSearchWord(searchWord);
				model.addAttribute("searchType", searchType);
				model.addAttribute("searchWord", searchWord);
			}
			
			// 현재 페이지를 가져와야 startRow, endRow, startPage, endPage가 결정된다.
			pagingVO.setCurrentPage(currentPage);
			
			// 총 게시글 수 가져오기 
			int totalRecord = service.selectBoardCount(pagingVO); //검색 조건을 함께 전달하기 위해서 PagingVO를 파라미터로 넘김 
			pagingVO.setTotalRecord(totalRecord);
			
			// 해당 페이지에 맞는 게시글 가져오기 
			List<BoardVO> dataList = service.selectBoardList(pagingVO);
			pagingVO.setDataList(dataList);
			
			model.addAttribute("pagingVO", pagingVO);
			
		return "board/list";
	}
	
	@GetMapping("/detail.do")
	public String boardDetail(int boardNo, Model model) {
		log.info("boardNo ::: {}" , boardNo);
		BoardVO	detailVO = service.selectBoardDetail(boardNo);
		model.addAttribute("detailVO", detailVO);
		return "board/detail";
	}
	
	@ResponseBody // ResponseEntity은 해당 어노테이션을 붙이지 않아도 되지만 명시적으로 써준다.
	@PostMapping("/delete.do")
	// 클라이언트에서 JSON 형식으로 전달한 boardNo 값을 Jackson 라이브러리가 BoardVO 객체로 변환해 바인딩한다.
	// 이때 BoardVO 클래스에 boardNo 필드와 해당하는 setter 메서드가 있어야 정상적으로 매핑된다.
	public ResponseEntity<String> boardDelete(@RequestBody BoardVO boardVO){
		ResponseEntity<String> result = null;
		log.info("boardVO ::: {}", boardVO);
		
		ServiceResult serviceResult = service.deleteBoard(boardVO);
		/*	
		 * 	│ 비교 방식       │ 의미           │ 사용 대상                                               
			──────────────────────────────────────────────────────────────────────────────────────────────────
			│ 	`==`        │ 주소(참조값) 비교	│ 기본형(int, boolean...) 또는 같은 객체 인스턴스를 참조할 경우에만 사용 
			──────────────────────────────────────────────────────────────────────────────────────────────────
			│ `.equals()` 	│ 값(내용)비교    	│ String, Enum, 사용자 정의 클래스 등 객체 값 비교할 때 사용            
		 */
		if(serviceResult.equals(ServiceResult.OK)) {  // service 에서 넘어온 값이 OK db 작업이 성공적으로 실행 된 경우!
			result = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} else {									  // 그렇지 않다면!!
			result = new ResponseEntity<String>("FAIL", HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	@GetMapping("/insert.do")
	public String boardInsertForm(){
		return "/board/registForm";		
	}
	
	@ResponseBody
	@PostMapping("insert.do")
	public Map<String, Object> boardInsert(@RequestBody BoardVO boardVO){
		log.info("boardVO ::: {} ", boardVO );
		
		Map<String, Object> resultMap = new HashMap<>();
		ServiceResult serviceResult = service.insertBoard(boardVO);
		
		if(serviceResult.equals(ServiceResult.OK)) {
			resultMap.put("result", "SUCCESS");
			resultMap.put("boardNo", boardVO.getBoardNo());	// selectKey로 세팅된 값
			log.info("boardNo ::: {} ", boardVO.getBoardNo());
		} else {
			resultMap.put("result", "FAIL");
		}
		return resultMap;
	}
	
	@ResponseBody 								// json 형식으로 넘어온 데이터를 처리해줄 어노테이션이 필요해 !! 
	@PostMapping("/update.do")
	public ResponseEntity<BoardVO> boardModify(@RequestBody BoardVO boardVO){
		ResponseEntity<BoardVO> result = null;
		log.info("boardModify() 메서드 진입");
		log.info("boardVO ::: {}", boardVO);
		
		BoardVO updateBoardVO = null;
		
		ServiceResult serviceResult = service.updateBoard(boardVO);
		if(serviceResult.equals(ServiceResult.OK)) {
			updateBoardVO = service.selectBoardDetail(boardVO.getBoardNo());
			result = new ResponseEntity<BoardVO>(updateBoardVO, HttpStatus.OK);
		} 
		return result;
	}
}

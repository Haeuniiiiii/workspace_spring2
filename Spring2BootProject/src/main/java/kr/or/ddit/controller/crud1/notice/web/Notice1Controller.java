package kr.or.ddit.controller.crud1.notice.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.crud1.notice.service.INotice1Service;
import kr.or.ddit.vo.Board1VO;
import kr.or.ddit.vo.Notice1VO;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller // 컨트롤러 어노테이션을 붙임으로 서버가 런 하는 순간 자바빈으로 등록 됩니다!
@RequestMapping("/crud1/notice")
public class Notice1Controller {
	
	// 생성자를 통한 의존성 주입
	// 객체 생성 시 반드시 필요한 의존 객체를 주입받음
	@Autowired
	private INotice1Service notice1Service;
	
	// 공지사항 등록 페이지 주소를 요청했다면
	@GetMapping("/form.do")
	public String notice1Form() {
		// notice1Form()이 실행되고
		log.info("notice1Form() 실행....!!!");
		// crud1/notice/form.jsp 을 viewResolver에 보내서 페이지를 이동시킨다.
		return "crud1/notice/form";
	}
	
	
	// insert.do 주소 요청 시 등록 기능 실행
	// 등록은 등록된 결과만 필요하다
	// 등록을 하고 DB에서 내가 가져올건 없다! 일방통행
	// postMapping인 이유는 서버에 변경할 데이터가 있음을 알려준것
	@ResponseBody // 명시적으로 적어준..
	@PostMapping("/insert.do")
	public String notice1Insert(Notice1VO notice1VO, Model model) {
//	public ResponseEntity<String> notice1Form(@RequestBody Notice1VO notice1VO){
		log.info("notice1Insert() 실행....!!!");
		
		String goPage = "";
		// 성공여부를 확인할 수 있는 결과값 status
		int status = notice1Service.insert(notice1VO);
		
		// 성공한 결과 페이지의 상태코드를 담고 있는 hs
		
		
		// 만약에 등록이 성공했다면?
		if(status > 0) {
			// 상제 정보 페이지 (view)로 이동
			log.info("성공");
			goPage = "redirect:/crud1/notice/" + notice1VO.getNtNo();	// 등록 후 상세정보 페이지로 이동
		} else {
//			 만약에 등록이 실패했다면? addAttribute 하는 이유는 속성에 내가 보낼 데이터 이름을 정해서 브라우저에 보내는
			model.addAttribute("notice", notice1VO);
			log.info("실패!");
			goPage = "crud/notice.form";
		}
		return goPage;
		
		// 페이지를 리턴할건지?
		// 상태코드를 던져줄 것인지?
//		return "crud1/notice/form";
//		return new ResponseEntity<String>("OK", HttpStatus.OK);
		
	}
	
	// 공지사항 상세정보 페이지
	@GetMapping("/{ntNo}") // 단순한 조회만이니까 getMapping
	public String notice1Detail(@PathVariable int ntNo, Model model) {
		log.info("notice1Detail() 실행.....!!!");
		
		Notice1VO notice1VO = notice1Service.detail(ntNo);
		
		model.addAttribute("notice", notice1VO);
		
		return "crud1/notice/view";
	}
	
	// 공지사항 수정 페이지
	@GetMapping("/update.do")
	public String notice1UpdateForm(int ntNo, Model model) {
		log.info("notice1UpdateForm() 실행.....!!!");
		
		Notice1VO notice1VO = notice1Service.detail(ntNo);
		
		model.addAttribute("notice", notice1VO);
		model.addAttribute("status", "u");
		
		return "crud1/notice/form";
	}
	
	// 공지사항 수정 기능 로직
	@PostMapping("/update.do")
	public String notice1Update(Notice1VO notice1VO, Model model) {
		log.info("notice1Update() 실행.....!!!");
		
		String goPage = "";
		int status = notice1Service.update(notice1VO);
		
		if(status > 0) { // 수정 성공
			goPage = "redirect:/crud1/notice/" + notice1VO.getNtNo();	// 수정 후 상세정보 페이지로 이동
		} else { // 수정 실패
			model.addAttribute("notice", notice1VO);
			model.addAttribute("status", "u");
			goPage = "crud1/notice/form";
		}
		return goPage;
	}
	
	
	// 공지사항 삭제 기능 로직
	@PostMapping("/delete.do")
	public String notice1Delete(int ntNo, Model model) {
		log.info("notice1Delete() 실행.....!!!");
		
		String goPage = "";
		int status = notice1Service.delete(ntNo);
		
		if(status > 0) { // 삭제 성공
			goPage = "redirect:/crud1/notice/list.do";	// 삭제 후 목록 페이지로 이동
		} else { // 삭제 실패
			goPage = "redirect:/crud1/notice/" + ntNo;
		}
		return goPage;
	}
	
	
	// 공지사항 전체목록 조회 + 페이징 처리
	@GetMapping("/list.do")
	public String noticeList(@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
							,Model model) {
		PaginationInfoVO<Notice1VO> pagingVO = new PaginationInfoVO<>();
		
		// 페이징 처리를 위한 과정 프로세스
		// 1. 현재 페이지 번호를 설정 후, 총 4가지 필드를 설정한다.
		// - startRow, endRow, startPage, endPage
		pagingVO.setCurrentPage(currentPage);

		
		// 2. 총 게시글 수를 설정 후, 총 페이지 수를 설정한다.
		// - totalPage
		int totalRecord = notice1Service.selectNoticeCount(pagingVO);
		pagingVO.setTotalRecord(totalRecord);
		
		
		// 3. 위와 같은 설정에 의해서 만들어진 필드를 기준으로 startRow ~ endRow 사이의 게시글 목록을 가져온다.
		// - dataList 
		// - 1페이지에 해당하는 screenSize만큼의 게시글 목록
 		List<Notice1VO> dataList = notice1Service.selectNoticeList(pagingVO);
 		pagingVO.setDataList(dataList);
 		
 		model.addAttribute("pagingVO", pagingVO);
 		
 		return "crud1/notice/list";
	}

}

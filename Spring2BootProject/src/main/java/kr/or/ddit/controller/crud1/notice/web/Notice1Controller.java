package kr.or.ddit.controller.crud1.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.crud1.notice.service.INotice1Service;
//import kr.or.ddit.controller.crud1.notice.service.INotice1Service;
import kr.or.ddit.vo.Notice1VO;
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
		
		// 성공여부를 확인할 수 있는 결과값 status
		int status = notice1Service.insert(notice1VO);
		
		// 성공한 결과 페이지의 상태코드를 담고 있는 hs
		
		
		// 만약에 등록이 성공했다면?
		if(status > 0) {
			// 상제 정보 페이지 (view)로 이동
			model.addAttribute("notice", notice1VO);
			log.info("성공");
		} else {
//			 만약에 등록이 실패했다면? addAttribute 하는 이유는 속성에 내가 보낼 데이터 이름을 정해서 브라우저에 보내는
			log.info("실패!");
		}
		
		// 페이지를 리턴할건지?
		// 상태코드를 던져줄 것인지?
		return "crud1/notice/form";
//		return new ResponseEntity<String>("OK", HttpStatus.OK);
		
	}
	
	

}

package kr.or.ddit.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.service.INoticeService;
import kr.or.ddit.vo.NoticeMemberVO;
import lombok.extern.slf4j.Slf4j;


/**
 * <pre>
 * PROJ : NoticeCRUDProject
 * Name : NoticeLoginController
 * DESC : 공지사항 게시판 로그인/회원가입/id,pw찾기 관련 클래스
 * </pre>
 * 
 * @author [대덕인재개발원/카멜케이스] lhe
 * @version 1.0, 2025.07.18
 */
@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeLoginController {
	
	@Autowired
	private INoticeService noticeService;

	// 로그인 페이지
	@GetMapping("/login.do")
	public String noticeLogin(Model model) {
		model.addAttribute("bodyText", "login-page");
		return "notice/login";
	}
	
	// 회원가입 페이지
	@GetMapping("/signup.do")
	public String noticeSignupForm(Model model) {
		model.addAttribute("bodyText", "register-page");
		return "notice/register";
	}
	
	// 아이디 중복확인 페이지
	@ResponseBody
	@PostMapping("/idCheck.do")
	public ResponseEntity<ServiceResult> idCheck(@RequestBody Map<String, String> map) {
		log.info("LoginController.idCheck->id : " + map.get("memId"));
		// 입력받은 id와 일치하는 아이디가 존재할 때 'EXIST'를,
		// 아이디가 존재하지 않을때 'NOTEXIST'결과로 받아온다.
		ServiceResult result = noticeService.idCheck(map.get("memId"));
		return new ResponseEntity<ServiceResult>(result, HttpStatus.OK);
	}
	
	
	// 아이디&비밀번호 찾기 페이지
	@PostMapping("/signup.do")
	public String signup(NoticeMemberVO memberVO, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		Map<String, String> errors = new HashMap<>();
		if(StringUtils.isBlank(memberVO.getMemId())) {
			errors.put("memId", "아이디를 입력해주세요!");
		}
		if(StringUtils.isBlank(memberVO.getMemPw())) {
			errors.put("memPw", "비밀번호를 입력해주세요!");
		}
		if(StringUtils.isBlank(memberVO.getMemName())) {
			errors.put("memName", "이름을 입력해주세요!");
		}
		
		if(errors.size() > 0) {
			model.addAttribute("bodyText", "register-page");
			model.addAttribute("errors", errors);
			model.addAttribute("member", memberVO);
			goPage = "notice/register";
		}else {	// 정상적인 데이터
			ServiceResult result = noticeService.signup(memberVO);
			if(result.equals(ServiceResult.OK)) {	// 회원가입 성공
				ra.addFlashAttribute("message", "회원가입에 성공하셨습니다!");	// 일회성 메세지 전달
				goPage = "redirect:/notice/login.do";
			}else{	// 회원가입 실패
				model.addAttribute("bodyText", "register-page");
				model.addAttribute("message", "서버에러, 다시 시도해주세요!");
				model.addAttribute("member", memberVO);
				goPage = "notice/register";
			}
		}
		return goPage;
	}

	
	// 아이디 & 비밀번호 찾기 페이지
	@GetMapping("/forget.do")
	public String noticeForgetIdAndPw() {
		return "notice/forget";
	}
	
}

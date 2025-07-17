package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
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
import kr.or.ddit.vo.TagVO;
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

		// 계획... tagName : "태그1 태그2 태그3" (공백 자르기 문자열)
		service.insert(tbVO);
		model.addAttribute("msg", "등록 완료했습니까? 제발ㅋㅋ");
		
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
							 , @RequestParam(required = false, defaultValue = "title") String searchType
							 , @RequestParam(required = false) String searchWord
							 , Model model) {
		log.info("tagBoardList() 실행!!!!");
		PaginationInfoVO<TagBoardVO> pagingVO = new PaginationInfoVO<>();
		
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
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
	
	
	// get:수정버튼을 누르고 다시 등록폼을 가게
	@GetMapping("/update")
	public String tagBoardUpdateForm(int boNo, Model model) { // update할때 boNo가지고 조회
		log.info("tagBoardUpdateForm() 실행!!!!");
		
		// 상세 메서드로 먼저 확인하고 맞으면 수정
		TagBoardVO tbVO = service.detail(boNo);
		// 태그 담을 주머니
		List<TagVO> tagList = tbVO.getTagList();
		
		String tagName = "";
		for (TagVO tag : tagList) {
			tagName += tag.getTagName() + " ";
		}
		
		model.addAttribute("tagName", tagName);
		model.addAttribute("tbVO", tbVO);
		model.addAttribute("status", "u"); // status u 속성주기
		model.addAttribute("msg", "디테일 페이지입니다!");
			
		return "tagboard/register";
	}
	
	
	// post: 수정기능, 태그들도 수정이 되게
	@PostMapping("/update")
	public String tagBoardUpdate(TagBoardVO tbVO, String tagName) {
	    // 수정도 마찬가지로 문자열 태그 리스트로 변환
	    List<TagVO> tagList = new ArrayList<>();
	    if(tagName != null && !tagName.trim().isEmpty()) {
	        String[] tags = tagName.trim().split("\\s+");
	        for(String tag : tags) {
	            TagVO tagVO = new TagVO();
	            tagVO.setBoNo(tbVO.getBoNo());
	            tagVO.setTagName(tagName);
	            tagList.add(tagVO);
	        }
	    }
	    tbVO.setTagList(tagList);

	    service.update(tbVO);

	    return "redirect:/tagboard/detail?boNo=" + tbVO.getBoNo();
	}
	
	
	@PostMapping("/delete")
	public String tagBoardDelete(int boNo, Model model) {
		service.delete(boNo);
		return "redirect:/tagboard/list";
	}

	
}

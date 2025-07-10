package kr.or.ddit.bohang01;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.ProdVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/bokhang01")
public class Bokhang01Controller {

	@GetMapping("/register")
	public String bokhang01Form() {
		return "bokhang01/form";
	}
	// 동기방식은 객체로도 데이터 받을 수 있어서 어노테이션이 필요가 없습니다.
	@PostMapping("/register")
	public String bokhang01Register(ProdVO prodVO) {
		log.info("상품명"+ prodVO.getProdName());
		log.info("상품브랜드" + prodVO.getProdBrand());
		log.info("상품타입" + prodVO.getProdType());
		log.info("상품크기" + prodVO.getProdSize() );
		log.info("상품설명" + prodVO.getProdDescript());
		
		return "bokhang01/result";
	}
	
	// 동기방식은 객체로도 데이터 받을 수 있어서 어노테이션이 필요가 없습니다.
	@PostMapping("/register2")
	public String bokhang01Register2(ProdVO prodVO) {
		log.info("상품명 : "+ prodVO.getProdName());
		log.info("상품이미지 : "+ prodVO.getProdImage().getOriginalFilename());
		log.info("상품브랜드 : " + prodVO.getProdBrand());
		log.info("상품타입 : " + prodVO.getProdType());
		log.info("상품크기 : " + prodVO.getProdSize() );
		log.info("상품설명 : " + prodVO.getProdDescript());
		
		return "bokhang01/result";
	}
	
	// ResponseEntity은 @ResponseBody없어도 된다
	@ResponseBody
	@PostMapping("/ajax/register")
	public ResponseEntity<String> bokhang01AjaxRegister(@RequestBody ProdVO prodVO) {
		log.info("상품명 : "+ prodVO.getProdName());
		log.info("상품브랜드 : " + prodVO.getProdBrand());
		log.info("상품타입 : " + prodVO.getProdType());
		log.info("상품크기 : " + prodVO.getProdSize() );
		log.info("상품설명 : " + prodVO.getProdDescript());
		
		// return 하는 방식이 여러개이다!
		// return new ResponseEntity<String>("OK", HttpStatus.OK);
		// return ResponseEntity.ok("OK");
		return ResponseEntity.status(HttpStatusCode.valueOf(200)).body("OK");
	}
	
	// ResponseEntity은 @ResponseBody없어도 된다
	@ResponseBody
	@PostMapping("/ajax/register2")
	public ResponseEntity<String> bokhang01AjaxRegister2(ProdVO prodVO) {
		log.info("상품명 : "+ prodVO.getProdName());
		log.info("상품이미지 : "+ prodVO.getProdImage().getOriginalFilename());
		log.info("상품브랜드 : " + prodVO.getProdBrand());
		log.info("상품타입 : " + prodVO.getProdType());
		log.info("상품크기 : " + prodVO.getProdSize() );
		log.info("상품설명 : " + prodVO.getProdDescript());
		
		// return 하는 방식이 여러개이다!
		// return new ResponseEntity<String>("OK", HttpStatus.OK);
		// return ResponseEntity.ok("OK");
		return ResponseEntity.status(HttpStatusCode.valueOf(200)).body("OK");
	}
	
}

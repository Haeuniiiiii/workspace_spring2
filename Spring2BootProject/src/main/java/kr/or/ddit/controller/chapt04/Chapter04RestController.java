package kr.or.ddit.controller.chapt04;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.or.ddit.vo.Member;
import lombok.extern.slf4j.Slf4j;

/*
 * @RestController 어노테이션은 @Controller 와 @ResponseBody 어노테이션을 함께 사용할 수 있는 어노테이션으로
 * RestAPI 형태의 메서드, 즉 기능을 만들 때 사용할 수 있다.
 * 클래스 레벨에 작성된 @RestController 어노테이션에 의해 각각의 메서드는 하나의 요청에 따른 목적지로 설정되어 있는데
 * 요청이 들어올 때 응답으로 페이지 정보가 아닌 응답으로 내보내고자 하는 데이터가 응답으로 나갈 수 있다.
 */

@Slf4j
@RestController // 데이터와 경로 둘다 리턴 가능해짐
@RequestMapping("/chapt04")
public class Chapter04RestController {
	
	private static final Logger log = LoggerFactory.getLogger(Chapter04Controller.class);

	@RequestMapping(value = "/goRestHome0301", method = RequestMethod.GET)
	public Member goRestHome0301() {
		log.info("goRestHome0301() 실행.....!!!");
		Member member = new Member();
		return member;
	}
	
	
	/*
	 * 4. 컬렉션 List 타입
	 * 	- JSON 객체 배열 타입의 데이터를 만들어서 반환하는 용도로 사용한다.
	 */
	@RequestMapping(value = "/goRestHome0401", method = RequestMethod.GET)
	public List<Member> goRestHome0401() {
		log.info("goRestHome0401() 실행.....!!!");
		
		// 회원 자바빈즈 클래스를 넣을 리스트 생성
		List<Member> list = new ArrayList<>();
		
		Member member = new Member();
		Member member2 = new Member();
		
		list.add(member);
		list.add(member2);
		
		return list;
	}
	
	
	/*
	 * 5. 컬렉션 Map 타입
	 * 	- Map 형채의 컬렉션 자료를 JSON 객체 타입의 데이터로 만들어서 반환하는 용도로 사용한다.
	 */
	@RequestMapping(value = "/goRestHome0501", method = RequestMethod.GET)
	public Map<String, Member> goRestHome0501() {
		log.info("goRestHome0501() 실행.....!!!");
		
		Map<String, Member> map = new HashMap<>();
		
		Member member = new Member();
		Member member2 = new Member();
		
		map.put("key1", member);
		map.put("key2", member2);
		
		return map;
	}
	
	
	/*
	 * 6. ResponseEntity<void>타입
	 * 	- response 할 때 HTTP 헤러 정보와 내용을 가공하는 용도로 사용한다.
	 * 
	 * 	# @ResponseBody 와 ResponseEntity
	 * 	# @ResponseBody 는 HTTP 응답 본문을 만들어 응답을 내보내주는 역할을 한다.
	 * 	- ResponseEntity 는 응답본문, 헤더, 상태코드를 컨트롤 할 수 있다.
	 * 	- ResponseEntity 는 HttpEntity를 상속 받고 있는데, HttpEntity는 응답 본문을 컨트롤 할 수 있도록
	 * 	  Body(응답본문), HttpHeaders를 필드로 설정되어 있다.
	 * 
	 * # Accept : "나 사용자야 나 이런 정보 필요해! 요청한다! 하는 요청 정보" 
	 */
	@RequestMapping(value = "/goRestHome0601", method = RequestMethod.GET)
	public ResponseEntity<Void> goRestHome0601() {
		log.info("goRestHome0601() 실행.....!!!");
		// 얘를 활용할 수 있는 방법은? (비동기통신 때 가장 많이 사용될 방식)
		// 내가 요청한 URL로 응답이 나가면서 응답데이터로 아무런 값이 전달되지 않는다.
		// 해당 URL 요청 후, 브라우저에서 개발자 도구 이용해서 네트워크 탭을 확인해보면
		// URL이 응답으로 나간걸 확인할 수 있는데,
		// 이때 상태코드 200 으로 정상 응답이 나간걸 확인할 수 있다.
		// 그리고 다른 기능으로 아무런 형태 없이 응답으로 나가지만 응답에 대한 header 정보를 변경하고자 할 때 사용할 수 있다.
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	/*
	 * 7. ResponseEntity<String> 타입
	 * 	- response 할 때 HTTP 헤러 정보와 문자열 데이터를 전달하는 용도로 사용한다.	
	 */
	@RequestMapping(value = "/goRestHome0701", method = RequestMethod.GET)
	public ResponseEntity<String> goRestHome0701() {
		log.info("goRestHome0701()을 실행....!!!");
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}
	
	
	/*
	 * 8. ResponseEntity<자바빈즈 클래스> 타입
	 * 	- response 할 때 HTTP 헤러 정보와 객체 데이터를 전달하는 용도로 사용한다.	
	 */
	@RequestMapping(value = "/goRestHome0801", method = RequestMethod.GET)
	public ResponseEntity<Member> goRestHome0801() {
		log.info("goRestHome0801()을 실행....!!!");
		Member member = new Member();
		return new ResponseEntity<Member>(member, HttpStatus.OK);
	}
	
	
	/*
	 * 9. ResponseEntity<List> 타입
	 * 	- response 할 때 HTTP 헤러 정보와 객체 배열 데이터를 전달하는 용도로 사용한다.	
	 */
	// JSON 객체 배열 타입의 데이터와 200 OK 상태코드를 전송한다.
	@RequestMapping(value = "/goRestHome0901", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> goRestHome0901() {
		log.info("goRestHome0901()을 실행....!!!");
		
		List<Member> list = new ArrayList<>();
		
		Member member = new Member();
		Member member2 = new Member();
		
		list.add(member);
		list.add(member2);
		
		return new ResponseEntity<List<Member>>(list, HttpStatus.OK);
	}
	
	
	/*
	 * 10. ResponseEntity<Map> 타입
	 * 	- response 할 때 HTTP 헤더 정보와 객체 데이터를 Map 형태로 전달하는 용도로 사용한다.	
	 */
	// JSON 객체 배열 타입의 데이터와 200 OK 상태코드를 전송한다.
	@RequestMapping(value = "/goRestHome1001", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Member>> goRestHome1001() {
		log.info("goRestHome1001()을 실행....!!!");
		
		Map<String, Member> map = new HashMap<>();
		
		Member member = new Member();
		Member member2 = new Member();
		
		map.put("key1", member);
		map.put("key2", member2);
		
		return new ResponseEntity<Map<String, Member>>(map, HttpStatus.OK);
	}
	
	
	/*
	 * 11. ResponseEntity<byte[]> 타입
	 * 	- response 할 때 HTTP 헤더 정보와 바이너리 파일 데이터를 전달하는 용도로 사용한다.
	 * 	- 파일을 처리하기 위해서 의존 라이브러리인 commons-io를 추가한다. (pom.xml)	
	 */
	// 바이트 배열로 이미지 파일의 데이터를 전송한다. (썸네일 이미지를 브라우저에서 확인)
	@RequestMapping(value = "/goRestHome1101", method = RequestMethod.GET)
	public ResponseEntity<byte[]> goRestHome1101() {
		log.info("goRestHome1101()을 실행....!!!");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		try {
			in = new FileInputStream("D:\\A_TeachingMaterial\\100JSP_SPRING\\03.SPRING2(STS)\\수업자료\\하랭이.jpg");
			headers.setContentType(MediaType.IMAGE_JPEG);
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			entity= new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/goRestHome1102" , method = RequestMethod.GET)
	public ResponseEntity<byte[]> goRestHome1102() {
		log.info("goRestHome1102()을 실행....!!!");
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = "20250703_DDIT_FILE.jpg";
		HttpHeaders headers = new HttpHeaders();
		
		try {
			in = new FileInputStream("D:\\A_TeachingMaterial\\100JSP_SPRING\\03.SPRING2(STS)\\수업자료\\하랭이.jpg");
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return entity;
	}
	
}

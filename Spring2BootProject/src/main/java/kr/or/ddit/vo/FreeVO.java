package kr.or.ddit.vo;

import lombok.Data;

@Data
public class FreeVO {

	private int frNo;			// 자유게시판 번호
	private String frTitle;		// 자유게시판 제목
	private String frWriter;	// 자유게시판 작성자
	private String frContent;	// 자유게시판 내용
	private String frDate;		// 자유게시판 작성일
	private int frHit;			// 자유게시판 조회수
	
}

package kr.or.ddit.vo;

import lombok.Data;

@Data
public class Notice1VO {

	private int ntNo;			// 공지사항 번호
	private String ntTitle;		// 공지사항 제목
	private String ntWriter;	// 공지사항 작성자
	private String ntContent;	// 공지사항 내용
	private String ntDate;		// 공지사항 작성일
	private int ntHit;			// 공지사항 조회수
	
}

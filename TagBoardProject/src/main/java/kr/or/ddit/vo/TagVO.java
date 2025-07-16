package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TagVO {
	
	private int boNo;	// 외래키로 연결
	private String tagName;
	
}

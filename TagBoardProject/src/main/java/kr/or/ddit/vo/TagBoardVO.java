package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class TagBoardVO {
	
	private int boNo;
	private String boTitle;
	private String boContent;
	private String boWriter;
	private String boDate;
	private int boHit;
	private String tagName;
	private List<TagVO> tagList;
	
}

package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Item2 {
	
	private int itemId;
	private String itemName;
	private int price;
	private Date regDate;
	private String description;
	private String[] files;
	
}

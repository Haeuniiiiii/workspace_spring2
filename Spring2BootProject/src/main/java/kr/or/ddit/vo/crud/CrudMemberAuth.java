package kr.or.ddit.vo.crud;

import lombok.Data;

@Data
public class CrudMemberAuth {

	private int userNo;	// 외래키로 연결 
	private String auth;
	
}

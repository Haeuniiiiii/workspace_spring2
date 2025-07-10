package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProdVO {
	
	private String prodName;
	private MultipartFile prodImage;
	private String prodBrand;
	private String prodType;
	private String prodSize;
	private String prodDescript;
	
}

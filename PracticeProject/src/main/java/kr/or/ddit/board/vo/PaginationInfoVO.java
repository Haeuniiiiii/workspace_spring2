package kr.or.ddit.board.vo;

import java.util.List;

import lombok.Data;

@Data
public class PaginationInfoVO<T> {
	private int totalRecord; 		// 총 게시글 수
	private int totalPage;			// 총 페이지 수
	private int currentPage;		// 현재 페이지
	private int screenSize = 10;  	// 페이지 당 게시글 수
	private int blockSize = 5;		// 페이지 블록 수 
	private int startRow;			// 시작 row
	private int endRow;				// 끝 row
	private int startPage;			// 시작 page
	private int endPage; 			// 끝 page
	private List<T> dataList;		// 결과를 넣을 데이터 리스트
	private String searchType;		// 검색타입
	private String searchWord;		// 검색 단어
	
	public PaginationInfoVO() {}
	
	// PaginationInfoVO 객체를 만들 때, 한 페이지당 게시글 수 와 페이지 블록 수를 원하는 값으로 초기화 할 수 있다.
	public PaginationInfoVO(int screenSize, int blockSize) {
		this.screenSize = screenSize;
		this.blockSize = blockSize;
	}
	
	public void setTotalRecord(int totalRecord) {
		// 총 게시글수를 저장하고, 총 게시글수를 페이지 당 나타낼 게시글 수로 나눠 총 페이지수를 구합니다.
		this.totalRecord = totalRecord;
		totalPage = (int) Math.ceil(totalRecord / (double)screenSize);
	}
	
	public void setCurrentPage(int currentPage) {
		
		this.currentPage = currentPage;	
		endRow = currentPage * screenSize; 
//		startRow = endRow - (screenSize -1);	
		startRow = (currentPage - 1) * screenSize + 1;
//		endRow = startRow + screenSize - 1;
		endPage = (currentPage + (blockSize -1)) / blockSize * blockSize;
		startPage = endPage - (blockSize -1);
		
//		this.currentPage = currentPage;	// 현재 페이지 저장
//		// startRow, endRow는 screenSize의 값을 활용해서 공식화
//		endRow = currentPage * screenSize; // 끝 row = 현재 페이지 * 한 페이지 당 게시글 수
//		startRow = endRow - (screenSize -1);	// 시작 row = 끝 row - (한 페이지당 게시글 수 -1)
//		// startPage, endPage는 blockSize의 값을 활용해서 공식화
//		// 마지막 페이지 = (현재 페이지 + (페이지 블록 사이즈 -1)) / 페이지 플록 사이즈 * 페이지 블록 사이즈
//		// /blockSize * blockSize는 1,2,3,4,5...페이지 마다 실수 계산이 아닌 정수 계산을 이용해 endPage를 구함 
//		endPage = (currentPage + (blockSize -1)) / blockSize * blockSize;
//		startPage = endPage - (blockSize -1);	// 시작 페이지 = 끝 페이지 -(페이지 블록 사이즈 -1)
	}

	public String getPagingHTML() {
		// startPage는 1,6,11 이런 숫자로 증가해서 올라갑니다.
		// 1-5 범위안에 있는 경우는 Prev가 생성되지 않습니다.
		// 6 범위부터 Prev가 만들어지는 조건이 된다.
		StringBuffer html = new StringBuffer();
		html.append("<ul class='pagination pagination-sm m-0 float-right'>");
		
		// 'Prev' 버튼을 현재 페이지가 blockSize(현재 5)를 넘었을 때 나타나야 하빈다.
		// 현재 페이지가 1-5 사이의 범위에 있다면 startPage는 무조건 1이 됩니다.
		// 현재 페이지가 blockSize보다 큰 6~범위에 있을때부터 startPage는 blockSize보다 큰 6부터 시작하빈다
		// 그런점을 고려한다면, 현재 페이지가 1보다 무조건 다음 페이지에 있어야만 'prev' 버튼을 활용할 수 있으므로 조건식 작성
		// (blocSize 5보다 작을 수 있음)
		if(startPage > 1) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='"+
					(startPage - blockSize) + "'>Prev</a></li>");
		}
		
		// 반복문 내 조건은 총 페이지가 있고 현재 페이지에 따라 endPage 값이 결정됩니다.
		// 총 페이지가 14개고 현재 페이지가 9 페이지라면 넘어가야할 페이지가 남아 있는것이기 때문에 endPage만큼 반복됩니다.
		// 넘어가야할 페이자가 존재하지 않는 상태라면 마지막 페이지가 포함되어 있는 block영역이므로 totalPage만큼 반복됩니다.
		for(int i= startPage; i <=(endPage < totalPage? endPage : totalPage); i++ ) {
			if(i == currentPage) {
				// 현재 페이지 번호 출력
				html.append("<li class='page-item active'><span class='page-link'>" +
						i + "</span></li>");
			}else {
				// 현재 페이지가 아닌 번호 출력
				html.append("<li class='page-item'><a href='' class='page-link' data-page='" +
						i +  "'>" + i + "</a></li>");
			}
		}
		if(endPage < totalPage) {
			html.append("<li class='page-item'><a href='' class='page-link' data-page='" +
					(endPage + 1) +"'>Next</a></li>");
		}
		html.append("</ul>");
		return html.toString();
	}
}
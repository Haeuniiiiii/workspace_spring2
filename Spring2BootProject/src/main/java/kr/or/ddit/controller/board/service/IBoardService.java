package kr.or.ddit.controller.board.service;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IBoardService {

	public int insert(BoardVO boardVO);

	public BoardVO detail(int boNo);

	public int update(BoardVO boardVO);

	public int delete(int boNo);

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);

}

package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.board.ServiceResult;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PaginationInfoVO;

public interface IBoardService {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);

	public BoardVO selectBoardDetail(int boardNo);

	public ServiceResult deleteBoard(BoardVO boardVO);

	public ServiceResult insertBoard(BoardVO boardVO);

	public ServiceResult updateBoard(BoardVO boardVO);

	
}

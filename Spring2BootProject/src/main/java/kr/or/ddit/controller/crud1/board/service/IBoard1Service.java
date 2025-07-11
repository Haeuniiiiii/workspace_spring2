package kr.or.ddit.controller.crud1.board.service;

import java.util.List;

import kr.or.ddit.vo.Board1VO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface IBoard1Service {

	public int insert(Board1VO boardVO);

	public Board1VO detail(int boNo);

	public int update(Board1VO boardVO);

	public int delete(int boNo);

	public int selectBoardCount(PaginationInfoVO<Board1VO> pagingVO);

	public List<Board1VO> selectBoardList(PaginationInfoVO<Board1VO> pagingVO);

}

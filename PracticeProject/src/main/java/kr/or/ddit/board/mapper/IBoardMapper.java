package kr.or.ddit.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PaginationInfoVO;

@Mapper
public interface IBoardMapper {

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);
	public BoardVO selectBoardDetail(int boardNo);
	public int deleteBoard(BoardVO boardVO);
	public int insertBoard(BoardVO boardVO);
	public int updateBoard(BoardVO boardVO);

	
}

package kr.or.ddit.controller.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;

@Mapper
public interface IBoardMapper {

	public int insert(BoardVO boardVO);

	public BoardVO detail(int boNo);

	public int update(BoardVO boardVO);

	public int delete(int boNo);

	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO);

	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO);

}

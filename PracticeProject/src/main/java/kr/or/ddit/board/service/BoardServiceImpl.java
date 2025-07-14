package kr.or.ddit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.board.ServiceResult;
import kr.or.ddit.board.mapper.IBoardMapper;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.board.vo.PaginationInfoVO;

@Service
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardMapper mapper;

	@Override
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		
		return mapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		
		return mapper.selectBoardList(pagingVO);
	}

	@Override
	public BoardVO selectBoardDetail(int boardNo) {
		
		return mapper.selectBoardDetail(boardNo);
	}

	@Override
	public ServiceResult deleteBoard(BoardVO boardVO) {
		ServiceResult result = null;
		int status = mapper.deleteBoard(boardVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED; 
		}
		return result;
	}

	@Override
	public ServiceResult insertBoard(BoardVO boardVO) {
		ServiceResult result = null;
		int status = mapper.insertBoard(boardVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateBoard(BoardVO boardVO) {
		ServiceResult result = null;
		int status = mapper.updateBoard(boardVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
}

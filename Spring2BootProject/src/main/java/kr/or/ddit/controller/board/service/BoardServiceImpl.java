package kr.or.ddit.controller.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.controller.board.mapper.IBoardMapper;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PaginationInfoVO;


@Service
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardMapper boardMapper;
	
	@Override
	public int insert(BoardVO boardVO) {
		return boardMapper.insert(boardVO);
	}

	@Override
	public BoardVO detail(int boNo) {
		return boardMapper.detail(boNo);
	}

	@Override
	public int update(BoardVO boardVO) {
		return boardMapper.update(boardVO);
	}

	@Override
	public int delete(int boNo) {
		return boardMapper.delete(boNo);
	}

	@Override
	public int selectBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return boardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		return boardMapper.selectBoardList(pagingVO);
	}
	
}

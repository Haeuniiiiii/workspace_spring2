package kr.or.ddit.controller.crud1.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.controller.crud1.board.mapper.IBoard1Mapper;
import kr.or.ddit.vo.Board1VO;
import kr.or.ddit.vo.PaginationInfoVO;


@Service
public class Board1ServiceImpl implements IBoard1Service {

	@Autowired
	private IBoard1Mapper boardMapper;
	
	@Override
	public int insert(Board1VO boardVO) {
		return boardMapper.insert(boardVO);
	}

	@Override
	public Board1VO detail(int boNo) {
		return boardMapper.detail(boNo);
	}

	@Override
	public int update(Board1VO boardVO) {
		return boardMapper.update(boardVO);
	}

	@Override
	public int delete(int boNo) {
		return boardMapper.delete(boNo);
	}

	@Override
	public int selectBoardCount(PaginationInfoVO<Board1VO> pagingVO) {
		return boardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<Board1VO> selectBoardList(PaginationInfoVO<Board1VO> pagingVO) {
		return boardMapper.selectBoardList(pagingVO);
	}
	
}

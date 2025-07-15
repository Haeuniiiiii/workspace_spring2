package kr.or.ddit.controller.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.controller.mapper.IBoardMapper;
import kr.or.ddit.vo.TagBoardVO;

@Service
public class BoardServiceImpl implements IBoardService{

	@Autowired
	private IBoardMapper mapper;

	@Override
	public void insert(TagBoardVO tagBoardVO) {
		mapper.insert(tagBoardVO);
	}

	@Override
	public TagBoardVO detail(int boNo) {
		return mapper.detail(boNo);
	}

}

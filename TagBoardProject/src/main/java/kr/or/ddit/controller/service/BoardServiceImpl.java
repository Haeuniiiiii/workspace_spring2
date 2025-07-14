package kr.or.ddit.controller.service;

import org.springframework.stereotype.Service;
import kr.or.ddit.controller.TagBoardController;
import kr.or.ddit.controller.mapper.IBoardMapper;
import kr.or.ddit.vo.TagBoardVO;
import lombok.Data;

@Service
public class BoardServiceImpl implements IBoardService{

	private IBoardMapper mapper;

	@Override
	public void insert(TagBoardVO tagBoardVO) {
		mapper.insert(tagBoardVO);
	}

}

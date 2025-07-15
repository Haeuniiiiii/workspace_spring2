package kr.or.ddit.controller.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.or.ddit.controller.mapper.ITagBoardMapper;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.TagBoardVO;
import kr.or.ddit.vo.TagVO;

@Service
public class TagBoardServiceImpl implements ITagBoardService{

	@Autowired
	private ITagBoardMapper mapper;

	@Override
	public void insert(TagBoardVO tbVO) {
		mapper.insert(tbVO);
		
		TagVO tagVO = new TagVO();
		tagVO.setBoNo(tbVO.getBoNo());
		tagVO.setTagNm("태그테스트");
		mapper.insertTag(tagVO);
	}

	@Override
	public TagBoardVO detail(int boNo) {
		return mapper.detail(boNo);
	}

	@Override
	public List<TagBoardVO> list() {
		return mapper.list();
	}

	@Override
	public int selectTagBoardCount(PaginationInfoVO<TagBoardVO> pagingVO) {
		return mapper.selectTagBoardCount(pagingVO);
	}

	@Override
	public List<TagBoardVO> selectTagBoardList(PaginationInfoVO<TagBoardVO> pagingVO) {
		return mapper.selectTagBoardList(pagingVO);
	}

}

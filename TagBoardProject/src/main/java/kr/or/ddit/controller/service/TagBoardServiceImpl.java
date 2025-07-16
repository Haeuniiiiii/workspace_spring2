package kr.or.ddit.controller.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public void insert(TagBoardVO tbVO, String tagNm) {
		
		mapper.insert(tbVO);  
		
	    if(tagNm != null && !tagNm.trim().isEmpty()) {
	        String[] tags = tagNm.trim().split("\\s+");
	        for(String tag : tags) {
	            TagVO tagVO = new TagVO();
	            tagVO.setBoNo(tbVO.getBoNo());
	            tagVO.setTagNm(tag);
	            mapper.insertTag(tagVO);
	        }
	    }
	}

	@Override
	public TagBoardVO detail(int boNo) {
		mapper.hit(boNo);
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

	@Override
	public void update(TagBoardVO tbVO, String tagNm) {
		mapper.update(tbVO);
	}

	@Override
	public void delete(int boNo) {
		mapper.delete(boNo);
	}

	@Override
	public List<TagBoardVO> search(String searchType, String searchWord) {
		Map<String, String> sMap = new HashMap<>();
		sMap.put("searchType", searchType);
		sMap.put("searchWord", searchWord);
		return mapper.search(sMap);
	}

}
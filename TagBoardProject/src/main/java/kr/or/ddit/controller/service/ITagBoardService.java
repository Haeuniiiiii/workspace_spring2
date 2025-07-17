package kr.or.ddit.controller.service;

import java.util.List;

import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.TagBoardVO;

public interface ITagBoardService {

	public TagBoardVO detail(int boNo);

	public int selectTagBoardCount(PaginationInfoVO<TagBoardVO> pagingVO);

	public List<TagBoardVO> selectTagBoardList(PaginationInfoVO<TagBoardVO> pagingVO);

	public void update(TagBoardVO tbVO);

	public void delete(int boNo);

	public void insert(TagBoardVO tbVO);

}
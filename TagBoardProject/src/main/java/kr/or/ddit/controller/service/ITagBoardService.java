package kr.or.ddit.controller.service;

import java.util.List;

import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.TagBoardVO;

public interface ITagBoardService {

	public void insert(TagBoardVO tbVO);

	public TagBoardVO detail(int boNo);

	public List<TagBoardVO> list();

	public int selectTagBoardCount(PaginationInfoVO<TagBoardVO> pagingVO);

	public List<TagBoardVO> selectTagBoardList(PaginationInfoVO<TagBoardVO> pagingVO);

}

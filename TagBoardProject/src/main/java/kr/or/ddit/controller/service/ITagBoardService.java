package kr.or.ddit.controller.service;

import java.util.List;

import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.TagBoardVO;

public interface ITagBoardService {

	public TagBoardVO detail(int boNo);

	public List<TagBoardVO> list();

	public int selectTagBoardCount(PaginationInfoVO<TagBoardVO> pagingVO);

	public List<TagBoardVO> selectTagBoardList(PaginationInfoVO<TagBoardVO> pagingVO);

	public void update(TagBoardVO tbVO, String tagName);

	public void delete(int boNo);

	public List<TagBoardVO> search(PaginationInfoVO<TagBoardVO> pagingVO);

	public void insert(TagBoardVO tbVO);

}
package kr.or.ddit.controller.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.TagBoardVO;
import kr.or.ddit.vo.TagVO;

@Mapper
public interface ITagBoardMapper {

	public void insert(TagBoardVO tbVO);
	
	public void insertTag(TagVO tagVO);

	public TagBoardVO detail(int boNo);

	public List<TagBoardVO> list();
	
	public int selectTagBoardCount(PaginationInfoVO<TagBoardVO> pagingVO);
	
	public List<TagBoardVO> selectTagBoardList(PaginationInfoVO<TagBoardVO> pagingVO);
	
	public void update(TagBoardVO tbVO);
	
	public void delete(int boNo);
	
	public List<TagBoardVO> search(Map<String, String> sMap);

	public void hit(int boNo);


}
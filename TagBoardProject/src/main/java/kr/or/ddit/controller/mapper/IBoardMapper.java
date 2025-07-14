package kr.or.ddit.controller.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.TagBoardVO;

@Mapper
public interface IBoardMapper {

	public int insert(TagBoardVO tagBoardVO);

}

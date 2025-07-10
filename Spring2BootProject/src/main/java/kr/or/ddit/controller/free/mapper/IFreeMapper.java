package kr.or.ddit.controller.free.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.FreeVO;

@Mapper
public interface IFreeMapper {

	public int insert(FreeVO freeVO);

	public FreeVO detail(int frNo);


}

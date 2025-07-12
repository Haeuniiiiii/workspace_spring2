package kr.or.ddit.controller.crud1.notice.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.Notice1VO;

@Mapper
public interface INotice1Mapper {

	public int insert(Notice1VO notice1vo);
	
	

}

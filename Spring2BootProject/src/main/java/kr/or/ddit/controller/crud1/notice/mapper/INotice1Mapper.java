package kr.or.ddit.controller.crud1.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.Notice1VO;
import kr.or.ddit.vo.PaginationInfoVO;

@Mapper
public interface INotice1Mapper {

	public int insert(Notice1VO notice1vo);

	public Notice1VO detail(int ntNo);

	public int update(Notice1VO notice1vo);

	public int delete(int ntNo);

	public int selectNoticeCount(PaginationInfoVO<Notice1VO> pagingVO);

	public List<Notice1VO> selectNoticeList(PaginationInfoVO<Notice1VO> pagingVO);
	
	

}

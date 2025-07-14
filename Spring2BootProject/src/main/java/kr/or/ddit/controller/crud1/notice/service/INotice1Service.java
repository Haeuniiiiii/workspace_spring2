package kr.or.ddit.controller.crud1.notice.service;

import java.util.List;

import kr.or.ddit.vo.Notice1VO;
import kr.or.ddit.vo.PaginationInfoVO;

public interface INotice1Service {
	
	public int insert(Notice1VO notice1VO);

	public Notice1VO detail(int ntNo);

	public int update(Notice1VO notice1VO);

	public int delete(int ntNo);

	public int selectNoticeCount(PaginationInfoVO<Notice1VO> pagingVO);

	public List<Notice1VO> selectNoticeList(PaginationInfoVO<Notice1VO> pagingVO);

	

}

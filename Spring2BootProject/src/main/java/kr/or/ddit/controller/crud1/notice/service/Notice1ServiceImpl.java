package kr.or.ddit.controller.crud1.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.controller.crud1.notice.mapper.INotice1Mapper;
import kr.or.ddit.vo.Notice1VO;
import kr.or.ddit.vo.PaginationInfoVO;

@Service
public class Notice1ServiceImpl implements INotice1Service {
	
	@Autowired
	private INotice1Mapper notice1Mapper;

	@Override
	public int insert(Notice1VO notice1VO) {
		return notice1Mapper.insert(notice1VO);
	}

	@Override
	public Notice1VO detail(int ntNo) {
		return notice1Mapper.detail(ntNo);
	}

	@Override
	public int update(Notice1VO notice1VO) {
		return notice1Mapper.update(notice1VO);
	}

	@Override
	public int delete(int ntNo) {
		return notice1Mapper.delete(ntNo);
	}

	@Override
	public int selectNoticeCount(PaginationInfoVO<Notice1VO> pagingVO) {
		return notice1Mapper.selectNoticeCount(pagingVO);
	}

	@Override
	public List<Notice1VO> selectNoticeList(PaginationInfoVO<Notice1VO> pagingVO) {
		return notice1Mapper.selectNoticeList(pagingVO);
	}

}

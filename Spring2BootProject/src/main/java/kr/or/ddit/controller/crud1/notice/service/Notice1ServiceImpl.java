package kr.or.ddit.controller.crud1.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.controller.crud1.notice.mapper.INotice1Mapper;
import kr.or.ddit.vo.Notice1VO;

@Service
public class Notice1ServiceImpl implements INotice1Service {
	
	@Autowired
	private INotice1Mapper notice1Mapper;

	@Override
	public int insert(Notice1VO notice1VO) {
		return notice1Mapper.insert(notice1VO);
	}

}

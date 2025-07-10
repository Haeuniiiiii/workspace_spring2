package kr.or.ddit.controller.free.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.free.mapper.IFreeMapper;
import kr.or.ddit.vo.FreeVO;

@Service
public class FreeServiceImpl implements IFreeService {
	
	@Autowired
	private IFreeMapper freeMapper;

	@Override
	public int insert(FreeVO freeVO) {
		return freeMapper.insert(freeVO);
	}

	@Override
	public FreeVO detail(int frNo) {
		return freeMapper.detail(frNo);
	}


}

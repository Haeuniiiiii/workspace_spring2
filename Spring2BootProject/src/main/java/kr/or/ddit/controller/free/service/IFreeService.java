package kr.or.ddit.controller.free.service;

import kr.or.ddit.vo.FreeVO;

public interface IFreeService {

	public int insert(FreeVO freeVO);

	public FreeVO detail(int frNo);

}

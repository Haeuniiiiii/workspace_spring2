package kr.or.ddit.service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.NoticeMemberVO;

public interface INoticeService {

	public ServiceResult idCheck(String memId);

	public ServiceResult signup(NoticeMemberVO memberVO);
	
	

}

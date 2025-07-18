package kr.or.ddit.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.NoticeMemberVO;

@Mapper
public interface ILoginMapper {

	public NoticeMemberVO idCheck(String memId);

	public int signup(NoticeMemberVO memberVO);

}

package kr.or.ddit.controller.chapt08.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.crud.Board;

@Mapper
public interface IBoardMapper {

	// 등록 기능
	public void create(Board board);

	// 전체 목록
	public List<Board> list();

	// 상세 화면
	public Board read(int boardNo);

	public void modify(Board board);

	public void remove(int boardNo);

	public List<Board> search(Board board);
	
}

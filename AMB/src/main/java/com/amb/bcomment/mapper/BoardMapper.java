package com.amb.bcomment.mapper;

import java.util.List;

import com.amb.bcomment.domain.BoardVO;
import com.amb.bcomment.paging.BoardPagingDTO;

public interface BoardMapper {

	//게시물 목록 조회 
	public List<BoardVO> showBoardList(BoardPagingDTO boardPagingDTO);
	
	public long regBoard(BoardVO board);
	
	public long selectBoard(BoardVO board);
	
	public long callDelBoard(Long bno);
	
	public long actDelBoard(Long bno);
	
	public long cntBoardViews(Long bno);
}

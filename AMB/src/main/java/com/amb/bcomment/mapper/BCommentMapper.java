package com.amb.bcomment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amb.bcomment.domain.BCommentVO;
import com.amb.bcomment.paging.BCommentPagingDTO;

public interface BCommentMapper {
	
	//게시물에 대한 댓글목록 조회
	public List<BCommentVO> showBCommentList(Long bno);
	
	//게시물에 댓글 작성
	public long insertBCommentForBoard(BCommentVO bcommentVO);
	
	//댓글에 대한 답글 작성
	public long insertBCommentForReply(BCommentVO bcommentVO);
	
	//특정 댓글 선택/조회
	public BCommentVO selectBComment(@Param("bno") Long bno, @Param("cno") Long cno);
	
	//댓글 수정
	public int updateBComment(BCommentVO bcommentVO);
	
	//댓글 삭제
	public int deleteBComment(@Param("bno") Long bno, @Param("cno") Long cno);
	
	//특정 게시물에 대한 전체 댓글 조회
	public List<BCommentVO> selectCnoList(@Param("bCommentPagingDTO") BCommentPagingDTO bCommentPagingDTO);
	
	//특정 게시물에 대한 총 댓글 갯수 조회
	public int selectCnoTotalByBno(@Param("bCommentPagingDTO") BCommentPagingDTO bCommentPagingDTO);

	
	
}

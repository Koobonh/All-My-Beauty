package com.amb.bcomment.service;

import com.amb.bcomment.domain.BCommentVO;
import com.amb.bcomment.paging.BCommentPagingCreatorDTO;
import com.amb.bcomment.paging.BCommentPagingDTO;

public interface BCommentService {
	//게시물에 대한 댓글목록 조회
	public BCommentPagingCreatorDTO selectCnoListByBno(BCommentPagingDTO bCommentPaging);
	
	//게시물에 대한 댓글 갯수 확인
	public long selectCnoTotalByBno(BCommentPagingDTO bCommentPaging);
	
	//게시물에 대한 댓글 등록
	public long registerCnoForBoard(BCommentVO bcommentVO);
	
	//댓글에 답글 등록
	public long registerCnoForReply(BCommentVO bcommeBntVO);
	
	//게시물에 대한 댓글/답글 조회
	public BCommentVO selectBComment(long bno, long cno);
	
	//게시물에 대한 댓글 수정
	public int modifyCno(BCommentVO bcomment);
	
	//게시물에 대한 댓글 삭제
	public int removeCno(long bno, long cno);
	
	
}

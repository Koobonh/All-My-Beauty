package com.amb.bcomment.paging;

import java.util.List;

import com.amb.bcomment.domain.BCommentVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class BCommentPagingCreatorDTO {
	
	private BCommentPagingDTO cntPaging;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long cntTotalByBno;
	private int pagingNumCnt;
	private int lastPageNum;
	
	private List<BCommentVO> cmtList;
	
	public BCommentPagingCreatorDTO(long cntTotalByBno,
								BCommentPagingDTO cntPaging,
								List<BCommentVO> cmtList) {
		this.cntPaging = cntPaging;
		this.cntTotalByBno = cntTotalByBno;
		this.cmtList = cmtList;
		this.pagingNumCnt = 10;
		
		//계산된 끝-시작 페이징 번호:
		this.endPagingNum =
				(int)( Math.ceil(cntPaging.getPageNum() / (this.pagingNumCnt * 1.0 ) )) * this.pagingNumCnt;
				
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt -1);
						
		this.lastPageNum = (int)( Math.ceil((cntTotalByBno * 1.0) / cntPaging.getRowAmountPerPage()));
		
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
			
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum;
		
		System.out.println("댓글-전달된 페이징 기본데이터-MyReplyPagingDTO: " + cntPaging.toString());
		 System.out.println("댓글-끝 페이징번호: " + this.endPagingNum);
		 System.out.println("댓글-시작 페이징번호: " + this.startPagingNum);
		 System.out.println("댓글-이전버튼 표시 여부: " + this.prev);
		 System.out.println("댓글-다음버튼 표시 여부: " + this.next);
		 System.out.println("전달된 댓글 목록 데이터: " + this. cmtList);
		
	}
	
	
}

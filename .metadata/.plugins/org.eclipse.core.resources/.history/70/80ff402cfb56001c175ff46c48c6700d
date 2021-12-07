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
	
	private List<BCommentVO> cntList;
	
	public BCommentPagingCreatorDTO(long cntTotalByBno,
								BCommentPagingDTO cntPaging,
								List<BCommentVO> cntList) {
		this.cntPaging = cntPaging;
		this.cntTotalByBno = cntTotalByBno;
		this.cntList = cntList;
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
		
		System.out.println(cntPaging.toString());
		System.out.println(this.endPagingNum);
		System.out.println(this.startPagingNum);
		System.out.println(this.prev);
		System.out.println(this.next);
		System.out.println(this.cntList);
		
	}
	
	
}

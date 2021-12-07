package com.spring5218.mypro00.common.paging;

import java.util.List;

import com.spring5218.mypro00.domain.MyReplyVO;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MyReplyPagingCreatorDTO {
	
	private MyReplyPagingDTO myReplyPaging; 
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	private long replyTotalByBno;
	private int pagingNumCnt;
	private int lastPageNum;
	
	private List<MyReplyVO> replyList;
	
	public MyReplyPagingCreatorDTO(long replyTotalByBno,
								   MyReplyPagingDTO myReplyPaging,
								   List<MyReplyVO> replyList) {
		
		this.myReplyPaging = myReplyPaging;
		this.replyTotalByBno = replyTotalByBno;
		this.replyList = replyList;
		this.pagingNumCnt = 2;
		
		
		//계산된 끝-시작 페이징 번호:
		this.endPagingNum = 
				(int)( Math.ceil(myReplyPaging.getPageNum() / (this.pagingNumCnt * 1.0 ) ) ) * this.pagingNumCnt;
		
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt - 1);
		
		//행 총수를 기준으로 한 실제 마지막 페이지 번호
		this.lastPageNum = (int)( Math.ceil( (replyTotalByBno * 1.0) / myReplyPaging.getRowAmountPerPage() ) );
		
		//계산된 끝 페이징 번호가 실제 마지막 페이지 번호보다 크면, endPagingNum 값을 lastPageNum으로 대체
		if (lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum ;
		}
		
		this.prev = this.startPagingNum >1;
		this.next = this.endPagingNum < lastPageNum ;
		
		
		System.out.println("댓글 - 전달된 페이징 기본데이터 -myBoardPagingDTO: " + myReplyPaging.toString());
		System.out.println("댓글 - 끝 페이징번호: " + this.endPagingNum);
		System.out.println("댓글 - 시작 페이징번호: " + this.startPagingNum);
		System.out.println("댓글 - 이전번튼 페이징번호: " + this.prev);
		System.out.println("댓글 - 다음버튼 페이징번호: " + this.next);
		System.out.println("전달된 댓글 목록 데이터: " + this.replyList);
	}
	
}


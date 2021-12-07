package com.spring5218.mypro00.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class MyBoardPagingCreatorDTO {
	
	private MyBoardPgingDTO myBoardPagingDTO;
	private int startPagingNum;
	private int endPagingNum;
	private boolean prev;
	private boolean next;
	//private long rowAmountTotal;
	private int pagingNumCnt;
	private int lastPageNum;
	
	
	public MyBoardPagingCreatorDTO(long rowAmountTotal, MyBoardPgingDTO myBoardPagingDTO) {
		this.myBoardPagingDTO = myBoardPagingDTO;
		//this.rowAmountTotal = rowAmountTotal;
		this.pagingNumCnt = 10;
		
		//
		this.endPagingNum = 
				(int)( Math.ceil(myBoardPagingDTO.getPageNum() / (this.pagingNumCnt * 1.0) ) ) * this.pagingNumCnt; 
						
						
		this.startPagingNum = this.endPagingNum - (this.pagingNumCnt -1);
				
		
		this.lastPageNum = (int)( Math.ceil( (rowAmountTotal *1.0 ) / myBoardPagingDTO.getRowAmountPerPage() ) );	
		
		
		if(lastPageNum < this.endPagingNum) {
			this.endPagingNum = lastPageNum;
		}
		
		this.prev = this.startPagingNum > 1;
		this.next = this.endPagingNum < lastPageNum;
		
		System.out.println("전달된 페이징 기본데이터 -myBoardPagingDTO: " + myBoardPagingDTO.toString());
		System.out.println("끝 페이징번호: " + this.endPagingNum);
		System.out.println("시작 페이징번호: " + this.startPagingNum);
		System.out.println("이전번튼 페이징번호: " + this.prev);
		System.out.println("다음버튼 페이징번호: " + this.next);
		System.out.println("마지막 페이징번호: " + this.lastPageNum);
	}
	
}


//페이징 객체는 세션마다 만들어야한다. 공유 ㄴㄴㄴㄴㄴㄴ
//그래서 어노테이션이 없는 것 

// or 반대되는게 설정에 의해 만들어지는것(싱글톤)
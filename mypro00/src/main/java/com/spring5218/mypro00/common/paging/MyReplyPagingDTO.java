package com.spring5218.mypro00.common.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class MyReplyPagingDTO {
	
	private long bno;
	private Integer pageNum;
	private int rowAmountPerPage;
	

	
	//페이지번호와 행수를 각각 사용자가 선택한 페이징번호와 10으로 전달
	
	//생성자 -  댓글의 페이징번호 클릭 시,
	public MyReplyPagingDTO(long bno, Integer pageNum) {
		
		this.bno = bno;
		
		//pageNum 때문에 Integer 쓴것임, null이니깐!!
		
		if(pageNum == null) {
			
			this.pageNum = 1;
			
		} else { 
			
			this.pageNum = pageNum;
			
		}
		
		this.rowAmountPerPage = 5;
	}
}
	
	
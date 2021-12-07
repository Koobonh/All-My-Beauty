package com.spring5218.mypro00.common.paging;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@EqualsAndHashCode
public class MyBoardPgingDTO {
	
	private int pageNum;
	private int rowAmountPerPage;
	private String scope;
	private String keyword;
	
	
	//검색범위 값 처리를 위한 메소드: 화면에 선택된 TCW 값을 TCW 배열로 반환
	//이 메소드는 Mybatis 엔진에 의해서 자동으로 호출되어 사용됨
	
	public String[] getScopeArray() {
		return scope == null ? new String[] {} : scope.split("");
	}
	
	
	//생성자1
	public  MyBoardPgingDTO() {
		
		this.pageNum = 1;
		this.rowAmountPerPage = 10;
	}
	
	
	// 생성자2 
	public MyBoardPgingDTO(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
			
		} else { 
			
			this.pageNum = pageNum;
			
		}
		
		this.rowAmountPerPage = 10;
	}
	
	//생성자 3
	public  MyBoardPgingDTO (int pageNum, int rowAmountPerPage) {
		
		if(pageNum <= 0) {
			this.pageNum = 1;
	} else {
		
		this.pageNum = pageNum;
		
	} if(rowAmountPerPage <=0) {
		
		this.rowAmountPerPage = 10;
	} else {
		
		this.rowAmountPerPage = rowAmountPerPage;
	}

	}
	

}

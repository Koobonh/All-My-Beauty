package com.amb.bcomment.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	public Long bno;
	
	public String mid;
	
	public String btitle;
	
	public String bcontent;
	
	public Date bregDate;
	
	public int bdelFlag;
	
	public Long bviewCount;
	
	public int bcategory;
	
	
}

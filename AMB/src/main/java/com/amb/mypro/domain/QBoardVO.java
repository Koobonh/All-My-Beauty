package com.amb.mypro.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QBoardVO {
	private long qno;
	private long productId;
	private String mid;
	private String qcontent;
	private int qanswerno;
	private Date qdate;
	private int qdelFlag;
}

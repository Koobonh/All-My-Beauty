package com.spring5218.mypro00.domain;


import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MyBoardVO {
	private long bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private int bviewsCnt;
	private int breplyCnt;
	private int bdelFlag;
	private Date bregDate;
	private Timestamp bmodDate;
	private List<MyBoardAttachFileVO> attachFileList;


}

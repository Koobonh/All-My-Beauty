package com.spring5218.mypro00.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyBoardAttachFileVO {
	
	private String uuid;
	private String upload;
	private String fileName;
	private String fileType;
	private Long bno;
	private String repoPath = "C:\\myupload";

}

package com.spring5218.mypro00.mapper;

import java.util.List;

import com.spring5218.mypro00.domain.MyBoardAttachFileVO;

public interface MyBoardAttachFileMapper {
	
	public void insertAttachFile(MyBoardAttachFileVO boardAttachFile);
	
	public List<MyBoardAttachFileVO> selectAttachFilesByBno(Long bno);
	
	public void deleteAttachFile(String uuid);

	public void deleteAttachFilesByBno(Long bno);

}

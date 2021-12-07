package com.spring5218.mypro00.service;

import java.util.List;

import com.spring5218.mypro00.common.paging.MyBoardPgingDTO;
import com.spring5218.mypro00.domain.MyBoardAttachFileVO;
import com.spring5218.mypro00.domain.MyBoardVO;

public interface MyBoardService {
	
	
	//게시물 조회 - 목록 조회 서비스
		public List<MyBoardVO> getBoardList();
		
		//게시물 조회 - 페이징
		public List<MyBoardVO> getBoardList(MyBoardPgingDTO myBoardPagingDTO);
		
		//게시물 조회 - 페이징
		public long getRowAmountTotal(MyBoardPgingDTO myBoardPagingDTO);
		
		//게시물 등록: selectKey 이용
		public long registerBoard(MyBoardVO myBoard);

		//게시물 조회: by bno + 조회수 증가 고려  ㅣ Long으로 써도됨 아래 
		public MyBoardVO getBoard(long bno);
		
        //게시물 조회: 게시물 조회 페이지 -> 게시물 수정 페이지 호출(by bno), 조회수 변화 없음
		
		public MyBoardVO getBoardDetailModify(long bno);
		
		//게시물 수정 
		public boolean modifyBoard(MyBoardVO myboard);
		
		//게시물 삭제 - 실제 삭제 발생
		public boolean removeBoard(long bno);
		
		//게시물 삭제 - bdlFlag 컬럼값을 1(true)로 수정  // 
		public boolean setBoardDeleted(long bno);
		
		//게시물 삭제(관리자) - 사용자 삭제 요청된 게시물 전체 삭제: bdelFlag = 1
		public int removeAllDeletedBoard();
		
		//게시물의 첨부파일 조회
		public List<MyBoardAttachFileVO> getAttachFilesByBno(long bno);
		
	

}

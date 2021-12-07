package com.spring5218.mypro00.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring5218.mypro00.common.paging.MyBoardPgingDTO;
import com.spring5218.mypro00.domain.MyBoardAttachFileVO;
import com.spring5218.mypro00.domain.MyBoardVO;
import com.spring5218.mypro00.mapper.MyBoardAttachFileMapper;
import com.spring5218.mypro00.mapper.MyBoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class MyBoardServiceImpl implements MyBoardService {
	
	//서비스(비지니스 계층, @Service) 클래스는 매퍼 인터페이스를 주입받아야 합니다.
	private MyBoardMapper myBoardMapper;
	
	private MyBoardAttachFileMapper myBoardAttachFileMapper;
	
	// 아래 코드 대신에 @AllArgsConstructor 이거 쓴거임
//	public MyBoardServiceImpl(MyBoardMapper myBoardMapper) {
//		super();
//		this.myBoardMapper = myBoardMapper;
//	}

//	//게시물 목록 조회 서비스
//	@Override
//	public List<MyBoardVO> getBoardList(MyBoardPgingDTO myBoardPagingDTO) {
//		
//	//	log.info("MyBoardService.getBoardList() 실행");
//		return myBoardMapper.selectMyBoardList();
//	
//	}
	
	
	//게시물 목록 조회 서비스 : 페이징 고려
		@Override
		public List<MyBoardVO> getBoardList(MyBoardPgingDTO myBoardPagingDTO) {
			
		//	log.info("MyBoardService.getBoardList() 실행");
			return myBoardMapper.selectMyBoardList(myBoardPagingDTO);
		
		}
		
		//게시물 조회 - 페이징s
		@Override
		public long getRowAmountTotal(MyBoardPgingDTO myBoardPagingDTO) {
			log.info("MyBoardService.getRowAmountTotal()에 전달된 MyBoardPgingDTO: " + myBoardPagingDTO);
			return myBoardMapper.selectRowAmountTotal(myBoardPagingDTO);
		}
		
		// 게시물의 첨부파일 조회
		@Override
		public List<MyBoardAttachFileVO> getAttachFilesByBno(long bno) {
			log.info("MyBoardService.getAttachFilesByBno()에 전달된 bno: " + bno);
			return myBoardAttachFileMapper.selectAttachFilesByBno(bno);
		}
		
		
		
	//게시물 등록
	@Transactional
	@Override
	public long registerBoard(MyBoardVO myBoard) {
		
		log.info("MyBoardService. registerBoard(myBoard)에 전달된 myBoard: " + myBoard);
		myBoardMapper.insertMyBoard(myBoard);
		System.out.println("MyBoardService에서 등록된 게시물의 bno: " + myBoard.getBno());
		
		//첨부파일이 없는 경우, 메소드 종료
		if(myBoard.getAttachFileList() == null || myBoard.getAttachFileList().size() <= 0) {
			return myBoard.getBno();
			
		}
		
		myBoard.getAttachFileList().forEach(attachFile -> {
			attachFile.setBno(myBoard.getBno());
			myBoardAttachFileMapper.insertAttachFile(attachFile);
			
		});
		
		return myBoard.getBno();

	}
	
	
	// 게시물 조회 : 글번호로 조회, 글 조회수 1 증가
	// 
	
	@Override
	public MyBoardVO getBoard(long bno) {
	//	log.info("MyBoardService. registerBoard(bno)에 전달된 bno: " + bno);
		
		//조회수 증가 후 bno 해당 게시물 반환
		
		return myBoardMapper.selectMyBoard(bno);
	}
	
	
	
	
	
	
	@Override
	public MyBoardVO getBoardDetailModify(long bno) {
	//	log.info("MyBoardService. registerBoard(bno)에 전달된 bno: " + bno);
		
		//조회수 증가 후 bno 해당 게시물 반환
		myBoardMapper.updateBviewsCnt(bno);
		return myBoardMapper.selectMyBoard(bno);
	}
	 
	
	// 게시물 수정 
	@Override
	public boolean modifyBoard(MyBoardVO myboard) {
	//	log.info("updateMyBoard.updateMyBoard(myBoard)에 전달된 myBoard: " + myboard);
		return myBoardMapper.updateMyBoard(myboard) == 1;

	}
	
	//게시물 삭제 - 컬럼 1만 삭제
	@Override
	public boolean setBoardDeleted(long bno) {
	//	log.info("MyBoardService.setBoardDeleted()에 전달된 bno: " + bno);
		return myBoardMapper.updateBdelFlag(bno) == 1;
	}
	
	// 게시물 실제 삭제
	@Override
	public boolean removeBoard(long bno) {
	//	log.info("MyBoardService.removeBoard: " + bno);
		return myBoardMapper.deletMyBoard(bno) == 1;

	}
	


	//게시물 삭제 관리자
	@Override
	public int removeAllDeletedBoard() {
		log.info("MyBoardService. removeAllDeltedBoard: ");
		return myBoardMapper.deletAllBoardSetDeleted() ;
	}

	@Override
	public List<MyBoardVO> getBoardList() {
		// TODO Auto-generated method stub
		return null;
	}



}

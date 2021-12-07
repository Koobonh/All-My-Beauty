package com.spring5218.mypro00.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spring5218.mypro00.common.paging.MyReplyPagingCreatorDTO;
import com.spring5218.mypro00.common.paging.MyReplyPagingDTO;
import com.spring5218.mypro00.domain.MyReplyVO;
import com.spring5218.mypro00.service.MyReplyService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping(value= {"/replies"})  
public class MyReplyController {
	
	// 생성자 자동 주입
	private MyReplyService myReplyService;
	
	public MyReplyController(MyReplyService myReplyService) {
			this.myReplyService  = myReplyService;
	}
	
	
	//게시물에 대한 댓글 목록 조회(페이징 - 전체 댓글 수 고려)
	@GetMapping(value = "/pages/{bno}/{page}",
			    produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8" })
	public ResponseEntity<MyReplyPagingCreatorDTO> showReplyList(@PathVariable("bno") Long bno,
																 @PathVariable("page") Integer pageNum) {
					
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 pageNum: " + pageNum);
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 bno: " + bno);
		
		MyReplyPagingDTO myReplyPaging = new MyReplyPagingDTO(bno, pageNum);
		log.info("댓글-컨트롤러-댓글목록 표시 - 생성된 MyReplyPagingDTO : " + myReplyPaging);
		
		MyReplyPagingCreatorDTO replyPagingCreator = myReplyService.getReplyListByBno(myReplyPaging);
		
		ResponseEntity<MyReplyPagingCreatorDTO> responseEntity = 
				new ResponseEntity<>(replyPagingCreator, HttpStatus.OK);
		
		log.info("댓글-컨트롤러-댓글목록 표시 - 브라우저로 전달되는 ResponseEntity<>: " + responseEntity);
		
		
		return responseEntity;
		
		
	}
				
	//테스트: 톰캣 기동 후 
    //브라우저에서 
				
	//게시물에 대한 댓글 등록 : rno 반환			
	@PostMapping(value = "/{bno}/new",
				 consumes = {"application/json; charset=UTF-8"},
				 produces = {"text/plain; charset=UTF-8" })	
				 		
 public ResponseEntity<String> registerReplyForBoard(@PathVariable("bno") Long bno,
		 											 @RequestBody MyReplyVO myReply) {
					 
	log.info("댓글-컨트롤러-게시물에 대한 댓글 등록- URI 추출 bno: " + bno);
	log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-myReply.getBno: " + myReply.getBno());
	log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-서비스로 전달되는 myReplyVO : " + myReply);
	
	Long registerdRno = myReplyService.registerReplyForBoard(myReply);
	log.info("댓글-컨트롤러-게시물에 대한 댓글 등록- 반환된 rno(registerdRno) : " + registerdRno);
	log.info("댓글-컨트롤러-게시물에 대한 댓글 등록- myReply.getRno : " + myReply.getRno());
	
	
	//삼항 연산자로 반환값 결정
	return registerdRno != null 
		   ? new ResponseEntity<>("게시물의 댓글 등록 성공", HttpStatus.OK)
		   : new ResponseEntity<>("게시물의 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
}
				 
				 
				 
	//게시물에 대한 댓글의 답글 등록: rno 반환
  @PostMapping(value = "/{bno}/{prno}/new",
			   consumes = {"application/json; charset=UTF-8"},
			   produces = {"text/plain; charset=UTF-8" })	

					   
   public ResponseEntity<String> registerReplyForReply(@PathVariable("bno") Long bno,
		   											   @PathVariable("prno") Long prno,
		   											   @RequestBody MyReplyVO myReply) {
				   
   log.info("댓글-컨트롤러-게시물에 대한 댓글 등록- URI 추출 bno: " + bno);
   log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-myReply.getBno: " + myReply.getBno());
   log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-prno : " + prno);
   log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-myReply.getPrno : " + myReply.getPrno());
   log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-MyReplyVO : " + myReply);
   
   
   Long registerdRno = myReplyService.registerReplyForReply(myReply);
   log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-반환된 rno(registerdRno): " + registerdRno);
   log.info("댓글-컨트롤러-게시물에 대한 댓글 등록-반환된 mtReply.getRno(): " + myReply.getRno());
   
   return registerdRno != null
		   ? new ResponseEntity<>("게시물의 댓글 등록 성공", HttpStatus.OK)
		   : new ResponseEntity<>("게시물의 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);

		}
			   
			   
    //게시물에 대한 특정 댓글/답글 조회
	@GetMapping(value = "{bno}/{rno}",
			    produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8" })
    public ResponseEntity<MyReplyVO> showReply(@PathVariable("bno") Long bno,
															 @PathVariable("rno") Long rno) {
								
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 bno: " + bno);
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 rno: " + rno);
		
		MyReplyVO myReply = myReplyService.getReply(bno, rno);
		log.info("댓글-컨트롤러-댓글 조회 - 브라우저로 전달되는 MtyReplyVO: " + myReply);
		
		return new ResponseEntity<>(myReply, HttpStatus.OK);
					
				}
			    
	//게시물에 대한 특정 댓글/답글 수정
	@RequestMapping(value = "/{bno}/{rno}",
					method = { RequestMethod.PUT, RequestMethod.PATCH },
					consumes = "application/json; charset=UTF-8",
					produces = "text/plain; charset=UTF-8" )
	
	 public ResponseEntity<String> modifyReply(@PathVariable("bno") Long bno,
			 								   @PathVariable("rno") Long rno,
											   @RequestBody MyReplyVO myReply) {
		
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 bno: " + bno);
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 rno: " + rno);
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 MyReplyVO: " + myReply);
	
		myReply.setBno(bno);
		myReply.setRno(rno);
		
		int modCnt = myReplyService.modifyReply(myReply);
		log.info("댓글-컨트롤러 댓글 수정- 수정된 댓글 수 : " + modCnt);
		
		return modCnt == 1
				 ? new ResponseEntity<>("댓글 수정 성공", HttpStatus.OK)
				 : new ResponseEntity<>("댓글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//게시물에 대한 특정 댓글/답글 삭제
	@DeleteMapping(value = "/{bno}/{rno}", produces = { "text/plain; charset=UTF-8" })
	public ResponseEntity<String> removeReply(@PathVariable("bno") Long bno,
					 						  @PathVariable("rno") Long rno) { 
		
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 bno: " + bno);
		log.info("댓글-컨트롤러- 댓글목록 표시-URI 추출 bno: " + rno);
		
		
		int delCnt = myReplyService.removeReply(bno, rno);
		log.info("댓글-컨트롤러- 댓글 삭제-삭제된 댓글 수: " + delCnt);
		
		return delCnt ==1
			? new ResponseEntity<>("댓글 삭제 성공", HttpStatus.OK)
			: new ResponseEntity<>("댓글 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
				 


				
				
		
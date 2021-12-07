package com.amb.bcomment.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amb.bcomment.domain.BCommentVO;
import com.amb.bcomment.paging.BCommentPagingCreatorDTO;
import com.amb.bcomment.paging.BCommentPagingDTO;
import com.amb.bcomment.service.BCommentService;

import lombok.extern.log4j.Log4j;

@RequestMapping(value={"/replies"})
@Controller
@Log4j
public class BCommentController {
	
	private BCommentService bcommentService;
	
	public BCommentController (BCommentService bcommentService) {
		this.bcommentService = bcommentService;
	}
	
	@GetMapping(value = "/pages/{bno}/{page}",
				
				produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8"})
	public ResponseEntity<BCommentPagingCreatorDTO> cmtList(@PathVariable("bno") Long bno,
															@PathVariable("page") Integer pageNum){
		
		log.info("URI추출 pageNum: " + pageNum);
		log.info("URI 추출 bno: " + bno);
		
		BCommentPagingDTO bCommentPaging = new BCommentPagingDTO(bno, pageNum);
		log.info("생성된 BCommentPagingDTO: " + bCommentPaging);
		
		BCommentPagingCreatorDTO bCommentPagingCreator = bcommentService.selectCnoListByBno(bCommentPaging);
  		
		ResponseEntity<BCommentPagingCreatorDTO> responseEntity =
				new ResponseEntity<>(bCommentPagingCreator, HttpStatus.OK);
		
		log.info("responseEntity: " + responseEntity);
		
		return responseEntity;
	}
	
	@PostMapping(value = "/{bno}/new",
				 consumes = {"application/json; charset=UTF-8"},
				 produces = { "text/plain; charset=UTF-8"})
	public ResponseEntity<String> registerCnoForBoard(@PathVariable("bno") Long bno,
													  @RequestBody BCommentVO bcomment){
//		log.info(bno);
//		log.info(bcomment.getBno());
//		log.info(creply);
//		log.info(creply);
//		log.info(bcomment.getCreply());
//		log.info(bcomment);
		
		Long registerdCno = bcommentService.registerCnoForBoard(bcomment);
		
		
		
		return registerdCno != null ? new ResponseEntity<>("게시물에 댓글 등록 성공", HttpStatus.OK)
							:new ResponseEntity<>("게시물에 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	@PostMapping(value = "/{bno}/{creply}/new",
			 consumes = {"application/json; charset=UTF-8"},
			 produces = { "text/plain; charset=UTF-8"})
public ResponseEntity<String> registerCnoForReply(@PathVariable("bno") Long bno,
												  @PathVariable("creply") Long creply,
												  @RequestBody BCommentVO bcomment){
	log.info(bno);
	log.info(bcomment.getBno());
	log.info(creply);
	log.info(bcomment.getCreply());
	log.info(bcomment);
	
	Long registerdCno = bcommentService.registerCnoForReply(bcomment);
	
	
	
	return registerdCno != null ? new ResponseEntity<>("댓글에 대한 답글 등록 성공", HttpStatus.OK)
						:new ResponseEntity<>("게시물에 댓글 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
}
	//게시물에 대한 특정 댓글 조회
	@GetMapping(value = "/{bno}/{cno}",	
			produces = { "application/json; charset=UTF-8", "application/xml; charset=UTF-8"})
	public ResponseEntity<BCommentVO> selectBComment(@PathVariable("bno") Long bno,
													 @PathVariable("cno") Long cno){
		BCommentVO bcomment = bcommentService.selectBComment(bno, cno);
		
		return new ResponseEntity<>(bcomment, HttpStatus.OK);
		
	}
	//게시글에 대한 댓글 수정
	@RequestMapping(value = "/{bno}/{cno}",
					method = {RequestMethod.PUT, RequestMethod.PATCH},
					consumes = "application/json; charset=UTF-8",
					produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> modifyCno(@PathVariable("bno") Long bno,
											@PathVariable("cno") Long cno,
											@RequestBody BCommentVO bcomment){
		int delCnt = bcommentService.modifyCno(bcomment);
		
		return delCnt== 1
				? new ResponseEntity<>("댓글 수정 성공", HttpStatus.OK)
				: new ResponseEntity<>("댓글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//게시글에 대한 댓글 삭제
	@DeleteMapping(value = "/{bno}/{cno}",
			produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> removeCno(@PathVariable("bno") Long bno,
									@PathVariable("cno") Long cno){
		
		int delCnt = bcommentService.removeCno(bno, cno);

		return delCnt== 1
		? new ResponseEntity<>("댓글 수정 성공", HttpStatus.OK)
		: new ResponseEntity<>("댓글 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}

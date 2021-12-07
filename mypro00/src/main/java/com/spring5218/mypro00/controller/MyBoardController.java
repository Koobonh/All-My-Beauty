package com.spring5218.mypro00.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring5218.mypro00.common.paging.MyBoardPagingCreatorDTO;
import com.spring5218.mypro00.common.paging.MyBoardPgingDTO;
import com.spring5218.mypro00.domain.MyBoardAttachFileVO;
import com.spring5218.mypro00.domain.MyBoardVO;
import com.spring5218.mypro00.service.MyBoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/myboard")  
public class MyBoardController {
	
	@Setter(onMethod_ = @Autowired)
	private MyBoardService myBoardService;

	
//	//게시물 전체 목록 조회
//	@GetMapping("/list")
//	public void showBoardList(MyBoardPgingDTO myBoardPagingDTO, Model model) { //반환 타입이 없다 -> WEB-INF / views / myboard/list.jsp가 결과 HTML 생성
//		log.info("컨트롤러  -  게시물 목록 죄회");
//		log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + myBoardPagingDTO);
//		                    //list의 c:forEach items=${boardList} 이름 맞춰주기
//		model.addAttribute("boardList", myBoardService.getBoardList(myBoardPagingDTO));
//		log.info("컨트롤러-게시물목록 조회 완료...");
//	}
	
	//게시물 등록  - 처리 
		@GetMapping("/register")
		public void showBoardregisterPage() {
			log.info("컨트롤러 - 게시물 등록 : ");
		}
		@GetMapping("/replyTest")
		public String replyAjaxTest() {
			log.info("replyAjaxTest실행됨");
			return "myboard/replyTest";
		}
	//게시물 등록  - 처리 
	@PostMapping("/register")
	public String registerNewBoard(MyBoardVO myBoard, RedirectAttributes redirectAttr) {
		
		log.info("컨트롤러 - 게시물 등록 : " + myBoard.toString());
		
		System.out.println("================ attachInfo ====================");
		if(myBoard.getAttachFileList() != null) {
		   myBoard.getAttachFileList()
				  .forEach(attachFile -> 
						System.out.println("첨부 파일 정보: " + attachFile.toString()));
		}
		
		System.out.println("==============================================");
		
		long bno = myBoardService.registerBoard(myBoard);
		log.info("등록된 게시물의 bno: " + bno);
		
		// 다른 페이지로는 못넘김 // 몇번째로 등록 됐는지 표시할 때 
		redirectAttr.addFlashAttribute("result", bno);
		
		// 
		//redirectAttr.addAttribute("result",  bno);
		
		return "redirect:/myboard/list";
		
	}
	
	
	//특정 게시물 조회 페이지 호출 
	@GetMapping({"/detail"})                        
	public void showBoardDetail(@RequestParam("bno") long bno, Model model,
								@ModelAttribute("myBoardPgingDTO") MyBoardPgingDTO myBoardPagingDTO ) {
		log.info("컨트롤러 - 게시물 조회  - 수정페이지 호출 : " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: " + myBoardPagingDTO);
		
		model.addAttribute("board", myBoardService.getBoard(bno));
		log.info("컨트롤러 - 화면으로 전달할 model : " + model);		
		
	}
	
	//#############   특정 게시물의 첨부파일 정보를 JSON으로 전달   #######################
	@GetMapping(value = "/getFiles", produces = {"application/json;charset=UTF-8" })
	@ResponseBody
	public ResponseEntity<List<MyBoardAttachFileVO>> showAttachFiles(Long bno) {
		log.info("컨트롤러: 조회할 첨부파일의 게시물 번호(bno) " + bno);
		
		return new ResponseEntity<List<MyBoardAttachFileVO>>(myBoardService.getAttachFilesByBno(bno),
														HttpStatus.OK);
	}
				
	
	
	// 게시물 목록 조회2 - 페이징 고려
	
	@GetMapping("/list")
	public void showBoardList(MyBoardPgingDTO myBoardPagingDTO, Model model) {
		log.info("컨트롤러 - 게시물 목록(페이징고려) 조회 완료....");
		log.info("컨트롤러에 전달된 사용자의 페이징처리 데이터: " + myBoardPagingDTO);
		
		model.addAttribute("boardList", myBoardService.getBoardList(myBoardPagingDTO));
		
		long rowAmountTotal = myBoardService.getRowAmountTotal(myBoardPagingDTO);
		log.info("컨트롤러에 전달된 게시물 총 개수: " + rowAmountTotal);
		
		MyBoardPagingCreatorDTO myBoardPagingCreatorDTO =
								new MyBoardPagingCreatorDTO (rowAmountTotal, myBoardPagingDTO);
		
		log.info("컨트롤러에 생성된 MyBoardPagingCreaterDTO 객체 정보 : " + myBoardPagingCreatorDTO.toString());
		
		model.addAttribute("pagingCreator", myBoardPagingCreatorDTO );
		log.info("컨트롤러 - 게시물 목록(페이징고려) 조회 완료....");
		
		
	}
	
	
	//특정 게시물 수정 페이지 호출 
	@GetMapping({"/modify"})                        
	public void showBoardModify(@RequestParam("bno") long bno, Model model,
								 MyBoardPgingDTO myBoardPagingDTO) {
		log.info("컨트롤러 - 게시물 조회  - 수정페이지 호출 : " + bno);
		log.info("컨트롤러 - 전달된  MyBoardPgingDTO : " + myBoardPagingDTO);
		
		model.addAttribute("board", myBoardService.getBoardDetailModify(bno));
		model.addAttribute("myBoardPagingDTO", myBoardPagingDTO);
		log.info("컨트롤러 - 화면으로 전달할 model : " + model);		
		
	}
	

	//특정 게시물 수정 처리
	@PostMapping("/modify")
	public String modifyBoard(MyBoardVO myBoard, RedirectAttributes redirectAttr,	
							  MyBoardPgingDTO myBoardPagingDTO) {
		
		log.info("컨트롤러 - 게시물 수정 전달된 myBoard 값: " + myBoard);
		log.info("컨트롤러 - 게시물 수정 전달된 MyBoardPagingDTO: " + myBoardPagingDTO);
		
		if (myBoardService.modifyBoard(myBoard)) {
			redirectAttr.addFlashAttribute("result", "sucessModify");
		} // esle(redirectAttr.addFlashAttribute("result", "fail"); 달아주면 null 과 같음
		
		//RedirectAttribute 유형의 객체에 전달할 페이징 데이터를 속성으로 바인딩
		redirectAttr.addAttribute("bno", myBoard.getBno());
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
		
		
		log.info("화면으로 전달된 redirectAttr" + redirectAttr);
	
		return "redirect:/myboard/detail?mod" ;
	
	}
	
	
	//특정 게시물 수정 처리 - > 조회페이지 호출
	@GetMapping("/detailmod")
	public String showBoardDetailMod(@RequestParam("bno") Long bno, Model model,
									  MyBoardPgingDTO myBoardagingDTO) {
		log.info("컨트롤러 - 게시물 수정 전달된 myBoard 값: " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPgingDTO: " + myBoardagingDTO);
		
		model.addAttribute("board", myBoardService.getBoardDetailModify(bno));
		model.addAttribute("myBoardagingDTO", myBoardagingDTO);
		log.info("컨트롤러 - 게시물 수정 전달된 myBoard 값: " + model);
		
		return "myBoard/detail";
	
	}
	
	
	
	//특정 게시물 삭제 요청
	@PostMapping("/delete")
	public String setBoardDeleted(@RequestParam("bno") long bno, RedirectAttributes redirectAttr,
														MyBoardPgingDTO myBoardPagingDTO ) {
		
		log.info("컨트롤러 - 게시물 삭제(bdelFlag 값 변경 글번호): " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPagingDTO: " + myBoardPagingDTO);
		
		if (myBoardService.setBoardDeleted(bno)) {
			redirectAttr.addFlashAttribute("result", "successRemove");
		}
		
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
		
		log.info("화면으로 전달된 redirectAttr: " + redirectAttr);
		
		return "redirect:/myboard/list";

	}
	
	//특정 게시물 실제 삭제 
	@PostMapping("/remove")
	public String removeBoard(@RequestParam("bno") Long bno, RedirectAttributes redirectAttr,
															 MyBoardPgingDTO myBoardPagingDTO ) {
		log.info("컨트롤러 - 게시물 삭제: 삭제되는 글번호: " + bno);
		log.info("컨트롤러 - 전달된 MyBoardPgingDTO " + myBoardPagingDTO);
		
		if (myBoardService.removeBoard(bno)) {
			redirectAttr.addFlashAttribute("result", "successRemove");
		}
		
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
		log.info("화면으로 전달된 redirectAttr: " + redirectAttr);
		
		return "redirect:/myboard/list";
	}
	
	// 게시물 삭제 - 삭제 요청된 모든 게시물 삭제
	@PostMapping("/removeAll")
	public String removeAllDeletedBoard(Model model, RedirectAttributes redirectAttr,
										MyBoardPgingDTO myBoardPagingDTO) {
		
		model.addAttribute("removeRowCnt", myBoardService.removeAllDeletedBoard());
		log.info("관리자에 의해 삭된 총 행수: " + model.getAttribute("removedRowCnt"));
		
		redirectAttr.addFlashAttribute("result", "successRemoveAll");
		redirectAttr.addAttribute("pageNum", myBoardPagingDTO.getPageNum());
		redirectAttr.addAttribute("rowAmountPerPage", myBoardPagingDTO.getRowAmountPerPage());
		redirectAttr.addAttribute("scope", myBoardPagingDTO.getScope());
		redirectAttr.addAttribute("keyword", myBoardPagingDTO.getKeyword());
		
		log.info("화면으로 전달될 redirectAttr: " + redirectAttr);
		
		return "redirect:/myboard/list";
		
	}
	
}

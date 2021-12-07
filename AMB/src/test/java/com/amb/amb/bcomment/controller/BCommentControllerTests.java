package com.amb.amb.bcomment.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration //DispatcherServlet의 구성설정파일을 사용하여 컨트롤러를 테스트하기 위해 필요한 설정
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
 "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class BCommentControllerTests {
	
	 @Setter(onMethod_ = { @Autowired })
	 private WebApplicationContext ctx;
	 
	 //테스트 객체를 담을 필드
	 private MockMvc mockMvc;
	 
	 //테스트 전에 테스트 객체를 생성하여 테스트 환경 설정
	 @Before
	 public void setup() {
	 this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	 } //테스트 환경 구성-끝
	 
//	 @Test
//	 public void testShowReplyList() throws Exception {
//	  int resultStatus = 
//	  mockMvc.perform(get("/replies/pages/1/1")
//	  //서버가 보낸 것이 JSON 일 때만 처리(컨트롤러의 produces 에 대응)
//	  .accept("application/json; charset=UTF-8")
//	  //서버로 보내는 데이터에 대한 인코딩을 UTF-8로 지정
//	  .characterEncoding("utf-8"))
//	  .andDo(print())// 콘솔 출력
//	  .andReturn()
//	  .getResponse()
//	  .getStatus();
//	  log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 처리 상태 코드(resultStatus): " + resultStatus );
//	 }
//	 @Test
//	 public void testRegisterReplyForBoard() throws Exception {
//		 BCommentVO bComment = new BCommentVO();
//		 
//		 bComment.setBno(1L);
//		 bComment.setCcontent("컨트롤러-게시물에 대한 댓글 등록테스트: JSON입력테스트");
//		 bComment.setMid("test5545");
//		 
//		 String bCommentJsonStr = new Gson().toJson(bComment);
//		 
//		 log.info("컨트롤러-게시물에 대한 댓글 등록 테스트: json-string객체: " + bCommentJsonStr);
//		 
//		 int resultStatus
//		 		= mockMvc.perform(post("/replies/1/new")
//		 					
//		 				.accept("text/plain; charset=UTF-8")
//		 				
//		 				.contentType("application/json; charset=UTF-8")
//		 				
//		 				.characterEncoding("utf-8")
//		 				
//		 				.content(bCommentJsonStr))
//		 			.andDo(print())
//		 			.andReturn()
//		 			.getResponse()
//		 			.getStatus();
//		 log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 상태 처리 코드(resultStatus): " + resultStatus);
//	 }
//	 @Test
//	 public void testRegisterReplyForReply() throws Exception {
//		 BCommentVO bComment = new BCommentVO();
//		 
//		 bComment.setBno(1L);
//		 bComment.setCcontent("컨트롤러-댓글에 대한 답글 테스트");
//		 bComment.setMid("test5545");
//		 bComment.setCreply(25L);
//		 
//		 String bCommentJsonStr = new Gson().toJson(bComment);
//		 
//		 log.info("컨트롤러-댓글에 대한 답글 등록 테스트: json-string객체: " + bCommentJsonStr);
//		 
//		 int resultStatus
//		 		= mockMvc.perform(post("/replies/1/25/new")
//		 					
//		 				.accept("text/plain; charset=UTF-8")
//		 				
//		 				.contentType("application/json; charset=UTF-8")
//		 				
//		 				.characterEncoding("utf-8")
//		 				
//		 				.content(bCommentJsonStr))
//		 			.andDo(print())
//		 			.andReturn()
//		 			.getResponse()
//		 			.getStatus();
//		 log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 상태 처리 코드(resultStatus): " + resultStatus);
//	 }
//	 @Test
//	 public void testSelectCno() throws Exception{
//		 int resultStatus
//	 		= mockMvc.perform(get("/replies/1/25")
//	 					
//	 				.accept("application/json; charset=UTF-8")
//	 				
//	 				.characterEncoding("utf-8"))
//	 			
//	 			.andDo(print())
//	 			.andReturn()
//	 			.getResponse()
//	 			.getStatus();
//	 log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 상태 처리 코드(resultStatus): " + resultStatus);
//	 }
//	 @Test
//	 public void testModifyReply() throws Exception {
//		 BCommentVO bComment = new BCommentVO();
//		 
//		 bComment.setCno(25L);
//		 bComment.setCcontent("컨트롤러-게시물에 대한 댓글 수정테스트");
//		 
//		 
//		 String bCommentJsonStr = new Gson().toJson(bComment);
//		 
//		 int resultStatus
//		 		= mockMvc.perform(put("/replies/1/25")
//		 					
//		 				.accept("text/plain; charset=UTF-8")
//		 				
//		 				.contentType("application/json; charset=UTF-8")
//		 				
//		 				.content(bCommentJsonStr))
//		 			.andDo(print())
//		 			.andReturn()
//		 			.getResponse()
//		 			.getStatus();
//		 log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 상태 처리 코드(resultStatus): " + resultStatus);
//	 }
//	}
	 @Test
	 public void testRemoveReply() throws Exception {

		 int resultStatus
		 		= mockMvc.perform(delete("/replies/1/161").accept("text/plain; charset=UTF-8"))
		 				
		 	
		 			.andDo(print())
		 			.andReturn()
		 			.getResponse()
		 			.getStatus();
		 log.info("웹브라우저에 전달되는 ResponseEntiry 객체의 상태 처리 코드(resultStatus): " + resultStatus);
	 }
	}
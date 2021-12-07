package com.amb.amb.bcomment.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.amb.bcomment.domain.BCommentVO;
import com.amb.bcomment.mapper.BCommentMapper;
import com.amb.bcomment.paging.BCommentPagingDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
@Log4j
public class BCommentMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BCommentMapper bCommentmapper;
	
	/*
	 * @Test public void testMapper() { log.info(bCommentmapper); }
	 */
	
	/*
	 * @Test public void testShowBcommentList() {
	 * 
	 * Long targetBno = 1L;
	 * 
	 * List<BCommentVO> myReplies = bCommentmapper.showBCommentList(targetBno);
	 * myReplies.forEach(myReply -> System.out.println(myReply));
	 * 
	 * }
	 */
	/*
	 * @Test public void testinsertBCommentForBoard() { BCommentVO bcomment = new
	 * BCommentVO();
	 * 
	 * bcomment.setBno(1L); //SQL Developer에서 확인된 가장 최신 게시물의 bno를 지정
	 * bcomment.setCcontent("매퍼 댓글 입력 테스트 "); bcomment.setMid("replyer");
	 * log.info("매퍼 - 추가 전 댓글 객체: " + bcomment);
	 * 
	 * bCommentmapper.insertBCommentForBoard(bcomment); log.info("매퍼 - 추가 후 댓글 객체: "
	 * + bcomment); //bCommentmapper.showBCommentList(1L, bcomment.getCno()); }
	 */
/*	@Test
	public void testinsertBCommentForReply() {
		BCommentVO bcomment = new BCommentVO();
	 
	 bcomment.setBno(1L); //SQL Developer에서 확인된 가장 최신 게시물의 bno를 지정
	 bcomment.setCcontent("매퍼 댓글 입력 테스트 ");
	 bcomment.setCno(63L);
	 bcomment.setMid("5545");
	 bcomment.setCreply(10L);
	 log.info("매퍼 - 추가 전 댓글 객체: " + bcomment);
	 
	 log.info(bCommentmapper.insertBCommentForReply(bcomment));
	 
	 log.info("매퍼 - 추가 후 댓글 객체: " + bcomment);
	 bCommentmapper.showBCommentList(1L);*/

/*
 * @Test public void testSelectBComment() {
 * 
 * Long targetBno = 1L; Long targetCno = 10L;
 * 
 * BCommentVO bcomment = bCommentmapper.selectBComment(targetBno, targetCno);
 * log.info("특정 댓글/답글 조회 테스트: " +bcomment); }
 */

/*
 * @Test public void testUpdateBComment() { long targetBno = 1L; //SQL long
 * targetCno = 3L;
 * 
 * BCommentVO bcommentVO = bCommentmapper.selectBComment(targetBno,targetCno);
 * bcommentVO.setCcontent("매퍼 - 수정 테스트..");
 * 
 * int count = bCommentmapper.updateBComment(bcommentVO);
 * log.info("UPDATE COUNT: " + count);
 * log.info(bCommentmapper.selectBComment(targetBno, targetCno)); }
 */

/*
 * @Test public void testDeleteMyReply(){
 * 
 * Long targetBno = 1L; Long targetCno = 4L; int count =
 * bCommentmapper.deleteBComment(targetBno, targetCno); log.info("DELETE COUN:"+
 * count); log.info(bCommentmapper.selectBComment(targetBno, targetCno));
 * 
 * }
 */
//	@Test
//	public void testselectCnoListPaging() { 
//		long targetBno = 1;
//  
//		BCommentPagingDTO bcommentPagingDTO = new BCommentPagingDTO(targetBno, 1);
// 
//		long totalCnoCnt = bCommentmapper.selectCnoTotalByBno(bcommentPagingDTO);
//		log.info("댓글 총 개수: " + totalCnoCnt);
//  
//		List<BCommentVO> myCnties = bCommentmapper.selectCnoList(bcommentPagingDTO);
//		myCnties.forEach(myCnt -> System.out.println(myCnt));
//  
//  }
}
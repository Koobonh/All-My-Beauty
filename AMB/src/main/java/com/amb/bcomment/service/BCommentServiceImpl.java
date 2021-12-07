package com.amb.bcomment.service;

import org.springframework.stereotype.Service;

import com.amb.bcomment.domain.BCommentVO;
import com.amb.bcomment.mapper.BCommentMapper;
import com.amb.bcomment.paging.BCommentPagingCreatorDTO;
import com.amb.bcomment.paging.BCommentPagingDTO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BCommentServiceImpl implements BCommentService{
	
	private BCommentMapper bcommentMapper;
	
	public BCommentServiceImpl(BCommentMapper bcommentMapper) {
		this.bcommentMapper = bcommentMapper;
	}
	//특정 게시물에 대한 전체 댓글 조회
	@Override
	public BCommentPagingCreatorDTO selectCnoListByBno(BCommentPagingDTO bCommentPaging) {
	
		int cmtTotalByBno = bcommentMapper.selectCnoTotalByBno(bCommentPaging);
		
		int pageNum = bCommentPaging.getPageNum();
		
		BCommentPagingCreatorDTO bCommentPagingCreator = null;
		
		if(cmtTotalByBno ==0) {
			bCommentPaging.setPageNum(1);
			log.info("댓글이 없는 경우, pageNum은  1:");
			
			bCommentPagingCreator = new BCommentPagingCreatorDTO(cmtTotalByBno, bCommentPaging, null);
		}else {
			if(pageNum == -1) {
				pageNum = (int) Math.ceil(cmtTotalByBno/(bCommentPaging.getRowAmountPerPage()*1.0));
				bCommentPaging.setPageNum(pageNum);
				log.info("댓글추가후 :"+bCommentPaging);
			}
			
			bCommentPagingCreator = new BCommentPagingCreatorDTO(
										cmtTotalByBno,
										bCommentPaging,
										bcommentMapper.selectCnoList(bCommentPaging));
			log.info("생성된 BCommentPagingCreatorDTO:"+bCommentPagingCreator);
			log.info("bCommentPagingCreator가 컨트롤러로 전달됨");
			
		}
		return bCommentPagingCreator;
	}
	//특정 게시물에 댓글 등록
	@Override
	public long registerCnoForBoard(BCommentVO bcomment) {
		log.info("처음 전달된 BCommentVO: " + bcomment);
		
		bcommentMapper.insertBCommentForBoard(bcomment);
		
		
		return bcomment.getCno();
	}
	//특정 게시물의 총 댓글 갯수 확인
	@Override
	public long selectCnoTotalByBno(BCommentPagingDTO bcommentPaging) {
		return bcommentMapper.selectCnoTotalByBno(bcommentPaging);
	}
	//특정 댓글에 대한 답글 등록
	@Override
	public long registerCnoForReply(BCommentVO bcommeBntVO) {
		
		bcommentMapper.insertBCommentForReply(bcommeBntVO);
		
		
		return bcommeBntVO.getCno();
	}
	//특정 댓글 조회
	@Override
	public BCommentVO selectBComment(long bno, long cno) {
		
		BCommentVO bcomment= bcommentMapper.selectBComment(bno, cno);
		return bcomment;
	}
	
	//특정 댓글 수정
	@Override
	public int modifyCno(BCommentVO bcomment) {
		log.info("전달된 BCommentVo: " + bcomment);
		
		Integer modcnt = bcommentMapper.updateBComment(bcomment);
		
		return modcnt;
	}
	
	//특정 댓글 삭제
	@Override
	public int removeCno(long bno, long cno) {
		log.info("삭제시 전달된 bno: " + bno);
		log.info("전달된 cno: " + cno);
		
		Integer delCnt = bcommentMapper.deleteBComment(bno,cno);
	
		return delCnt;
	}
	
}

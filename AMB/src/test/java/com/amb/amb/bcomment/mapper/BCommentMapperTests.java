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
	
}
package com.spring5218.mypro00.mapper02;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring5218.mypro00.common.paging.MyReplyPagingDTO;
import com.spring5218.mypro00.domain.MyReplyVO;
import com.spring5218.mypro00.mapper.MyReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
@Log4j

public class MyReplyMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MyReplyMapper myReplyMapper;
	

	
	
	
	
	
	
	
	
}
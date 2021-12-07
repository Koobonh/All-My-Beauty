package com.spring5218.mypro00.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/reply")
public class replyTestController {
	
	@RequestMapping("/replyTest")
	public String replyAjaxTest() {
		log.info("replyAjaxTest실행됨");
		return "myboard/replyTest";
	}
}

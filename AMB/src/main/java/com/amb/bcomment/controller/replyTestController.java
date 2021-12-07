package com.amb.bcomment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/reply")
public class replyTestController {
	
	@RequestMapping("/replyTest")
	public String replyAjaxTest() {
		return "board/replyTest";
	}
}

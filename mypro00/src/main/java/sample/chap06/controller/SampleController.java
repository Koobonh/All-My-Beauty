package sample.chap06.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import sample.chap06.domain.SampleDTO;
import sample.chap06.domain.SampleDTOList;
import sample.chap06.domain.TodoDTO;


@Controller
//RequestMapping 클래스 위에 하거나 아래 처럼 하거나 택1
@RequestMapping("/sample/*")
@Log4j
public class SampleController {
	
//		// RequestMapping 클래스 위에다가 할 수 있다. 
//		@RequestMapping("/sample/*")
//		public void basic() {
//		log.info("basic=======================================");
//		
//		}
		
		
		@RequestMapping("/sample/1")
		public void basic1() {
			log.info("basic1111=======================================");
		
		}
		
		
	
		@RequestMapping("/sample/2")
		public void basic2() {
			log.info("basic2222=======================================");
		
		}
		
		
		
		@RequestMapping(value = "/basic", method = {RequestMethod.GET, RequestMethod.POST})
		public void basicGet() {
			log.info("basicGET=======================================");

		}
		
		@GetMapping("/basicOnlyGet")
		public void vasicGet2() {
			log.info("basicGET222222=======================================");

		}
		
		
		@PostMapping("/basicOnlyPost")
		public void basicPost() {
			log.info("basicGET222222=======================================");

		}
		
		
		
		@GetMapping("/ex01")
		public String ex01(SampleDTO dto) {
			
			log.info("=================" + dto);
			        // 아래가 jsp 이름 찾는 것
			return "ex01";
			
		}
		
		
		@GetMapping("/ex02")
		public String ex02(@RequestParam("name") String name1,
						   @RequestParam("age") String age1) {
			log.info("name으로 전달된 값: " + name1);
			log.info("age로 전달된 값:" + age1);
			
			return "ex02";
			
		}
		
		
	
		
		@GetMapping("/ex02List")
			public String ex02List(@RequestParam("ids")ArrayList<String> myIds) {
			
			log.info("ids: "+ myIds);
			
			return "ex02List";
		}
		
		
		
		@GetMapping("/ex02Array")
		public String ex02Array(@RequestParam("ids") String[] myIds) {	
			log.info("array ids(ids로 전달된 String배열): " + Arrays.toString(myIds));
			return "ex02Array";
		}
		
		
		@GetMapping("/ex02dto")
		public String ex02dto(SampleDTO dto) {
			
			log.info("dto 매개변수에 저장된 값: " + dto);
			return "ex02dto";
			
		}
		
		
		
		@GetMapping("/ex02Bean")
		public String ex02Bean(SampleDTOList list) {
			
			log.info("list dtos: " + list);
			
			return "ex02Bean";
		}
		
		
		
		@GetMapping("/ex03")
		public String ex03(TodoDTO todo) {
			log.info("todo: " + todo);
			return "ex03";
			
		}
		
		
		//page 매개변수(기본타입 int, String, Integer, 배열 포함)로 전달된 값은 JSP까지는 전달되지 못합니다.
		@GetMapping("/ex04")
		//public String ex04(SampleDTO dto, int page) { //기본타입 jSP까지 전달되지 않음
			//public String ex04(SampleDTO dto, Integer page) { //기본타입 jSP까지 전달되지 않음
			public String ex04(SampleDTO dto, String[] page) { 

			log.info("dto: " + dto);
			log.info("page: " + page );
			log.info("page[0]: " + page[0]);
			return "/sample/ex04";
		}
		
		//localhost:8080/myro00/sample/ex03?title=신상현&dueDate=2021/11/3
		// 이클립스 콘솔에는 전달
		// 사용자 웹브자우저 표시내용은 전달 안됨(int 사용시)
		// String, int, integer 다 전달안됨.. 콘솔까지만 전달되고 jsp 전달 ㄴ ㄴ ㄴ ㄴ ㄴ 
		
		
		
		@GetMapping("/ex05")
		//public String ex04(SampleDTO dto, int page) { //기본타입 jSP까지 전달되지 않음
			//public String ex04(SampleDTO dto, Integer page) { //기본타입 jSP까지 전달되지 않음
		                                                  // jsp 파일로 보내는 이름
			public String ex05(SampleDTO dto, @ModelAttribute("page") String page1) { 

			log.info("dto: " + dto);
			log.info("page1: " + page1 );
			
			
			
			return "/sample/ex04";
		}
		
		// 웹브라우저 url
		//http://localhost:8080/mypro00/sample/ex05?name=aaa&age=11&page1=9
		
		
		
		
		@GetMapping("/ex06")
		public String ex06() {
			
			return "redirect:/sample/ex05?name=AAAA&age=53&page=9";   //url에 컨테스트 이름 ㄴㄴㄴ
			
		}
		
		

		@GetMapping("/ex07")
		public @ResponseBody SampleDTO ex07() {
			log.info("/ex07====================");
			SampleDTO dto = new SampleDTO();
			dto.setAge(10);
			dto.setName("홍길동");
			return dto;
		}
		

		
		@GetMapping("/ex08")
		public ResponseEntity<String> ex08() {
			log.info("/ex08====================");
			
		    // {"name": "홍길동"}
			String msg = "{\"name\": \"홍길동\"}";
			
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", "application/json;charset=UTF-8");
			
			return new ResponseEntity<String>(msg,header,HttpStatus.OK);
			
			}
		
		
		@GetMapping("/exUpload")
			public  void exUpload() {
				log.info("/exUpload=============================");
		}
		
		
		
		@PostMapping("/exUploadPost")
		//public void exUploadPost(ArrayList<MultipartFile> files, SampleDTO sampleDTO) {
		public void exUploadPost(ArrayList<MultipartFile> files, @ModelAttribute("dto") SampleDTO sampleDTO)  {
			
			log.info("name: " + sampleDTO.getName());
			log.info("age: " + sampleDTO.getAge());
			
			String uploadForder = "C:/upload";

			
			// exUpload.jsp <div><input type="file" name="files"></div> files랑 이름 같아야함
			// 람다식 형식 ->
			files.forEach(file -> {
				log.info("=====파일업로드 호출 및 시작===============");
				log.info("업로드 파일 name: " + file.getOriginalFilename());
				log.info("업로드 파일 size: " + file.getSize());
				if(file.getSize() > 0) {
					File saveFile = new File (uploadForder, file.getOriginalFilename());
					try {
						
					file.transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
				
			});
		
		}
		
		
		
		
		
		
}
			

		
		
		
		
		



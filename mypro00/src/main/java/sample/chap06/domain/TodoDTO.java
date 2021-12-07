package sample.chap06.domain;

import java.util.Date;

// @이 처리 못함 -> 오류 발생
//import java.sql.Date;


import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TodoDTO {
	
	private String title;

	@DateTimeFormat(pattern = "yyyy/mm/dd")
	private Date dueDate;
	
	

}

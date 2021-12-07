package com.spring5218.mypro00.common.fileupload;



import java.io.File;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadControllerForm {
	private static final Logger log = LoggerFactory.getLogger(FileUploadControllerForm.class);
	
	//저장경로 설정(Windeows 환경이므로 경로구분자를 \\로 지정)
	private String uploadFileRepoDir = "C:\\myupload" ;
	
	
	//다중파일 업로드 방법1: form 방식의 파일 업로드
	//파일 업로드 요청 JSP 페이지 호출
	@GetMapping("/fileUploadForm")
	public String callFileUploadForm() {
		log.info("upload Form======================");
		return "sample/fileUploadForm";

	}
	
	//다중 파일 업로드 방법1: form 방식의 파일업로드
	//Model 이용, 업로드 파일 저장
	@PostMapping("/fileUploadFormAction")
//	public String fileUploadFormActionPost(MultipartFile[] uploadFiles, Model model) {
		public String fileUploadFormActionPost(ArrayList<MultipartFile> uploadFiles, Model model) {
		log.info("Fileupload With Form======================");
		
		for(MultipartFile multipartUploadFile: uploadFiles) {	
			log.info("upload Form======================");
			log.info("upload File Name: " + multipartUploadFile.getOriginalFilename());
			log.info("upload Form Size: "+ multipartUploadFile.getSize());
			
			
			//업로드 파일의 리소스
			//File saveUploadFile = new File(uploadFileRepoDir, multipartUploadFile.getOriginalFilename());
			
			//위의 코드 아래의 코드로 대체
			String strUploadFileName = multipartUploadFile.getOriginalFilename();
			
			//엣지, IE 오류 해결 multipartUploadFile.getOriginalFilename(); 업로드 파일이름만 추출
			//파일 이름만 있는경우, 파일이름만 추출됨																  
			strUploadFileName = strUploadFileName.substring(strUploadFileName.lastIndexOf("\\")+1);
			log.info("수정된 파일이름strUploadFileName): " + strUploadFileName);
			
			//업로드 정보
			File saveUploadFile = new File(uploadFileRepoDir,strUploadFileName);
			
			try {
				multipartUploadFile.transferTo(saveUploadFile);
		
		} catch (Exception e) {
			log.error(e.getMessage());
			
	}
}
		return "sample/fileUploadFormAction";
	}
}

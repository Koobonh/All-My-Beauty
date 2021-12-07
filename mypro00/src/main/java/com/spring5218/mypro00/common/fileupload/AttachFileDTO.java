package com.spring5218.mypro00.common.fileupload;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttachFileDTO {
    private String fileName;   	//원본파일이름
    private String uploadPath; 	//업로드 경로 : yyyy/MM/dd 형식의 문자열이 저장됨
    private String uuid;	    //uuid
    private String fileType;   	//파일유형(이미지:Y, 이미지아님:N)
    private String repoPath = "C:\\myupload";   //서버레포지토리경로(C:\myupload) 저장

}

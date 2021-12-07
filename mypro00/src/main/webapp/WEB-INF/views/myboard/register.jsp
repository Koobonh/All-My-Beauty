<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value = "${pageContext.request.contextPath} " />

<%@ include file ="../myinclude/myheader.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h3 class="page-header">Board - Register</h3>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"> <h4>게시글 등록</h4>  </div>
                        <div class="panel-body">
                             
        <form role="form" action="${contextPath}/myboard/register" method="post" >
        <div class="form-group">
         <label>제목</label>
          <input class="form-control" name="btitle">
      <!--  <p class="help-block">Example block-level help text here.</p> -->
         </div>
         
         <div class="form-group">
         <label>내용</label> <textarea class="form-control" rows="3" name="bcontent"></textarea>
       	 </div>
       	 
         <div class="form-group">
         <label>작성자</label> <input class="form-control" name="bwriter">
         </div>
         
      <%-- <button type="submit" class="btn btn-primary" onclick ="sendBaord()">등록</button> --%>
      <button type="submit" class="btn btn-primary" id="btnRegister">등록</button>
         <button type="button"  class="btn btn-warning" data-oper="list" 
         		 onClick="location.href='${contextPath}/myboard/list'">취소 
         </button>
</form>


                    </div><!-- /.panel-body -->
                </div><!-- /.panel -->
            </div><!-- /.col-lg-12 -->
        </div><!-- /.row -->
        
        
        <div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">파일첨부</div>
            <div class="panel-body" id="panelFileBody"> <!--id 추가 -->
                <div class="form-group uploadDiv">
                    <input id="inputFile" type="file" name="uploadFiles" multiple><br>
                </div>
                <div class="form-group fileUploadResult">
                    <ul>
                    <!-- 업로드 후, 업로드 처리결과가 표시될 영역  -->
                    </ul>
                </div>
            </div><!-- /.panel-body -->
        </div><!-- /.panel -->
    </div><!-- /.col-lg-12 -->
</div><!-- /.row -->
      
        
<script>

function sendBoard(){
    var frmBoard=document.frmBoard;
    var btitle=frmBoard.btitle.value;
    var bcontent=frmBoard.bcontent.value;
    var bwriter=frmBoard.bwriter.value;
<%--     
    if(btitle.length==0 ||btitle==""){
        alert("글제목은 필수입니다.");
    } else if(bcontent.length==0 ||bcontent==""){
        alert("글내용은 필수입니다.");
    } else if(bwriter.length==0 ||bwriter==""){
        alert("작성자는 필수입니다.");
    } else {
        frmBoard.method="post";
        frmBoard.action="${contextPath}/myboard/register";
        frmBoard.submit();

    } --%>
    
    if( (btitle.length==0 ||btitle=="") ||
        (bcontent.length==0 ||bcontent=="") ||
        (bwriter.length==0 ||bwriter=="") ){
    	
    	return false;
       /*  alert("글제목/글내용/작성자를 모두 입력해야 합니다."); */
    } else {
    	return true;
    	
       /*  frmBoard.method="post";
        frmBoard.action="${contextPath}/myboard/register";
        frmBoard.submit(); */

    }
}

//업로드 파일의 확장자 및 최대 파일 크기 검사 함수
function checkUploadfile(fileName, fileSize) {
    // 확장자에 대한 정규식 및 최대 허용크기(1MB) 저장변수
    var maxSizeAllowed = 10048576;
    var regExpForFileExtention = /(.*)\.(exe|sh|zip|alz)$/i ;
    
    //최대 허용 크기 제한 검사
    if (fileSize >= maxSizeAllowed) {
        alert("업로드 파일의 제한된 크기(1MB)를 초과했습니다.");
        return false;
    }
    
    //업로드파일의 확장자 검사:
    if (regExpForFileExtention.test(fileName)) {
        alert("해당 종류(exe/sh/zip/alz)의 파일은 업로드할 수 없습니다.");
        return false;
    }
    return true;
}


var bnoValue = '<c:out value="${board.bno}"/>';

//업로드 결과 표시 함수
function showUploadedFiles(uploadResult) {
  console.log("showUploadedFiles 실행: 화면 표시 시작=======================================");
  //ul 태그 변수화
  
  //서버로 부터 전달된 파일 업로드 결과내용이 없으면, 함수 종료
  if(!uploadResult || uploadResult.length == 0) {
  	return;
  }
  
  var fileUploadResult = $(".fileUploadResult ul");
  var str = "";
  //전달받은 배열형식 데이터 각각에 대하여
  $(uploadResult).each(function(i, obj) {
      if (obj.fileType=="F") {  //이미지가 아닌 경우, 아이콘 이미지 및 원본 파일이름 표시
          var calledPathFileName =  encodeURIComponent( obj.repoPath + "/" + obj.uploadPath + "/" +
                                                        obj.uuid + "_" + obj.fileName ); //추가
          console.log("호출된 파일이름: " + calledPathFileName); //추가

    str += "<li data-uploadpath='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "'"
          +  "       data-filename='" + obj.fileName + "' data-filetype='" + obj.fileType + "' >"
          +  "    <img src='${contextPath}/resources/img/icon-attach.png' alt='No Icon' "
          +  "          style='height: 18px; width: 18px;'>"
          +           obj.fileName
          +  "    <span data-filename='" + calledPathFileName + "' data-filetype='F'>[삭제]</span>"
          +  "</li>";
              
      } else if (obj.fileType=="I") {//이미지파일인 경우 썸네일 및 원본 파일이름 표시
          //전체 경로명이 포함된 썸네일 파일이름을 encodeURIComponent로 처리
          var thumbnailFilePath = 
                  encodeURIComponent(obj.repoPath + "/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
          console.log("encodeURIComponent 처리 파일이름: " + thumbnailFilePath);

          //원본이미지 파일이름(경로포함)
          //var originPathImageFileName = obj.repoPath + "/" + obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName; //추가
          //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/"); //추가

      str += "<li data-uploadpath='" + obj.uploadPath + "'     data-uuid='" + obj.uuid + "'"
    	  +  "       data-filename='" + obj.fileName + "' data-filetype='" + obj.fileType + "' >"
      	  +  "    <img src='${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath + "'"
      	  +  "          alt='No Icon' style='height: 18px; width: 18px;'>"
      	  +       obj.fileName
      	  +  "    <span data-filename='" + thumbnailFilePath + "' data-filetype='I'>[삭제]</span>"
      	  +  "</li>";
      }
  });
  //기존 페이지에 결과를 HTML로 추가
  fileUploadResult.append(str);
}

//input 초기화를 위해 div 요소의 비어있는 input 요소를 복사해서 저장함.
var cloneUploadDiv = $(".uploadDiv").clone() ;  //<-- 파일업로드 처리 함수위에 추가


//파일업로드 처리
$("#panelFileBody").on("change", "input[type='file']" , function(e) {
    //FormData() Ajax 파일 전송 시에 사용되는 Web API 클래스의 생성자
    var formData = new FormData();

    //uploadFiles 이름의 file 유형 input 요소를 변수에 저장
    var inputFiles = $("input[name='uploadFiles']");
    
    //inputFiles에 저장된 파일들을 files 변수에 저장.
    //inputFiles[0]은 첫번째 input 요소를 의미(input 요소가 하나만 있더라도 [0]을 명시해야 함).
    var files = inputFiles[0].files;
    console.log(files);
    
    //formdata 객체에  파일추가
    for(var i = 0; i < files.length ; i++) {

        if (!checkUploadfile(files[i].name, files[i].size)) {   //파일 확장자 및 최대크기검사 실행
        	return false;  //검사를 만족하지 못하면 false를 반환하고 파일업로드 중지
        }

        
        formData.append("uploadFiles", files[i]);
    }
    
    //url 키에 명시된 주소의 컨트롤러에게 formData 객체를 POST 방식으로 전송.
    $.ajax({
    	
        url: '${contextPath}/fileUploadAjaxAction',
        processData: false, //contentType에 설정된 형식으로 data를 처리하지 않음.
        contentType: false, //contentType에 MIME 타입을 지정하지 않음.
        data: formData,
        type: 'post',
        dataType: 'json',  //수정
        success: function(uploadResult, status){
                     alert("첨부파일의 업로드 완료: " + status);
                     $(".panelFileBody").html(cloneUploadDiv.html());    //파일이름이 선택된 기존 input을 초기화
                     //$(".uploadDiv #inputFile").val("");  //다른 방법 브라우저 버전따라 실행이 않될 수 있음(권장않함)
                     showUploadedFiles(uploadResult);
        }
    })
});



$(".fileUploadResult").on("click", "span", function(e) {
	
	//this: span 
	var targetFileName = $(this).data("filename");
	var targetFileType = $(this).data("filetype");
	//console.log(targetFileName);
	//console.log(targetFileType);
	
	//span이 포함된 li 변수에 저장
	var parentLi = $(this).parent();
	//var targetLi = $(this).consest("li");
	
	$.ajax({
		url: '${contextPath}/deleteUploadedFile',
		data: {fileName: targetFileName, fileType: targetFileType},
		dataType: 'text',
		type: 'post',
		success: function(result){
			
			if(result == "SuccessDeletingFile") {
				alert("파일이 삭제되었습니다.");
				
				//이벤트 위임을 이용하여, 삭제된 파일의 항목을 브라우저의 HTML 문서에서 삭제합니다.
				// 이 때, 
				parentLi.remove();
				//targetLi.remove);
				
			} else {
				alert("오류: 파일 삭제 실패.");
			}
		}
	});
});

$("#btnRegister").on("click", function(e){
	
	if(!sendBoard()) {
		
		 alert("글제목/글내용/작성자를 모두 입력해야 합니다.");
		 return;
	}
	
	
	var formObj = $("form[role='form']");
	var strInputHidden = "";
	
	//업로드 결과의 li 요소 각각에 대하여 다음을 처리(이벤트 위임 이용)
	$(".fileUploadResult ul li").each(function(i, obj){
		var objLi = $(obj);
		
		//name 속성 값은 MyBoardVO의 첨부파일 목록이 저장되는 attachFileList 필드명(List 객체)으로 지정합니다.
		strInputHidden
			+= " <input type ='hidden' name='attachFileList["+i+"].uuid' value='"+objLi.data("uuid")+"'>"
			+  " <input type ='hidden' name='attachFileList["+i+"].uploadPath' value='"+objLi.data("uploadpath")+"'>"
			+  " <input type ='hidden' name='attachFileList["+i+"].fileName' value='"+objLi.data("filename")+"'>"
			+  " <input type ='hidden' name='attachFileList["+i+"].fileType' value='"+objLi.data("filetype")+"'>";
	
	});
	
	console.log(strInputHidden);
	formObj.append(strInputHidden);
	
	//위에 form 태그에 이미 있기때문에 생략 가능
	//formObj.attr("method", "post");
	//formObj.attr("action", "${contextPath}/myboard/register";
	
	formObj.submit();
	
});



</script>
		
<%@ include file ="../myinclude/myfooter.jsp" %>

 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value = "${pageContext.request.contextPath} " />

<%@ include file ="../myinclude/myheader.jsp" %>

<style>
.txtBoxCmt, .txtBoxComment {
    overflow: hidden; resize: vertical; min-height: 100px; color: black;
}
</style>


<style> 
 		.bigImageWrapper { 
			 position: absolute; 
			 display: none; 
			 justify-content: center; 
			 align-items: center; 
			 top:0%; 
			 width: 100%; 
			 height: 100%; /* background-color: lightgray; */
			 z-index: 100; 
 	} 
 		.bigImage { 
			 position: relative; 
			 display:flex; 
			 justify-content: center; 
			 align-items: center; 
 } 
 
 .bigImage img { height: 100%; max-width: 100%; width: auto; overflow: hidden } 
</style> 

<style>
        .bigImageWrapper {
            position: absolute;
            display: none;
            justify-content: center;
            align-items: center;
            top:0%;
            width: 100%;
            height: 100%;
            background-color: lightgray; 
            z-index: 100;
        }
        .bigImage {
            position: relative;
            display:flex;
            justify-content: center;
            align-items: center;
        }
        .bigImage img {	height: 100%; max-width: 100%; width: auto; overflow: hidden 	}
    </style>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                	<h3 class="page-header"
                		style="white-space: nowrap;">Board -Detail: <c:out value="${board.bno}"/>번 게시물</h3>
                </div>
            </div>
                    <div class="panel panel-default">
                        <div class="panel-heading"><h4>게시글 상세 - <small>조회수: <c:out value = "${board.bviewsCnt}"/></small></h4></div>
                        <div class="row">
                           <div class="col-md-3" style="white-space: nowrap; height: 45px; padding-top:11px; padding-left:20px">
                             <strong style="font-size:18px;">${board.bwriter}님 작성</strong>
                           </div>
                           <div class="col-md-3" style="white-space: nowrap; height: 45px; padding-top:16px;">
                             <span class="text-primary" style="font-size: smaller; height: 45px; padding-top: 19px;">
                                <span>
                                    <span>등록일:&nbsp;</span>
                                     <!-- <span>"개":&nbsp;</span> -->
                                    <strong><fmt:formatDate    pattern="yyyy-MM-dd HH:mm:ss" 
                                                                 value="${board.bregDate}"/></strong>
                                    <span>&nbsp;&nbsp;</span>
                                </span>
                                <span>조회수:&nbsp;<strong><c:out value="${board.bviewsCnt}"/></strong></span>
                            </span>
                           </div>
                           <div class="col-md-6" style="height: 45px; padding-top:6px;"><%-- vertical-align: middle; --%>
                               <div class="button-group pull-right">
                                <button type="button" id="btnToModify" data-oper="modify" 
                                         class="btn btn-primary"><span>수정</span></button>
                                <button type="button" id="btnToList" data-oper="list"
                                         class="btn btn-info"><span>목록</span></button>
                               </div>
                           </div>
                       </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body form-horizontal">
        
			                <div class="form-group">
	                          <label class="col-sm-2 control-label" style="white-space: nowrap;">글제목</label>
	                          <div class="col-sm-10"> 
	                            <input class="form-control" name="btitle" value='<c:out value="${board.btitle}"/>' 
	                                    readonly="readonly"/>
	
	                          </div>
	                       </div>

	                    	<div class="form-group">
		                        <label class="col-sm-2 control-label" style="white-space: nowrap;">글내용</label>
		                        <%-- <textarea>와 </textarea>는 한 줄에 작성되어야 필요없는 공백이 포함되지 않음 --%>
		                        <div class="col-sm-10">
		                            <textarea class="form-control" rows="3" name="bcontent" style="resize: none;" 
		                                       readonly="readonly"><c:out value="${board.bcontent}"/></textarea>
		                        </div>
	                    	</div>

		                    <div class="form-group">
		                        <label class="col-sm-2 control-label" style="white-space: nowrap;">최종수정일</label>
		                        <div class="col-sm-10"> 
		                            <input class="form-control" name="bmodDate"
		                                    value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bmodDate}"/>'
		                                    readonly="readonly" />
		                        </div>
		                    </div>
         
                        </div> <!-- /.panel-body -->
                   </div><!-- /.panel -->
                
         
    
       <!--   <button type="button" class="btn btn-default" id="BtnMoveModify" data-oper="modify">수정</button>
         <button type="button" class="btn btn-info" id="BtnMoveList" data-oper="list">목록</button>  -->
         		 
         <form id="frmSendValue">
         	<input type='hidden' name='bno' id="bno" value='<c:out value="${board.bno}"/>'>
         	<input type='hidden' name='pageNum' value='${myBoardPgingDTO.pageNum}'>
         	<input type='hidden' name='rowAmountPerPage' value='${myBoardPgingDTO.rowAmountPerPage}'>
         	<input type='hidden' name='scope' value='${myBoardPgingDTO.scope}'>
         	<input type='hidden' name='keyword' value='${myBoardPgingDTO.keyword}'>
      
         </form>		 
         
		<%--  게시물 상세 표시 끝 --%>
		
		
		
		<%--  첨부파일 결과 표시 --%>
		
		      <div class="row">
			    <div class="col-lg-12">
			        <div class="panel panel-default">
			            <div class="panel-heading">첨부파일</div>
			            <div class="panel-body" id="panelFileBody"> <!--id 추가 -->
			                <div class="form-group bigImageWrapper">
			                	<div class ='bigImage'></div>
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
		
		
		<!--  답글 댓글 표시를 위한 기본 코드 -->

		<div class="row">
		    <div class="col-lg-12">
		        <div class="panel panel-default" >
		            <div class="panel-heading">
		                <p style="margin-bottom: 0px; font-size: 16px;">
		                    <strong style="padding-top: 2px;">
		                        <span>댓글&nbsp;<c:out value="${board.breplyCnt}"/>개</span> 
		                        <span>&nbsp;</span>
		                        <button type="button" id="btnChgCmtReg" class="btn btn-w btn-round">댓글 작성</button>
		                        <button type="button" id="btnRegCmt" class="btn btn-success btn-round btn-round" style="display:none">댓글 등록</button>
		                        <button type="button" id="btnCancelRegCmt" class="btn btn-danger btn-round" style="display:none">취소</button>
		                    </strong>
		                </p>
		            </div> <%-- /.panel-heading --%>
		

		
		
		            <div class="panel-body">
		<%-- 댓글 입력창 div 시작 --%>
		                <div class="form-group" style="margin-bottom: 5px;">
		                    <textarea class="form-control input-lg" name="ccontent"
		                               placeholder="insert here"
		                               readonly="readonly"
		                    ></textarea>
		                </div>
		                <hr style="margin-top: 10px; margin-bottom: 10px;">
		<%-- 댓글 입력창 div 끝 --%>
		             
		             
<ul class="chat">
  <%--   <li class="left clearfix commentLi" data-bno="123456"  data-rno="12">
        <div>
            <div>
                <span class="header info-rwriter">
                    <strong class="primary-font">user00</strong>
                    <span>&nbsp;</span>
                    <small class="text-muted">2018-01-01 13:13</small>
                </span>
                <p>앞으로 사용할 댓글 표시 기본 템플릿입니다.</p>
            </div>
            <div class="btnsComment" style="margin-bottom:10px">
                <button type="button" style="display:in-block"
                         class="btn btn-primary btn-xs btnChgReg">답글 작성</button>
                <button type="button" style="display:none" 
                         class="btn btn-warning btn-xs btnRegCmt">답글 등록</button>
                <hr class="txtBoxCmtHr" style="margin-top:10px; margin-bottom:10px">
                <textarea class="form-control txtBoxCmtMod" name="rcontent" style="margin-bottom:10px"
                           placeholder="답글작성을 원하시면,&#10;답글 작성  버튼을 클릭해주세요."
                 ></textarea>
            </div>
        </div>
    </li> --%>
</ul><%-- /.chat --%>
		             
		           
		            </div><%-- /.panel-body --%>
		
		            <div class="panel-footer text-center" id="showCmtPagingNums">
		                <%-- 댓글 목록의 페이징 번호 표시 영역 - JavaScript로 내용이 생성되어 표시됩니다.--%>
		            </div>
		        </div><%-- /.panel --%>
		    </div><%-- .col-lg-12 --%>
		</div><%-- .row : 댓글 화면 표시 끝 --%>
		<%-- 댓글 페이징 데이터 저장 form --%>
		<form id="frmCmtPagingValue">
		    <input type='hidden' name='pageNum' value='' />
		    <input type='hidden' name='rowAmountPerPage' value='' />
		</form>
		         
</div> <!--page-wrapper -->
         	 
         		 
         		 
<script>
var frmSendValue = $("#frmSendValue");
        
// 게시물 수정 페이지로 이동
$("#btnToModify").on("click", function(){
	/* location.href='${contextPath}/myboard/modify?bno=<c:out value="${board.bno}"/>'; */
	 frmSendValue.attr("action", "${contextPath}/myboard/modify");
	 frmSendValue.attr("method", "get");
	 frmSendValue.submit();
});
// 게시물 목록 페이지로 이동
$("#btnToList").on("click", function(){
	 /*  location.href="${contextPath}/myboard/list";  */
	 frmSendValue.find("#bno").remove();
	 frmSendValue.attr("action", "${contextPath}/myboard/list");
	 frmSendValue.attr("method", "get");
	 frmSendValue.submit();
	 
});
        
 
        
var result = '<c:out value = "${result}"/>';

function chechModifyOperation(result) {
     if (result === '' || history.state) {
	     return; 
     } else if(result === 'successModify') {
	     var myMsg = "글이 수정되었습니다.";
     }
 
     alert(myMsg);
     myMsg='';

}
     


 /* 첨부파일 처리 JS  */      
 
 var bnoValue = '<c:out value="${board.bno}"/>';
 
//업로드 결과 표시 함수



function showUploadedFiles(uploadResult) {
	//이미지 표시
	//display 속성의 flex 옵션을 이용하면, 이미지가 웹브라우저의 중앙에 표시됩니다.
	function showImage(calledPathImagefileName){
	    $(".bigImageWrapper").css("display","flex").show();

	    $(".bigImage")
	    /* .html("<img src='${contextPath}/fileDownloadAjax?fileName=" + encodeURI(calledPathImagefileName)+"'>") */
	    .html("<img src='${contextPath}/fileDownloadAjax?fileName=" + calledPathImagefileName +"'>")
	    .animate({width:'100%', height: '100%'}, 1000);
	}


	//원본 이미지 표시 DIV 클릭 이벤트처리: 클릭 시  1초 후에  이미지 사라짐.
	$(".bigImageWrapper").on("click", function(e){
		
	    $(".bigImage").animate({width:'0%', height: '0%'}, 1000);
	    //setTimeout(() => {$(this).hide();}, 1000);
	    setTimeout(function () {
	                   $(".bigImageWrapper").hide();
	               }, 1000);
	});
	
	
  
  $(".fileUploadResult ul").on("click","li", function(e){
	  
	  var objLi = $(this);
	  
	
	  var downloadedPathFileName = encodeURIComponent(objLi.data("repopath") + "/" + objLi.data("uploadPath") + "/" +
	  												  objLi.data("uuid") + "_" + objLi.data("filename"));
	  
	  
	  /* var downloadedPathFileName = objLi.data("repopath") + "/" + objLi.data("uploadPath") + "/" +
								   objLi.data("uuid") + "_" + objLi.data("filename"); */
	  
  		if(objLi.data("filetype") == "I"){
  			
  			showIamge(downloadedPathFileName.replace(new RegExp(/\\/g), "/"));
  			
  		} else {
  			
  			self.location = "${contextPath}/fileDownloadAjax?fileName=" + downloadedPathFileName
  		}
	  
  });
	  
 

  //서버로 부터 전달된 파일 업로드 결과내용이 없으면, 함수 종료
  if(!uploadResult || uploadResult.length == 0) {
  	return;
  	
  } 
  
  
  var fileUploadResult = $(".fileUploadResult ul");
  var str = "";
  //전달받은 배열형식 데이터 각각에 대하여
  $(uploadResult).each(function(i, obj) {
      if (obj.fileType == "F") {  //이미지가 아닌 경우, 아이콘 이미지 및 원본 파일이름 표시
          var calledPathFileName =  encodeURIComponent( obj.repoPath + "/" + obj.uploadPath + "/" +
                                                        obj.uuid + "_" + obj.fileName ); //추가
          console.log("호출된 파일이름: " + calledPathFileName); //추가

 	// data 다음의 이름은 전부 소문자로 줘야함
 	//아래의 li 링크에 data-repopath 추가
    str   += "<li data-repopath='" + obj.repoPath + "'" 
    	  +  "    data-uploadpath='" + obj.uploadPath + "'" 
   		  +  "    data-uuid='" + obj.uuid + "'" 
   		  +  "    data-filename='" + obj.fileName + "'" 
    	  +  "    data-filetype='F' style='height:25px'>" 
          +  "    <img src='${contextPath}/resources/img/icon-attach.png' alt='No Icon' "
          +  "          style='height: 18px; width: 18px;'>&nbsp;&nbsp;"
          +       obj.fileName
 //         +  "    <span data-filename='" + calledPathFileName + "' data-filetype='F'>[삭제]</span>"
 		  +  "    &nbsp;<button type='button' class='btn btn-danger btn-xs' "
 		  +  "                  data-filename='" + calledPathFileName + "' data-filetype= 'F'>X</button>"
          +  "</li>";
              
      } else if (obj.fileType=="I") {//이미지파일인 경우 썸네일 및 원본 파일이름 표시
          //전체 경로명이 포함된 썸네일 파일이름을 encodeURIComponent로 처리
          var thumbnailFilePath = 
                  encodeURIComponent(obj.repoPath + "/" + obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
          console.log("encodeURIComponent 처리 파일이름: " + thumbnailFilePath);

          //원본이미지 파일이름(경로포함)
          //var originPathImageFileName = obj.repoPath + "/" + obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName; //추가
          //originPathImageFileName = originPathImageFileName.replace(new RegExp(/\\/g),"/"); //추가

      str += "<li data-repopath='" + obj.repoPath + "'" 
	  	  +  "    data-uploadpath='" + obj.uploadPath + "'" 
		  +  "    data-uuid='" + obj.uuid + "'" 
		  +  "    data-filename='" + obj.fileName + "'" 
	      +  "    data-filetype='I' style='height:25px;'>" 
      	  +  "    <img src='${contextPath}/displayThumbnailFile?fileName=" + thumbnailFilePath + "'"
      	  +  "          alt='No Icon' style='height: 18px; width: 18px;'>&nbsp;&nbsp;"
      	  +       obj.fileName
      	  +  "    &nbsp;<button type='button' class='btn btn-danger btn-xs'"
      	 /*  +  "    <span data-filename='" + thumbnailFilePath + "' data-filetype='I'>[삭제]</span>" */
      	  +  "                   data-filename='" + thumbnailFilePath + "' data-filetype='I'>X</button>"
      	  +  "</li>";
      }
  });
  //기존 페이지에 결과를 HTML로 추가
  fileUploadResult.append(str);
}

 
$(document).ready(function(){//페이지 로딩 시 함수 실행  전체 JavaScript 내용 중 제일 마지막에 위치해야 함
	
	$.ajax({
		    url: '${contextPath}/myboard/getFiles',
		    data: {bno: bnoValue},
		    type: 'get',
		    dataType: 'json',
		    success: function(fileList) {
		    	showUploadedFiles(fileList);
		    }

		}) 
	
    showCmtList(1);
   
}); 
 


// chechModifyOperation(result);


/*         	 window.addEventListener('popstate', function(event) {
            	 history.pushState(null, null, location.href);
             })  
            	 
            history.pushState(null, null, location.href); */

 
</script>
<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js"></script>
<script>

var commentUL = $(".chat");
var frmCmtPagingValue = $("#frmCmtPagingValue");


//댓글 목록표시 함수 선언: ajax 클로저 모듈 함수를 호출함
function showCmtList(page){
      //댓글 목록 데이터를 요청하는 클로저 모듈 함수 호출
    myCommentClsr.getCmtList(
        {bno: bnoValue, page: page || 1 },
        function(replyPagingCreator) { //ajax에서 실행할 callback 함수
            console.log("서버로부터 전달된 pageNum(replyPagingCreator.myRelyPaging.pageNum): "
                        + replyPagingCreator.myReplyPaging.pageNum);
        
        	/*  $("#replyTotal").html("댓글&nbsp;" + replyPagingCtreator.replyTotalByBno+"개");  */

            frmCmtPagingValue.find("input[name='pageNum']")
                             .val(replyPagingCreator.myReplyPaging.pageNum);
            
            console.log("폼에 저장된 페이징번호 pageNum(): "
                        + frmCmtPagingValue.find("input[name='pageNum']").val());
            var str="";
       

            //댓글이 없으면(replyList가 null), if 문의 블록이 실행되고, 함수 실행이 중지됨(return), 따라서, for문 실행 않됨
            if(	(! replyPagingCreator.replyList) ||
            	(replyPagingCreator.replyList.length == 0) ) {
                str += '<li class="left clearfix commentLi" '
                    +  '    style="text-align: center; background-color: lightCyan;'
                    +  '           height: 35px;margin-bottom: 0px;padding-bottom:0px;'
                    +  '           padding-top:6px;border: 1px dotted;">'
                    +  '    <strong>등록된 댓글이 없습니다.</strong></li>';
                commentUL.html(str);
                return;
            }
            
//답글 표시 for문(<ul></ul>내에 아래의 li 요소들이 for문에 의해서 생성되어 표시됨)
for (var i = 0, len = replyPagingCreator.replyList.length; i < len; i++) {
        str   +='<li class="left clearfix commentLi" data-bno="' + 1
              + '"   data-rno="'+replyPagingCreator.replyList[i].cno+'">'
              + '    <div>';
//댓글에 대한 답글 들여쓰기
    if(replyPagingCreator.replyList[i].lvl == 1){//댓글 들여쓰기 안함
        str   +='        <div>';
    } else if (replyPagingCreator.replyList[i].lvl == 2){//답글 들여쓰기
        str   +='        <div style="padding-left:25px">';
    } else if (replyPagingCreator.replyList[i].lvl == 3){//답글의 답글 들여쓰기
        str   +='        <div style="padding-left:50px">';
    } else if (replyPagingCreator.replyList[i].lvl == 4){//답글의 답글 들여쓰기
        str   +='        <div style="padding-left:75px">';
    } else {//답글의 레벨이 5이상이면 동일한 들여쓰기
        str   +='        <div style="padding-left:100px">';
    } 
        str   +='            <span class="header info-rwriter">'
            + '                <strong class="primary-font">';
    if(replyPagingCreator.replyList[i].lvl > 1){//답글인 경우, 앞에 아이콘 표시
        str   +='                    <i class="fa fa-reply fa-fw"></i>&nbsp;';   
    }
        str   +=                     replyPagingCreator.replyList[i].rwriter 
            + '                </strong>'
            + '                <span>&nbsp;</span>'
            + '                <small class="text-muted">수정일: ' 
            +                     myCommentClsr.showDatetime(replyPagingCreator.replyList[i].rmodDate)   //수정날짜가 정수값으로 표시됨
            + '                </small>';
    if(replyPagingCreator.replyList[i].lvl > 1){ //답글인 경우, 답글을 표시
        str   +='                <small>&nbsp; 답글</small>';
    }
        str   +='            </span>'
            + '            <p data-bno=' + replyPagingCreator.replyList[i].bno
            + '               data-rno=' + replyPagingCreator.replyList[i].rno
            + '               data-rwriter=' + replyPagingCreator.replyList[i].rwriter
            + '             >' + replyPagingCreator.replyList[i].rcontent + '</p>'
            + '        </div>';
        str   +='        <div class="btnsReply" style="margin-bottom:10px">'
            + '            <button type="button" style="display:in-block" '
            + '                     class="btn btn-primary btn-xs btnChgReplyReg">'
            + '                <span>답글 작성</span></button>'
            + '        </div>';
        str   +='    </div>'
            + '</li>';
}//for-End





            //UL 태그 내에 HTML 내용 표시
            commentUL.html(str); //html() 사용 시, 새로운 내용으로 교체.
            //commentUL.append(str); //append 사용 시, 기존 내용 밑에 새로운 내용 추가 (페이징 대신 사용).

            // 페이징번호 표시 함수 호출
            showCmtPagingNums(replyPagingCreator.myReplyPaging.pageNum,
        					  replyPagingCreator.startPagingNum,
        					  replyPagingCreator.endPagingNum,
        					  replyPagingCreator.prev,
        					  replyPagingCreator.next,
        					  replyPagingCreator.lastPageNum); 
            
            
            
            
        }//.end callback 매개변수의 익명 함수
    );//.end myCommentClsr.getCmtList
}//.end showCmtList


//댓글 목록에 표시할 페이징 번호 생성 함수: replyPagingCreator로 부터 받아온 값들을 이용
 
  function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum) {

	 if(endPagingNum >= lastPageNum) {
		endPagingNum = lastPageNum;
	}
	 
	var str  = 
				" 	<ul class='pagination pagination-sm'>";
	
			 
	// 맨 앞으로
	if(prev) {
		str  +=" 	<li class='page-item'>"
			 + " 		<a class='page-link' href='"+1+"'>"
			 + " 	  		<span aria-hidden='true'>&laquo;</span>"
	 		 + " 		</a>"
	 		 + " 	</li>";
	}
	
	// 이전 페이지
	if(prev) {
		str  +=" 	<li class='page-item'>"
			 + " 		<a class='page-link' href='"+(startPagingNum -1)+"'>이전</a>"
			 + " 	</li>";
	}
	
	
	//선택된 페이지 번호 Bootstrap의 색상 표시
	for(var i =startPagingNum ; i <= endPagingNum; i++) {
		//active는 Bootstrap 클래스 이름
		var active = ( ( pageNum == i ) ? "active" : "" );
		
		str +="	 	<li class='page-item  "+active+"'>"
		    + "			<a class='page-link' href='"+i+"'>"+i+"</a>"
		    + "		</li>";
	} 
	
	if(next) {
		str +="		<li class='page-item'>"
			+ "			<a class='page-link' href='"+(endPagingNum + 1)+"'>다음</a>"
			+ " 	</li>";
	 
 	} 	 
	
	// 맨 마지막으로
	if(next) {
		str +="		<li class='page-item'>"
			+ "			<a class='page-link' href='"+(lastPageNum)+"'>&raquo;</a>"
			+ " 	</li>";
	}
	
		
		str +=" 	<ul>";
			
		
	 $("#showCmtPagingNums").html(str);

	}
    
    
//선택된 페이징 번호의 게시물 목록 가져오는 함수 : 이벤트 전파 이용   //("click", "ul li a", <----- ul li a 소스 코드에 없는 거라 이렇게 써준거임!!!
  $("#showCmtPagingNums").on("click", "ul li a", function(e){
 	 e.preventDefault();
 	 
 	 var targetPageNum = $(this).attr("href");
 	 console.log("targetPageNum: " + targetPageNum);
 	 
 	 showCmtList(targetPageNum);

  });
    
    
<%-- 댓글 추가 요소 초기화 함수 --%>
function chgBeforeCmtBtn() {
	$("#btnChgCmtReg").attr("style", "display:in-block");
	$("#btnRegCmt").attr("style", "display:none");
	$("#btnCancelRegCmt").attr("style", "display:none");
	$("txtboxCmt").val("");
	$("txtboxCmt").attr("readonly", true);

} 

<%-- 댓글 작성 버튼 클릭 -  댓글 등록 버튼으로 변경, 댓글 입력창 활성화 --%>
	$("#btnChgCmtReg").on("click", function(){
		
		//$("p").attr("style", "display: in-block;");
		
		chgBeforeCmtBtn();
	    chgBeforeReplyBtn();
	    chgBeforeCmtRepBtns();
		
		$(this).attr("style", "display:none");
		$("#btnRegCmt").attr("style", "display:in-block;margin-right:2px");
		$("#btnCancelRegCmt").attr("style", "display:in-block");
		$(".txtBoxCmt").attr("readonly", false);
		
		
	});
	
<%--댓글 등록 취소 클릭--%>
$("#btnCancelRegCmt").on("click", function(){
	if(!confirm("댓글 입력을 취소하겠습니까?")){
		
		return;
	}
	
	chgBeforeCmtBtn();
	
}); 

 
//댓글 등록 버튼 클릭 이벤트 처리
$("#btnRegCmt").on("click", function(){
	
	var loginUser = "user9";
	var txtBoxCmt = $(".txtBoxCmt").val();
	var comment = { bno: bnoValue,
					rcontent: txtBoxCmt,
					rwriter: loginUser};
	
	console.log("댓글 등록: 서버전송 객체 내용: " + comment);
	myCommentClsr.registerCmt(
		comment,
		function(serverResult){
			$(".txtBoxCmt").val("");
			chgBeforeCmtBtn();
			
			/* $("#btnChgCmtReg").attr("style", "display:in-block");
			$("#btnRegCmt").attr("style", "display:none");
			$("#btnCancelRegCmt").attr("style", "display:none");
			$("txtboxCmt").val("");
			$("txtboxCmt").attr("readonly", true);
			 */
			
			alert("댓글이 등록되었습니다.");
			
			showCmtList(-1);
			
		}
	
	);
	
}); 
		
	
///답글 관련 화면 상태 초기화
function chgBeforeReplyBtn() {
	$(".btnRegReply").remove();
	$(".btnCancelRegReply").remove();
	$(".txtBoxReply").remove();
	$(".btnChgReplyReg").attr("style", "display: in-block");

	
}

//답글 작성 버튼 클릭 이벤트
//JSP 코드에 없는 생성된 요소, 이벤트 전파 사용
$(".chat").on("click", ".commentLi .btnChgReplyReg" ,function(){
	
	
	$("p").attr("style", "display:in-block;");
	
	chgBeforeCmtRepBtns();
	chgBeforeCmtBtn();
	chgBeforeReplyBtn();
	
	 var strTxtBoxReply = 
          "<textarea class='form-control txtBoxReply' name='rcontent' style='margin-bottom:10px;'"
        + "           placeholder='답글작성을 원하시면, &#10;답글 작성  버튼을 클릭해주세요.'"
        + "></textarea>"
        + "<button type='button' class='btn btn-warning btn-xs btnRegReply'>답글 등록</button>"
        + "<button type='button' class='btn btn-danger btn-xs btnCancelRegReply'"
        + "         style='margin-left:4px;'>취소</button>";
				
		$(this).after(strTxtBoxReply);
		$(this).attr("style", "display:none");

})




<%-- 답글 등록 취소 클릭 --%>                                        // 버튼이 한개 밖에 없기 때문에 div div가 생략 가능한 것임
$(".chat").on("click", ".commentLi div div .btnCancelRegReply" ,function(){
	if(!confirm("답글 입력을 취소하시겠습니까?")) {
		return;
	}
		chgBeforeReplyBtn();

});
                                  

<%-- 답글 등록 버튼 클릭 이벤트 처리: 답글이 달린 댓글이 있는 페이지 표시 --%>	
$(".chat").on("click", ".commentLi .btnRegReply" ,function(){
	var loginUser = "test8";
	var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
	console.log("답글 추가가 발생된 댓글 페이지 번호: " + pageNum);
	
	var txtBoxReply = $(this).prev().val();
	
	console.log("txtBoxReply: " + txtBoxReply);
	                                         //부모
	var prnoVal = $(this).closest("li").data("rno");
	console.log("prnoVal: " + prnoVal);
	
	var reply = { bno: bnoValue,
				  rcontent: txtBoxReply,
				  rwriter: loginUser,
				  prno: prnoVal }; // 부모키로 쓰임
	
	
	console.log("답글 등록 : 서버전송 객체 내용 : " + reply);
				  
	myCommentClsr.registerReply(
			reply,
			function(serverResult){
				alert("답글이 등록되었습니다.");

				showCmtList(pageNum);
				
				}
				
		);
})  

 function chgBeforeCmtRepBtns() {
	
	$("p").attr("style", "display:in-block;");
	
	//답글 처리 관련 버튼
	$(".btnModCmt").remove();
	$(".btnDelCmt").remove();
	$(".btnCancelCmt").remove();
	$(".txtBoxMod").remove();
	
} 



<%-- 댓글- 답글 수정/삭제 화면 요소 표시: p태그 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi div div p", function(){
	
	chgBeforeCmtBtn();
	chgBeforeReplyBtn();
	chgBeforeCmtRepBtns();
	
	 $(this).parents("li").find(".btnChgReplyReg").attr("style", "display:none");
	
	var rcontent = $(this).text();
	console.log("선택된 댓글 내용: " + rcontent);
	
	var strTxtBoxReply =
        "<textarea class='form-control txtBoxMod' name='rcontent' style='margin-bottom:10px;'"
      + "          placeholder='답글작성을 원하시면,&#10;답글 작성 버튼을 클릭해주세요.'"
      + "></textarea>"
      + "<button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button> "
      + "<button type='button' class='btn btn-danger btn-sm btnDelCmt'>삭제</button>"
      + "<button type='button' class='btn btn-info btn-sm btnCancelCmt' style='margin-left: 4px;'>취소</button>";
  
	
	$(this).after(strTxtBoxReply);
	$(".txtBoxMod").val(rcontent);
	$(this).attr("style", "display:none"); 
	
});



<%-- 댓글- 답글 수정/삭제의 취소 버튼 클릭 이벤트 --%>
$(".chat").on("click", ".commentLi .btnCancelCmt", function(){
	
	chgBeforeCmtBtn()
	chgBeforeReplyBtn()
	
	// 답글 처리 관련 버튼
	//$(".btnModCmt").remove();
	//$(".btnDelCmt").remove();
	
	/* var rcontent = $(".txtBoxMod").val();
	console.log("rcontent: " + rcontent);
	$(this).before("<p>"+ rcontent +"</p>" + 
				   "<div class='btnsReply' style='margin-bottom:10px'>" +
			  	   "<button type='button' style='display:in-block ' class='btn btn-primary btn-xs btnChgReplyReg'>" +
				   "<span>답글 작성</span></button></div>");
	 */
	//$(".txtBoxMod").remove();
	//$(".btnCancelCmt").remove();
	chgBeforeCmtRepBtns();
});
		
		
<%-- 댓글-답글 수정 처리 : 수정 버튼 클릭 이벤트 --%>		
$(".chat").on("click", ".commentLi div div .btnModCmt", function(){
	
	<%--작성자 변수에 저장--%>	
	
	var rwriterVal = $(this).siblings("p").data("rwriter");
	var pageNum = frmCmtPagingValue.find("input[name ='pageNum']").val();
	console.log("댓글/답글 수정이 페이지 번호: " + pageNum);
	
	var txtBoxComment = $(this).prev().val(); 
	console.log("txtBoxComment: " + txtBoxComment);
	
	var rnoVal = $(this).closest("li").data("rno"); 
	console.log("rnoVal: " + rnoVal);
	
	var comment = { bno: bnoValue,
					rno: rnoVal,
					rcontent: txtBoxComment,
					rwriter: rwriterVal };
	
	
	console.log("답글 등록: 서버 전송 객체 내용: " + comment);
	
	myCommentClsr.modifyCmtReply(
			comment,
			function(serverResult) {
				alert("수정되었습니다."+ serverResult);

				showCmtList(pageNum);
			}
	);
	
});
	


<%-- 댓글-답글 삭제 처리 : 삭제 버튼 클릭 이벤트--%>
$(".chat").on("click", ".commentLi .btnDelCmt", function(){
	
	
	<%--작성자 변수에 저장 --%>
	var rwriterVal = $(this).siblings("p").data("rwriter");
	var delConfirm = confirm('삭제하시겠습니까?');
	
	if(!delConfirm){
		alert('삭제가 취소되었습니다.');
		return;
	}
	
	var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
	
	console.log("답글 삭제가 발생된 댓글 페이지 번호: " + pageNum);
	
	var rnoVal = $(this).closest("li").data("rno");
	console.log("rnoVal: " + rnoVal);
	
	var myComment = {  bno: bnoValue,
					   rno: rnoVal,
					   rwriter: rwriterVal };
	
	console.log("답글 삭제: 서버 전송 객체 내용: " + myComment);
	
	myCommentClsr.removeCmtReply(
		myComment,
		function(serverResult){
			alert("삭제되었습니다.");
			
		showCmtList(pageNum);
		
		}
	);
});

		
$(document).ready(function(){//페이지 로딩 시 함수 실행  전체 JavaScript 내용 중 제일 마지막에 위치해야 함
		
	$.ajax({
		    url: '${contextPath}/myboard/getFiles',
		    data: {bno: bnoValue},
		    type: 'get',
		    dataType: 'json',
		    success: function(fileList) {
		    	showUploadedFiles(fileList);
		    }

		}) 
	
    showCmtList(1);
   
}); 
 
 
 <%-- // 댓글 목록에 표시할 페이징 번호 생성 함수: 
 function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, lastPageNum) {
	 
	 if(endPagingNum >= lastPageNum) {
		endPagingNum = lastPageNum;		 
	 } 
	 
	 var str = "<div class='text-center'>"
	 		 + " 	<ul class='pagination pagination-sm'>";
	 		
 	 }
	 		 
	// 맨 앞으로
	if(prev) {
		str  +=" <li class='page-item'>"
			 + " 		<a class='page-link' href='"+1+"'>"
			 + " 	  		<span aria-hidden='true'>&laquo;</span>"
	 		 + " 		</a>"
	 		 + " 	</li>";
	}
	//이전 페이지
		if(prev) {
		str  +=" <li class='page-item'>"
			 + " 		<a class='page-link' href='"+(startPagingNum -1)+"'>이전</a>"
			 + " </li>";
	}
	
	
	//선택된 페이지 번호 색상 표시
	for(var i =startPagingNum ; i <= endPagingNum; i++) {
		
		var active = ( ( pageNum == i ) ? "active" : "" );
		
		str +="	 	<li class='page-item  "+active+"'>"
		    + "			<a class='page-link' href='"+i+"'>"+i+"</a>"
		    + "		</li>";
	}
	
	
	if(next) {
		str +="		<li class='page-item'>"
			+ "			<a class='page-link' href='"+(endPagingNum + 1)+"'>다음</a>"
			+ " 	</li>";
	 
 } 	 
	
	if(next) {
		str +="		<li class='page-item'>"
			+ "			<a class='page-link' href='"+(lastPageNum)+"'>&raquo;</a>"
			+ " 	</li>";
	}
	
	str +=" 	<ul>"
		+	"</div>";
		
	 $("showCmtPagingNums").html(str);

}
commentUL.html(str);

	showCmtPagingNums(replyPagingCreator.myReplyPaging.pageNum,
					  replyPagingCreator.startPagingNum,
					  replyPagingCreator.endPagingNum,
					  replyPagingCreator.prev,
					  replyPagingCreator.next,
					  replyPagingCreator.lastPageNum); --%>
</script>

<%-- <script>
//게시물 번호 저장
// var bnoValue = '<c:out value="${board.bno}"/>';

/*  //댓글 목록 데이터 요청/받기 Ajax 테스트   
 myCommentClsr.getCmtList(
     {bno:bnoValue, page:1},   //1번째 bnoAndPage의 인자값(JS객체)
     function(replyPagingCreator){  //2번째 callback 인자값: 성공 시 실행되는 함수(익명블록)
         for (var i = 0, len = replyPagingCreator.replyList.length || 0 ; i < len; i++){
             console.log(replyPagingCreator.replyList[i]);
         }
     }
);  */
 
 //댓글등록  테스트
/* myCommentClsr.registerCmt(
    {bno:bnoValue, rcontent:"JS-클로저-댓글입력테스트입니다.", rwriter: "user7"} , //1번째: comment인자값 
    function(result){    //2번째: callback 인자값: 성공 시 실행되는 함수
        alert("myReplyClsr.registerCmt()처리결과 " + result);
    }
); */ 

//답글등록 테스트
//myCommentClsr.registerReply(
//    {bno: bnoValue, prno: 1, rcontent: "JS-클로저-댓글의 답글입력테스트입니다.", rwriter: "user10"}, 
//    function(result){ //2번째 callback 인자값: 성공 시 실행되는 익명블록 형태의 콜백함수
//        alert("myReplyClsr.registerReply()처리결과 " + result); 
//    }
//);

//댓글-답글 조회 테스트
//myCommentClsr.getCmtReply(
//    {bno: bnoValue, rno: 1 },
//    function(data){
//        console.log(data);
//    }
//);

//댓글-답글 수정 테스트 
//myCommentClsr.modifyCmtReply(
//    {bno : bnoValue, rno : 1, rcontent: "JS클로저에 의한 댓글 수정======="}   ,
//    function(modifyResult) {
//        alert(modifyResult + "- ajax 처리 완료");
//    }
//); 


/* //댓글-답글 삭제 테스트(실제 삭제 발생)
myCommentClsr.removeCmtReply(
    {bno : bnoValue, rno : 22, rwriter: "user10"}, //댓글-답글 입력 테스트 시, SQL*Developer 에서 확인한 rno를 사용
    function(deleteResult) {
        console.log(deleteResult);
        if (deleteResult === "댓글 삭제 성공") {
            alert(deleteResult + ": 댓글/답글이 삭제되었습니다(ByRemoveCmtReply).");
            }
    },
    function(err) {
        alert("오류로 인한 댓글/답글 삭제 작업 취소...");
      }
); 
 */
</script> --%>
 
 
 
 
 
 
 
<%@ include file ="../myinclude/myfooter.jsp" %>

 
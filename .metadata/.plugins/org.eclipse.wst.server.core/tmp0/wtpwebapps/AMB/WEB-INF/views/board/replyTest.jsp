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



<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			    <p style="margin-bottom: 0px; font-size: 16px;">
	                    <strong style="padding-top: 2px;">
	                        <button type="button"  class="btn btn-border-d btn-round" id="btnRegCmtButton">댓글 작성</button>
	                        <button type="button"  class="btn btn-w btn-round" style="display:none" id="btnActRegCmt">댓글 등록</button>
	                        <button type="button"  class="btn btn-danger btn-round" style="display:none" id="btnCancelRegCmt">취소</button>
	                    </strong>
	            </p>
				</div>
				<div class="panel-body">

		                <div class="form-group" style="margin-bottom: 5px;">
		                    <textarea class="form-control input-lg" name="ccontent"
		                               placeholder="댓글작성을 원하시면,&#10;댓글 작성 버튼을 클릭해주세요."
		                               readonly="readonly"
		                    ></textarea>
		                </div>
		                <hr style="margin-top: 10px; margin-bottom: 10px;">
		                
		            <ul class="chat"> 
		                <li class="left clearfix commentLi" data-bno="123456" data-cno="12">
		                	<div>
		                		<div>
		                			<span class="header info-rwriter">
		                				<strong class="primary-font">user00</strong>
		                				<span>&nbsp;</span>
		                			</span>
		                			<p>1111</p>
		                		</div>
		                		<div class="btnsComment" style="margin-bottom:10px">
		                			<button type="button" style="display:in-block"
		                					class="btn btn-g btn-round btn-sm" type="button">답글 작성</button>
		                			<button type="button" style="display:none"
		                					class="btn btn-danger btn-round" type="button">답글 등록</button>
		                			<hr class="txtBoxCmtHr" style="margin-top:10px; margin-bottom:10px">
		                			<textarea class="form-control txtBoxCmtMod" name="ccontent" style="margin-bottom:10px"
		                					placeholder="please insert here">
		                			</textarea>
		                		</div>
		                	</div>
		                </li>
		           </ul>
					</div>
				</div>
			</div>
		</div>
		<form id="frmCmtPagingValue">
			<input type='hidden' name='pageNum' value=''/>
			<input type='hidden' name='rowAmountPerPage' value=''/>
			
			</form>
<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js"></script>
<script>
	var commentUL = $(".chat");
	var frmCmtPagingValue = $("#frmCmtPagingValue");
	//댓글 목록 표시 함수
	function showCmtList(page){
		myCommentClsr.getCmtList(
				{bno: 1, page: page || 1},
				function(bCommentPagingCreator){
		/* 			
					frmCmtPagingValue.find("input[name='pageNum']")
									.val(bCommentPagingCreator.bCommentPaging.pageNum);
					
					console.log("폼에 저장된 페이징 번호 pageNum:"
							+ frmCmtPagingValue.find("input[name='pageNum']").val());
					*/
					var str="";
				  
				//댓글이 없으면 if문안의 블록이 실행됨 or 중지됨
	 	if( (! bCommentPagingCreator.cmtList) || (bCommentPagingCreator.length == 0) ){
			str += '<li class="left clearfix commentLi" '
			+	'	style="text-align: center; background-color: lightCyan;'
			+	'   		height: 35px;margin-bottom: 0px;padding-bottom:0px;'
			+   '           padding-top:6px;border: 1px dotted;">'
			+   '       <strong>등록된 댓글이 없습니다.</strong></li>';
			commentUL.html(str);
			
			return;
		}  
		//답글표시 for문
		for (var i = 0, len = bCommentPagingCreator.cmtList.length; i < len; i++){
			str +='<li class="left clearfix commentLi data-bno="' + 1
			+'"	data-cno"'+bCommentPagingCreator.cmtList[i].cno+'">'
			+'        <div>';
	//댓글에 대한 답글 들여쓰기
		if(bCommentPagingCreator.cmtList[i].lvl ==1){
			str+='		<div>';
		}else if (bCommentPagingCreator.cmtList[i].lvl == 2){
			str+='        <div style="padding-left:25px">';
		}else if (bCommentPagingCreator.cmtList[i].lvl == 3){
			str+='		  <div style="padding-left:50px">';
		}else if (bCommentPagingCreator.cmtList[i].lvl == 4){
			str+='		  <div style="padding-left:75px">';
		}else{
			str +='       <div style="padding-left:100px">';
		}
			str +='          <span class="header info-mid">'
				+ '              <strong class="primary-font">';
		if(bCommentPagingCreator.cmtList[i].lvl > 1){
			str+='                  <i class="fa fa-reply fa-fw"></i>&nbsp;';
		}
			str+=					bCommentPagingCreator.cmtList[i].mid
			   + '              </strong>'
			   + '              <span>&nbsp;</span>'
		if(bCommentPagingCreator.cmtList[i].lvl > 1){
			str +='             <small>&nbsp; 답글</small>'
		}
			str +='         <span>'
				+ '         <p data bno=' + bCommentPagingCreator.cmtList[i].bno
				+ '            data-cno=' + bCommentPagingCreator.cmtList[i].cno
				+ '            data-mid=' + bCommentPagingCreator.cmtList[i].mid
				+ '         >' + bCommentPagingCreator.cmtList[i].ccontent + '</p>'
				+ '     </div>';
				+ '    </div>'
				+ '</li>';
		}//for-end
				commentUL.html(str);
		
				showCmtPagingNums(bCommentPagingCreator.pageNum,
									bCommentPagingCreator.startPagingNum,
									bCommentPagingCreator.endPagingNum,
									bCommentPagingCreator.prev,
									bCommentPagingCreator.next,
									bCommentPagingCreator.lastPageNum)
				}
		)
	}
	
	function showCmtPagingNums(pageNum, startPagingNum, endPagingNum, prev, next, lastPageNum ){
		
		if(endPagingNum >= lastPageNum){
			endPagingNum = lastPageNum;
		}
		
		var str = "<ul class='pagination pagination-sm'>";
		
		if(prev){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+1+"'>"
				+ "            <span aria-hidden='true'>&laquo;</span>"
				+ "    	   </a>"
				+ "    </li>";
		}
		if(prev){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+(startPagingNum -1)+"'>이전</a>"
				+ "            <span aria-hidden='true'>&laquo;</span>"
				+ "    </li>";
		}
		for(var i = startPagingNum ; i <= endPagingNum; i++){
			
			var active = ( ( pageNum == i) ? "active" : "");
			
			str +="    <li class='page-item"+ active +"'>"
				+ "        <a class='page-link' href'"+i+"'>"+i+"</a>"
				+ "    </li>";
		}
		if(next){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+(endPagingNum -1)+"'>다음</a>"
				+ "    </li>";
		}
		if(next){
			str +="    <li class='page-item'>"
				+ "        <a class='page-link' href='"+(lastPagingNum)+"'>&raquo;</a>"
				+ "    </li>";
		}
		
			str +="</ul>";
		$("#showCmtPagingNums").html(str);
	}
	function chgBeforeCmtBtn(){
		$("#btnRegCmtButton").attr("style", "display:in-block");
		$("#btnActRegCmt").attr("style", "display:none");
		$("#btnCancelRegCmt").attr("style", "display:none");
		$(".txtBoxCmt").val("");
		$(".txtBoxCmt").attr("readonly", true);
	}
	<%-- 댓글작성버튼 클릭--%>
$("btnRegCmtButton").on("click", function(){
	chgBeforeCmtRepBtns();
	chgBeforeCmtBtn();
	chgBeforeReplyBtn();
	
	$(this).attr("style", "display:none");
	$("#btnActRegCmt").attr("style", "display:in-block");
	$("#btnCancelRegCmt").attr("style", "display:in-block");
	$(".txtBoxCmt").attr("readonly", false);
});
	
	
	<%--댓글등록 취소버튼 클릭--%>
	$("#btnCancelRegCmt").on("click", function(){
		if(!confirm("댓글 입력을 취소하시겠습니까?")){
			return ;
		}
		chgBeforeCmtBtn();
	});
	$("#btnActRegCmt").on("click", function(){
		var loginuser = "user00";
		var txtBoxCmt = $(".txtBoxCmt").val();
		var comment = { bno: 1,
						rcontent: txtBoxCmt,
						rwriter: loginUser};
		
		console.log("댓글등록: 서버전송 객체내용: " + comment);
		
		myCommentClsr.registerCmt(
				comment,
				function(serverResult){
					$(".txtBoxCmt").val("");
					chgBeforeCmtBtn();
					
					alert("댓글이 등록되었습니다");
					
					showCmtList(-1);
				}
			);
	});
	
	function chgBeforeReplyBtn(){
		$(".btnRegReply").remobe();
		$(".btncancelRegReply").remove();
		$(".txtBoxReply").remove();
		$(".btnChgReplyReg").attr("style", "display:in-block");
	}
	
	$(".chat").on("click", ".commentLi div div .btnChgReplyReg", function(){
		
		$("p").attr("style", "display:in-block");
		
		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
		
		var strTxtBoxReply =
			"<textarea class='form-control txtBoxReply' name='ccontent' style='margin-bottom:10px;'"
		+	"		placeholder='답글 작성을 원하시면, &#10;답글 작성 버튼을 클릭해주세요.'"
		+   "></textarea>"
		+	"<button type='button' class='btn btn-warning btn-xs btnRegReply'>답글등록</button>"
		+   "<button type='button' class='btn btn-danger btn-xs btnCancelRegReply'"
		+   "       style='margin-left:4px;'>취소</button>";
		
		$(this).after(strTxtBoxReply);
		$(this).attr("style", "display:none");
	});
	
	$(".chat").on("click", ".commentLi div div .btnCancelRegReply" ,function(){
	if(!confirm("답글 입력을 취소하시겠습니까?")) {
		return;
	}
		chgBeforeReplyBtn();

	});
	
	$(".chat").on("click", ".commentLi .btnRegReply" ,function(){
		var loginuser ="test00";
		var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
		console.log("답글 추가가 발생된 댓글 페이지 번호: "+ pageNum);
		
		var txtBoxReply = $(this).prev().val();
		console.log("txtBoxReply: " + txtBoxReply);
		
		var creplyVal = $(this).closest("li").data("cno");
		console.log(("creplyVal") + creplyVal);
	
		var reply = { bno: 1,
					  ccontent : txtBoxReply,
					  cwriter : loginuser,
					  creply : creplyVal };
		
		console.log ("답글 등록: 서버 전송 객체 내용 : "+ reply);
	
		myCommentClsr.registerCmt(
				reply,
				function(serverResult){
					alert("답글이 등록되었습니다");
					
					
				}
			);
	});
	
	function chgBeforeCmtRepBtns(){
		
		$("p").attr("style", "display:in-block;");
		
		$(".btnModCmt").remove();
		$(".btnModCmt").remove();
		$(".btnCancelCmt").remove();
		$(".txtBoxMod").remove();
		
	}
	$(".chat").on("click", ".commentLi p", function(){
		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
		chgBeforeCmtRepBtns();
		
		var ccontent = $(this).text();
		console.log("선택된 댓글:" +ccontent);
		
		var strTxtBoxReply =
			"<textarea class='form-control txtBoxReply' name='ccontent' style='margin-bottom:10px;'"
			+	"		placeholder='답글 작성을 원하시면, &#10;답글 작성 버튼을 클릭해주세요.'"
			+   "></textarea>"
			+	"<button type='button' class='btn btn-warning btn-sm btnModCmt'>수정</button>"
			+   "<button type='button' class='btn btn danger btn-sm  btnDelCmt'>삭제</button>"
			+   "<button type='button' class='btn btn-danger btn-sm  btnCancelCmt' style='margin-left: 4px;'>취소</button>";
		
		$(this).after(strTxtBoxReply);
		$(".txtBoxMod").val(ccontent);
		$(this).attr("style", "display:none");

	
	});
	
	$(".chat").on("click", ".commentLi .btnCancelCmt", function(){
		chgBeforeCmtBtn();
		chgBeforeReplyBtn();
		chgBeforeCmtRepBtns();
	});
	
	$(".chat").on("click", ".commentLi .btnModCmt", function(){
		
		var cwriterVal = $(this).siblings("p").data("cwriter");
		var pageNum = frmCmtPagingValue.find("input[name='pageNum']").val();
		console.log("댓글/답글 수정 펭지 번호: "+ pageNum);
		
		var txtBoxComment = $(this).prev().val();
		console.log("txtBoxComment: " + txtBoxComment);
		
		var creplyVal = $(this).closest("li").data("cno");
		
		var comment = { bno: 1,
						cno: cnoVal,
						ccontent: txtBoxComment,
						cwriter: cwriterVal };
	
		console.log("답글 등록:" + comment);
		
		myCommentClsr.modifyCmtReply(
				comment,
				function(serverResult){
					alert("수정되엇습니다");
					
					showCmtList(1);
				}
			);
	});
	$(".chat").on("click", ".commentLi .btnDelCmt", function(){
		
		var cwriterVal = $(this).siblings("p").data("cwriter");
		
		var delConfirm = confirm("삭제하시겠습니까?");
		
		var myCmt = {bno: 1,
					 cno: cnoVal,
					 cwriter: cwriterVal};
		
		console.log("답글 삭제: 서버전송 객체내용: " + myCmt);
		
		myCommentClsr.removeCmtReply(
			myComment,
			function(serverResult){
				alert("삭제되었습니다.");
				
				showCmtList(1);
			}
		);
	});
	$(document).ready(function(){
		
		showCmtList(1);
	});

</script>
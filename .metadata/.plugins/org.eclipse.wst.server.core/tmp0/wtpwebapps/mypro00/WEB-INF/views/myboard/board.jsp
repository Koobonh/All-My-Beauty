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

<div class="page-wrapper">

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			    <p style="margin-bottom: 0px; font-size: 16px;">
	                    <strong style="padding-top: 2px;">
	                        <span>&nbsp;</span>
	                        <button type="button" id="btnChgCmtReg" class="btn btn-border-d btn-round">댓글 작성</button>
	                        <button type="button" id="btnRegCmt" class="btn btn-w btn-round" style="display:none">댓글 등록</button>
	                        <button type="button" id="btnCancelRegCmt" class="btn btn-danger btn-round" style="display:none">취소</button>
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
		</div>
<script type="text/javascript" src="${contextPath}/resources/js/mycomment.js"></script>
<script>
	var commentUL = $(".chat");
	var frmCmtPagingValue = $("#frmCmtPagingValue");
	//댓글 목록 표시 함수
	function showCmtList(page){
		myCommentClsr.getCmtList(
				{bno: bnoValue, page: page || 1},
				function(replyPagingCreator){
					console.log("서버로부터 전달된 pageNum(BCommentPaging.myRelyPaging.pageNum)"
							+ bCommentPagingCreator.bCommentPaging.pagingNum);
					
					frmCmtPagingValue.find("input[name='pageNum']")
									.val(bCommentPagingCreator.bCommentPaging.pageNum);
					
					console.log("폼에 저장된 페이징 번호 pageNum:"
							+ frmCmtPagingValue.find("input[name='pageNum']").val());
					var str="";
				})
				//댓글이 없으면 if문안의 블록이 실행됨 or 중지됨
		if( (! bCommentPagingCreator.CmtList) || (bCommentPagingCreator.length == 0) ){
			str += '<li class="left clearfix commentLi" '
			+	'	style="text-align: center; background-color: lightCyan;'
			+	'   		height: 35px;margin-bottom: 0px;padding-bottom:0px;'
			+   '           padding-top:6px;border: 1px dotted;">'
			+   '       <strong>등록된 댓글이 없습니다.</strong></li>';
			commentUl.html(str)
			return;
		}
		//답글표시 for문
		for (var i = 0, len = bCommentPagingCreator.CmtList.length; i < len; i++){
			str +='<li class="left clearfix commentLi data-bno="' + bnoValue
			+ '"	data-cno"'+bCommentPagingCreator.CmtList[i].cno+"'>'
			+'        <div>';
	//댓글에 대한 답글 들여쓰기
		if(bCommentPagingCreator.CmtList[i].lvl ==1){
			str+='		<div>';
		}else if (bCommentPagingCreator.CmtList[i].lvl == 2){
			str+='        <div style="padding-left:25px">';
		}else if (bCommentPagingCreator.CmtList[i].lvl == 3){
			str+='		  <div style="padding-left:50px">';
		}else if (bCommentPagingCreator.CmtList[i].lvl == 4){
			str+='		  <div style="padding-left:75px">';
		}else{
			str +='       <div style="padding-left:100px">';
		}
			str +='          <span class="header info-mid">'
				+ '              <strong class="primary-font">';
		if(bCommentPagingCreator.CmtList[i].lvl > 1){
			str+='                  <i class="fa fa-reply fa-fw"></i>&nbsp;';
		}
			str+=					bCommentPagingCreator.CmtList[i].mid
			   + '              </strong>'
			   + '              <span>&nbsp;</span>'
		if(bCommentPagingCreator.CmtList[i].lvl > 1){
			str +='             <small>&nbsp; 답글</small>'
		}
			str +='         <span>'
				+ '         <p data bno=' + bCommentPagingCreator.CmtList[i].bno
				+ '            data-cno=' + bCommentPagingCreator.CmtList[i].cno
				+ '            data-mid=' + bCommentPagingCreator.CmtList[i].mid
				+ '         >' + bCommentPagingCreator.CmtList[i].rcontent + '</p>'
				+ '     </div>';
				+ '    </div>'
				+ '</li>';
		}//for-end
				commentUL.html(str);
		
				showCmtPagingNums(bCommentPagingCreator.bCommentPaging.pageNum,
						bCommentPagingCreator.startPagingNum,
						bCommentPagingCreator.endPagingNum,
						bCommentPagingCreator.prev,
						bCommentPagingCreator.next,
						bCommentPagingCreator.lastPageNum)
			}
		}
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
	$(document).ready(function(){
		
		showCmtList(1);
	});

</script>
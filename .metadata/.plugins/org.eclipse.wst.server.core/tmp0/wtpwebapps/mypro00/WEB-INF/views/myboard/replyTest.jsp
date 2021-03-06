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
	                        <span>댓글&nbsp;<c:out value="${board.breplyCnt}"/>개</span> 
	                        <span>&nbsp;</span>
	                        <button type="button" id="btnChgCmtReg" class="btn btn-border-d btn-round">댓글 작성</button>
	                        <button type="button" id="btnRegCmt" class="btn btn-w btn-round" style="display:none">댓글 등록</button>
	                        <button type="button" id="btnCancelRegCmt" class="btn btn-danger btn-round" style="display:none">취소</button>
	                    </strong>
	            </p>
				</div>
				<div class="panel-body">
		<%-- 댓글 입력창 div 시작 --%>
		                <div class="form-group" style="margin-bottom: 5px;">
		                    <textarea class="form-control input-lg" name="rcontent"
		                               placeholder="댓글작성을 원하시면,&#10;댓글 작성 버튼을 클릭해주세요."
		                               readonly="readonly"
		                    ></textarea>
		                </div>
		                <hr style="margin-top: 10px; margin-bottom: 10px;">
		<%-- 댓글 입력창 div 끝 --%>
		</div>
	</div>
</div>
</div>
<script type="text/javascript" src="${contextPath}/resourses/js/mycomment.js"></script>
<script>
</script>
<%@ include file="../myinclude/myfooter.jsp" %>
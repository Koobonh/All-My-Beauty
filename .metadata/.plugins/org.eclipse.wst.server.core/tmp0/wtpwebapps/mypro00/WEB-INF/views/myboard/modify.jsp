<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<c:set var="contextPath" value = "${pageContext.request.contextPath} " />

<%@ include file ="../myinclude/myheader.jsp" %>

<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board - Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading"><h4>게시글 수정-삭제</h4></div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                
        <form role="form" id="frmModify"  method="post" name="frmBoard">
        
         <div class="form-group">
         <label>글번호</label>
          <input class="form-control" name="bno" value='<c:out value="${board.bno}"/>'
          		 readonly="readonly"/>
		 </div>
		         
        <div class="form-group">
         <label>글제목</label>
          <input class="form-control" name="btitle" value='<c:out value="${board.btitle}" />' />
         </div>
         
          <div class="form-group">
         <label>글내용</label> 
         <textarea class="form-control" rows="3" name="bcontent"
           	><c:out value="${board.bcontent}"/></textarea>
        </div>
        
         <div class="form-group">
         <label>작성자</label> 
         <input class="form-control" name="bwriter" value='<c:out value="${board.bwriter}"/>'
          		readonly="readonly" />
         </div>
         
         <div class="form-group">
         <label>최종수정일</label> [등록일시: <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bregDate}"/>]
         
        <input class="form-control" name="bmodDate" value='<fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${board.bmodDate}"/>'
     			disabled="disabled" />
        </div>
         
         
         <button type="button" class="btn btn-default" id="btnModify" data-oper="modify">수정</button>
         <button type="button" class="btn btn-danger" id="btnRemove" data-oper="remove">삭제</button>
         <button type="button" class="btn btn-info" id="btnlist" data-oper="list">취소</button>		 
         
         <input type='hidden' name='pageNum' value='${myBoardPagingDTO.pageNum}'>
         <input type='hidden' name='rowAmountPerPage' value='${myBoardPagingDTO.rowAmountPerPage}'>
         <input type='hidden' name='scope' value='${myBoardPgingDTO.scope}'>
         <input type='hidden' name='keyword' value='${myBoardPgingDTO.keyword}'>
       
       
       
       
        </form>
                    </div><!-- /.panel-body -->
                </div><!-- /.panel -->
            </div><!-- /.col-lg-12 -->
        </div> <!-- /.row -->
       </div><!-- /page-wrapper -->
       
        <script>
        
        var frmModify = $("#frmModify");
        
        $('button').on("click", function(e){
        	
        	var operation = $(this).data("oper"); // 각 버튼의 data-xxx속성에 설정된 값을 저장
        	//alert("operation: " + operation);
        	
        	if(operation == "modify") { 
        		frmModify.attr("action", "${contextPath}/myboard/modify");
        		
        	} else if(operation == "remove") {
        		frmModify.attr("action", "${contextPath}/myboard/delete"); // 삭제한 것 처럼 보여주는 것
        		//frmModify.attr("action", "${contextPath}/myboard/remove"); // 실제 삭제
        		
        	} else if(operation == "list"){
        		
        		var pageNumInput = $("input[name ='pageNum']").clone();
        		var rowAmountINput = $("inputp[name='rowAmountPerPage']").clone();
        		var scopeInput = $("inputp[name='scope']").clone();
        		var keywordInput = $("inputp[name='keyword']").clone();
        		
        		frmModify.empty(); //폼 비우기
        		
        		frmModify.attr("action", "${contextPath}/myboard/list").attr("method","get");
        		//복사된 input 요소를 다시 form에 추가
        		frmModify.append(pageNumInput);
        		frmModify.append(rowAmountInput);
        		frmModify.append(scopeInput);
        		frmModify.append(keywordInput);
        
		}
        
        frmModify.submit(); //요청 전송
        
        });
        
        </script>
<%@ include file ="../myinclude/myfooter.jsp" %>

 
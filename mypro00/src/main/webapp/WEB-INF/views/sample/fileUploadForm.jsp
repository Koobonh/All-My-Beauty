<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
 <c:set var="contextPath" value="${pageContext.request.contextPath}" />
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload Form Page</title>
</head>
<body>



<!-- 다중파일 업로드 방법1 : form 방식의 파일 업로드  -->

<form action="${contextPath}/fileUploadFormAction" method="post" enctype="multipart/form-data">
	<input type="text" name="msg" placeholder="메시지를 입력합니다.">
	<input id="inputFile" type ="file" name="uploadFiles" multiple>
	<button>Submit</button>
</form>

</body>
</html>
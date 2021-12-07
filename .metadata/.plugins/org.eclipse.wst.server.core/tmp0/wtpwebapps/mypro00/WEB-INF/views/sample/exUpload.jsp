<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exUpload</title>
</head>
<body>

<form action="/sample/exUploadPost" method="post" enctype="multipart/form-data">
<!-- <form action="/sample/exUploadPost" method="post" enctype="application/x-www-form-urlencoded">         이렇게 기본으로 되어 있으면 파일 못보냄. multipart로 파일 보내야함      -->    
	<div><input type="text" name="name" placeholder="이름 입력">
		<input type="text" name="age" placeholder="나이 입력"></div>

	<div><input type="file" name="files"></div>
	<div><input type="file" name="files"></div>
	<div><input type="file" name="files"></div>
	<div><input type="file" name="files"></div>
	<div><input type="file" name="files"></div>
	<div><input type="submit" name="files"></div>


</form>
</body>
</html>
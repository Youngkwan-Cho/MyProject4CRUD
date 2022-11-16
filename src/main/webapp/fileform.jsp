<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 업로드</title>
    <link rel="stylesheet" href="member.css">
</head>
<body>
<form action="fileupload.jsp" method="post" enctype="multipart/form-data">
    <input type='file' name="photo">
    <input type="submit" value="upload">
</form>

</body>
</html>

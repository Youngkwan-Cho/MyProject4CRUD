<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<link href="./assets/css/sticky-footer-navbar.css" rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>회원 정보 수정</title>
	<link rel="stylesheet" href="member.css">
</head>
<body>
<jsp:include page="/inc/top.jsp"/>

<%
	MemberDAO memberDAO = new MemberDAO();
	String id = request.getParameter("id");
	MemberVO u = memberDAO.getMember(Integer.parseInt(id));
	request.setAttribute("vo", u);
%>

<h1>회원 정보 수정</h1>


<main role="main" class="container">
	<div>
		<div class="text-center my-3"><h1>회원 정보 수정</h1></div>
		<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
			<input type="hidden" name="sid" value="${vo.getSid()}"/>
			<table class="table">
				<tr>
					<td>User ID</td>
					<td><input type="text" name="userid" value="${vo.getUserid()}" disabled/></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><input type="text" name="username" value="${vo.getUsername()}"/></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="text" name="email" value="${vo.getEmail()}"/></td>
				</tr>
				<tr>
					<td>Photo</td>
					<td><input type='file' name="photo" value="${vo.getPhoto()}"/>
						<c:if test="${vo.getPhoto() ne ''}"><br/><img
								src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo">
						</c:if>
					</td>
				</tr>
				<tr>
					<td>Detail</td>
					<td><textarea cols="50" rows="5" name="detail">${vo.getDetail()}</textarea></td>
				</tr>
			</table>
			<button type="button" onclick="history.back()" class="btn btn-primary" aria-pressed="true">뒤로 가기</button>
			<button type="submit" class="btn btn-primary" aria-pressed="true">수정</button>
		</form>
	</div>
</main>
<jsp:include page="/inc/bottom.jsp"/>
</body>
</html>
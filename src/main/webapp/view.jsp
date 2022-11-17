<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link href="./assets/css/sticky-footer-navbar.css" rel="stylesheet">
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta charset="UTF-8">
  <title>회원 정보 확인</title>
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

<h1>회원 정보 확인</h1>

<main role="main" class="container">
  <div>
    <div class="text-center my-3"><h1>회원 정보 확인</h1></div>
    <table class="table">
      <tr>
        <td>User ID</td>
        <td>${vo.getUserid()}</td>
      </tr>
      <tr>
        <td>Name</td>
        <td>${vo.getUsername()}</td>
      </tr>
      <tr>
        <td>Photo</td>
        <td><c:if test="${vo.getPhoto() ne ''}"><img
                src="${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class="photo" width="80" height="80">
        </c:if>
        </td>
      </tr>
      <tr>
        <td>Email</td>
        <td>${vo.getEmail()}</td>
      </tr>
      <tr>
        <td>Detail</td>
        <td>${vo.getDetail()}</td>
      </tr>
    </table>
    <button type="button" onclick="history.back()" class="btn btn-primary" aria-pressed="true">뒤로 가기</button>
    <button type="button" onclick="location.href='editform.jsp?id=${vo.getSid()}'" class="btn btn-primary"
            aria-pressed="true">수정
    </button>
  </div>
</main>
<jsp:include page="/inc/bottom.jsp"/>
</body>
</html>
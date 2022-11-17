<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.crud.dao.MemberDAO, com.crud.bean.MemberVO,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link href="./assets/css/sticky-footer-navbar.css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>회원 정보</title>
    <script>
        function delete_ok(id) {
            var a = confirm("정말로 삭제하겠습니까?");
            if (a) location.href = 'delete_ok.jsp?id=' + id;
        }
    </script>
</head>
<body>
<jsp:include page="/inc/top.jsp"/>
<h1>회원 목록</h1>

<%
    MemberDAO boardDAO = new MemberDAO();
    List<MemberVO> list = boardDAO.getList();
    request.setAttribute("list", list);
%>

<main role="main" class="container">
    <div>
        <div class="text-center my-3"><h3>전체 회원 정보</h3></div>
        <div class="d-flex justify-content-end mb-3">
            <a href="addform.jsp" class="btn btn-primary" role="button" aria-pressed="true">회원 추가</a>
        </div>
        <table class="table">
            <thead class="bg-light">
            <tr class="align-middle">
                <th scope="col">No</th>
                <th scope="col">User ID</th>
                <th scope="col">Username</th>
                <th scope="col">Image</th>
                <th scope="col">Email</th>
                <th scope="col">Regdate</th>
                <th scope="col">Information</th>
                <th scope="col">Edit</th>
                <th scope="col">Delete</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="u" varStatus="status">
                <tr>
                    <td>${fn:length(list)-status.index}</td>
                    <td>${u.getUserid()}</td>
                    <td>${u.getUsername()}</td>
                    <td><c:if test="${u.getPhoto() ne ''}"><img
                            src="${pageContext.request.contextPath}/upload/${u.getPhoto()}" class="photo" width="50" height="50">
                    </c:if>
                    </td>
                    <td>${u.getEmail()}</td>
                    <td>${u.getRegdate()}</td>
                    <td><a href="view.jsp?id=${u.getSid()}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-search-" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </a></td>
                    <td><a href="editform.jsp?id=${u.getSid()}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-pencil-fill" viewBox="0 0 16 16">
                            <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"></path>
                        </svg>
                    </a></td>
                    <td><a href="javascript:delete_ok(${u.getSid()})">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"></path>
                        </svg>
                    </a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</main>
<jsp:include page="/inc/bottom.jsp"/>
</body>
</html>
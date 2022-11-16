<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.member.FileUpload"%>
<%@ page import="com.crud.dao.MemberDAO" %>
<%@ page import="com.crud.bean.MemberVO" %>

<%
	request.setCharacterEncoding("utf-8");
	MemberDAO memberDAO = new MemberDAO();
	FileUpload upload = new FileUpload();
	MemberVO u = upload.uploadPhoto(request);

	int i=memberDAO.updateMember(u);

%>
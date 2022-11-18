<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.crud.dao.MemberDAO"%>
<%@ page import="com.crud.member.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberDAO u = new MemberDAO();
		String filename= u.getPhotoFilename(id);
		if (filename!=null) FileUpload.deleteFile(request, filename);
		u.deleteMember(id);
	}
	response.sendRedirect("posts.jsp");
%>
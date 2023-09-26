<%@page import="java.sql.SQLException"%>
<%@page import="meokjang.service.MemberService"%>
<%@page import="meokjang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
%>

${mo}
<%
	out.println("<script>");
	session.removeAttribute("mo");
	out.println("location.href='../list.jsp'");
	out.println("</script>");
%>
</body>
</html>
<%@page import="meokjang.service.MemberService"%>
<%@page import="meokjang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String ID = request.getParameter("ID");
	out.print("ID:" +ID);
	out.print("name:" +name);
//	MemberService.getInstance().memberDrop(ID); 
	
	
 	out.println("<script>");
	out.println("alert('탈퇴 완료!')");
//	out.println("location.href='login.jsp'");
	out.println("</script>");

%>
</body>
</html>
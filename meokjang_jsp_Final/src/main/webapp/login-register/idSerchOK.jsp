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

<jsp:useBean id="mo" class="meokjang.vo.MemberVO">
	<jsp:setProperty property="*" name="mo"/>
</jsp:useBean>

<%
	MemberVO origin = MemberService.getInstance().selectByName(mo);
	out.println(origin);
	out.println("<script>");
	out.println("alert('고객님의 아이디는" + origin.getID() + "입니다.')");
	out.println("location.href='login.jsp'");
	out.println("</script>");
%>
</body>
</html>
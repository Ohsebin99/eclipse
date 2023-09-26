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
${mo}

<%
	MemberVO origin = MemberService.getInstance().passwordSerch(mo);
	out.println(origin);
	request.setAttribute("origin", origin);
	pageContext.forward("passwordChange2.jsp");
%>
</body>
</html>
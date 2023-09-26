<%@page import="com.tjoeun.vo.FreeboardVO"%>
<%@page import="com.tjoeun.service.FreeboardService"%>
<%@page import="com.tjoeun.vo.FreeboardList"%>
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

	<jsp:useBean id="vo" class="com.tjoeun.vo.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	FreeboardService service = FreeboardService.getInstance();

	/* FreeboardVO original = service.selectByIdx(vo.getIdx()); */
	
			
	service.hit(vo.getIdx());	
	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "&job=contentView"); 
//	pageContext.forward("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "&job=contentView"); 
	
	
	
	

%>

	
	
</body>
</html>
<%@page import="com.tjoeun.service.FreeboardCommentService"%>
<%@page import="com.tjoeun.vo.FreeboardCommentList"%>
<%@page import="com.tjoeun.service.FreeboardService"%>
<%@page import="com.tjoeun.dao.FreeboardDAO"%>
<%@page import="com.tjoeun.vo.FreeboardVO"%>
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

	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String job = request.getParameter("job");
	
	FreeboardVO vo = FreeboardService.getInstance().selectByIdx(idx);
//	out.println(vo);

	request.setAttribute("vo", vo);
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("enter", "\r\n");
	
	if(job.equals("contentView")) {
		FreeboardCommentList freeboardCommentList = 
				FreeboardCommentService.getInstance().selectCommentList(idx);
		request.setAttribute("freeboardCommentList", freeboardCommentList);
	}
	
	pageContext.forward(job + ".jsp");

%>


</body>
</html>
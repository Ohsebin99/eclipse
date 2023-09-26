<%@page import="meokjang.vo.PartyVO"%>
<%@page import="meokjang.service.PartyService"%>
<%@page import="meokjang.vo.RepleVO"%>
<%@page import="meokjang.service.RepleService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	PartyVO original = PartyService.getInstance().selectByIdx(idx);
	PartyService.getInstance().partyDelete(idx);
	out.println("<script>");
	// 글을 성공적으로 삭제했다는 메시지를 출력한다.
	out.println("alert('글 삭제완료!!!')");
	out.println("location.href='list.jsp?currentPage="+currentPage+"'");
	out.println("</script>");
%>

</body>
</html>
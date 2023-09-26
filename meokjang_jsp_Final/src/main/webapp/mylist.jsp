<%@page import="meokjang.vo.RepleVO"%>
<%@page import="meokjang.vo.RepleList"%>
<%@page import="meokjang.vo.PartyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="meokjang.vo.MemberVO"%>
<%@page import="meokjang.service.PartyService"%>
<%@page import="meokjang.vo.PartyList"%>
<%@page import="meokjang.service.RepleService"%>
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
	
	if (session.getAttribute("mo") == null) {
		out.println("<script> "+
				"alert('로그인이 필요한 서비스입니다.');" +
					"location.href='login-register/login.jsp';" +
				"</script>"
		);
	}

 	MemberVO mo = (MemberVO) session.getAttribute("mo");
	PartyList createList = PartyService.getInstance().createMyList(mo.getID());
	ArrayList<RepleVO> repleList = RepleService.getInstance().getFixList(mo.getID());
	ArrayList<PartyVO> joinList = PartyService.getInstance().joinMyList(mo.getID());

	//out.println(createList);
	//out.println(joinList);
	
	request.setAttribute("createList", createList);
	request.setAttribute("joinList", joinList);
	request.setAttribute("repleList", repleList);
	
	request.setAttribute("enter", "\r\n");
	
	pageContext.forward("mylistView.jsp");
	
%>
</body>
</html>
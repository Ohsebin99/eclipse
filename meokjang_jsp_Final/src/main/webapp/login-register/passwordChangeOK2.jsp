<%@page import="meokjang.service.MemberService"%>
<%@page import="meokjang.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="mo" class="meokjang.vo.MemberVO">
	<jsp:setProperty property="*" name="mo"/>
</jsp:useBean>
${mo}<br/>
<%
	request.setCharacterEncoding("UTF-8");
	String originID = request.getParameter("originID");
 	out.println("originID" + originID);

	if(originID != null){
		mo.setID(originID);
	}
 	out.println(mo.getID());
	
	MemberService.getInstance().passwordChange(mo); 
	
	
 	out.println("<script>");
	out.println("alert('비밀번호 변경 완료!')");
	out.println("location.href='login.jsp'");
	out.println("</script>");

%>
</body>
</html>
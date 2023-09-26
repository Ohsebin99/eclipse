<%@page import="meokjang.service.MemberService"%>
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
%>

<jsp:useBean id="mo" class="meokjang.vo.MemberVO">
	<jsp:setProperty property="*" name="mo"/>
</jsp:useBean>
${mo}

<%
//	insert.jsp에서 넘어온 메인글을 테이블에 저장하는 메소드를 실행한다.
	MemberService.getInstance().myProfileUpdate(mo);
	out.println("<script>");
	out.println("alert('" + mo.getName() + " 님 개인 정보가 수정되었습니다 ~!')");
	out.println("location.href='../list.jsp'");
	out.println("</script>");
%>


</body>
</html>
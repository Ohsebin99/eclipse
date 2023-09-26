<%@page import="meokjang.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/common/jquery-3.7.0.js"></script>		<!-- jQury -->
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
	MemberService.getInstance().insert(mo);
	out.println("<script>");
	out.println("alert('" + mo.getName() + " 님 회원 가입을 축하 드립니다 ~!')");
	out.println("location.href='login.jsp'");
	out.println("</script>");
%>

</body>
</html>
<%@page import="java.sql.SQLException"%>
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
//	out.println("<br/>");  확인코드

//	insert.jsp에서 넘어온 메인글을 테이블에 저장하는 메소드를 실행한다.
	MemberVO original = null;

	try{
		original = MemberService.getInstance().selectByID(mo.getID());
	} catch (Exception e){ }
	
	
		out.println("<script>");
	if (original == null) {
		out.println("alert('정보가 일치하지 않습니다.')");
		out.println("location.href='login.jsp'");
	} else if (mo.getPassword().equals(original.getPassword())) {
		session.setAttribute("mo", original);
		out.println("alert('" + original.getNickName() + "님 반갑습니다.')");
		out.println("location.href='../list.jsp'");
	} else {
		out.println("alert('정보가 일치하지 않습니다.')");
		out.println("location.href='login.jsp'");
	}
		out.println("</script>"); 
%>
</body>
</html>
<%@page import="com.tjoeun.vo.FreeboardList"%>
<%@page import="com.tjoeun.service.FreeboardService"%>
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
	
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>

	
	<jsp:useBean id="vo" class="com.tjoeun.vo.FreeboardVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	FreeboardVO original = FreeboardService.getInstance().selectByIdx(vo.getIdx());

	out.println("삭제할 글의 비밀번호 글자수: " + original.getPassword().length() + "<br/>");
	out.println("공백을 제거한 삭제할 글의 비밀번호 글자수: " + original.getPassword().trim().length() + "<br/>");
	out.println("삭제하기 위해 입력한 비밀번호 글자수: " + vo.getPassword().length() + "<br/>"); 
	//테이블을 설계할 때 char 대신 varchar2(가변길이 문자열)로 선언한다.
	//이미 테이블이 char로 설계된 상태라면 trim() 메소드로 불필요한 빈 칸을 제거해서 사용한다.
	
	//삭제할 글의 비밀번호(original.getPassword())와 삭제하기 위해 입력한 비밀번호(vo.getPassword())를 비교한다.
	out.println("<script>");
	if (original.getPassword().trim().equals(vo.getPassword().trim())) {
		
		// 비밀번호가 일치하면 글을 삭제하는 메소드를 실행한다.
		FreeboardService.getInstance().delete(vo.getIdx());
		
		out.println("alert('" + vo.getIdx() + "번 글 삭제완료!!!')");
	} else {
		// 비밀번호가 일치하지 않으면 오류 메시지를 출력한다.
		out.println("alert('비밀번호가 일치하지 않습니다.')");
	}
	out.println("location.href='list.jsp?currentPage=" + currentPage + "'");
	out.println("</script>");
%>











</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tjoeun.vo.CategoryVO"%>
<%@page import="com.tjoeun.service.CategoryService"%>
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

<jsp:useBean id="vo" class="com.tjoeun.vo.CategoryVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%-- ${vo} --%>

<%
	CategoryService service = CategoryService.getInstance();
	
//	삭제한 카테고리 이름을 삭제 완료 메시지에 표시하기 위해서 삭제하기 전에 삭제할 카테고리를 얻어온다.
	CategoryVO original = service.selectByIdx(vo.getIdx());	

//	1. 삭제 버튼이 클릭되면 해당 카테고리를 테이블에서 완전히 삭제한다.
	service.delete(vo.getIdx());



	out.println("<script>");
	out.println("alert('카테고리 전체 삭제')");
	out.println("location.href='list.jsp'");
	out.println("</script>");
	
%>

</body>
</html>



















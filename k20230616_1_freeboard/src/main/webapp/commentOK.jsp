<%@page import="com.tjoeun.service.FreeboardCommentService"%>
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
	int mode = Integer.parseInt(request.getParameter("mode"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>
	<jsp:useBean id="co" class="com.tjoeun.vo.FreeboardCommentVO">
	<jsp:setProperty property="*" name="co"/>
</jsp:useBean>

<%
	FreeboardCommentService service = FreeboardCommentService.getInstance();
	out.println("<script>");
	switch(mode){
	case 1:
		out.println("alert('댓글 저장 " + (service.insertComment(co) ? "성공" : "실패")+ "')") ;
		break;
	case 2:
		out.println("alert('댓글 수정 " + (service.updateComment(co) ? "성공" : "실패")+ "')") ;
		break;
	case 3:
		out.println("alert('댓글 삭제 " + (service.deleteComment(co) ? "성공" : "실패")+ "')") ;
		break;
	
	}
	out.println("location.href='selectByIdx.jsp?idx=" + co.getGup() + "&currentPage=" + currentPage +
				"&job=contentView'");
	out.println("</script>");
//	response.sendRedirect("list.jsp?currentPage=" + currentPage);
//	response.sendRedirect("selectByIdx.jsp?idx=" + co.getIdx() + "&currentPage=" + currentPage
//							+ "&job=contentView");
%>

</body>
</html>
















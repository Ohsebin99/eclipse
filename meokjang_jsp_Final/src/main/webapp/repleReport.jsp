<%@page import="meokjang.service.PartyService"%>
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
%>
<jsp:useBean id="vo" class="meokjang.vo.PartyVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
${vo}

<%
	PartyService.getInstance().partyReport(vo.getIdx(), vo.getDeleteReport());
	out.println("<script>");
	out.println("alert('신고 완료!!!')");
	out.println("location.href='selectByIdx.jsp?idx="+vo.getIdx()+"&currentPage="+currentPage+"&job=repleView'");
	out.println("</script>");

%>

</body>
</html>
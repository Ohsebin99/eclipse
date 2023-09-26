<%@page import="meokjang.service.RepleService"%>
<%@page import="meokjang.vo.RepleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="ro" class="meokjang.vo.RepleVO">
	<jsp:setProperty property="*" name="ro"/>
</jsp:useBean>	
${ro}
<%
	request.setCharacterEncoding("UTF-8");
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	int idx = Integer.parseInt(request.getParameter("idx"));
	int repleIdx = Integer.parseInt(request.getParameter("repleIdx"));
	RepleService.getInstance().deleteJoin(repleIdx);
	out.println("<script>");
	out.println("alert('거절 완료!!!')");
	out.println("location.href='selectByIdx.jsp?idx="+idx+"&currentPage="+currentPage+"&job=repleView'");
	out.println("</script>");
%>

</body>
</html>
<%@page import="meokjang.service.RepleService"%>
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

<jsp:useBean id="ro" class="meokjang.vo.RepleVO">
   <jsp:setProperty property="*" name="ro"/>
</jsp:useBean>
${ro}

<%
	RepleService.getInstance().repleInsert(ro);
	out.println("<script>");
	out.println("alert('참여 신청 완료!!!')");
	out.println("location.href='selectByIdx.jsp?idx="+ro.getOriginIdx()+"&currentPage="+currentPage+"&job=repleView'");
	out.println("</script>");

%>

</body>
</html>
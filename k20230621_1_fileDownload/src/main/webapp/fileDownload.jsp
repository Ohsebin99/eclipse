<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 다운로드 페이지</title>
</head>
<body>

<%
	String uploadDirectory = application.getRealPath("./upload/");
//	out.println(uploadDirectory + "<br/>");
	String[] files = new File(uploadDirectory).list();
//	out.println(Arrays.toString(files));
	
	int i = 0;
		out.println(request.getContextPath() + "<br/>");
	for (String file : files) {
//		out.println(++i + ". " + file + "<br/>");
		
%>
<%=++i%>.
<a href="<%=request.getContextPath()%>/DownloadAction?file=<%=URLEncoder.encode(file, "UTF-8")%>"><%=file%></a><br/>
<%
	}
%>

<a href="index.jsp">돌아가기</a>

<form action="<%=request.getContextPath()%>/DownloadAction" method="post">
	<input type="text" name="name" value="홍길동"/>
	<input type="submit" value="눌러"/>
</form>

</body>
</html>
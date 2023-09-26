<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="org.apache.tomcat.util.descriptor.web.MultipartDef"%>
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
	
	try{
		
	MultipartRequest mr = new MultipartRequest(
	request,
	application.getRealPath("./upload/"),	
	5 * 1024 * 1024,	
	"UTF-8",
	new DefaultFileRenamePolicy()
	);
	
	String originalFilename = mr.getOriginalFileName("filename");
	out.println("원본 파일 이름: " + originalFilename + "<br/>");
	File realFilename = mr.getFile("filename");
	out.println("디스크에 실제 업로드(저장)된 파일 이름: : " + realFilename.getPath() + "<br/>");
	out.println("디스크에 실제 업로드(저장)된 파일 이름: : " + realFilename.getName() + "<br/>");
	} catch(IOException e){
		out.println("업로드 파일 용량 초과, 5MB 까지만 업로드 가능");
	}
	
%>



파일 업로드 완료<br/>
<a href="./fileUploadForm.jsp">돌아가기</a>




























</body>
</html>
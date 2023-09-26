<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.MultipartParser"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	MultipartRequest multipartRequest = new MultipartRequest(
		request,
		application.getRealPath("./upload/"),
		5 * 1024 * 1024 * 1024,
		"UTF-8",
		new DefaultFileRenamePolicy()
	);
	
	String filename = multipartRequest.getOriginalFileName("file");
	
	String fileRealname = multipartRequest.getFilesystemName("file");
	
	File realFile = multipartRequest.getFile("file");
	
	long fileLength = realFile.length();
	
//	out.println("원본 파일 이름: " + filename + "<br/>");
//	out.println("업로드된 파일 이름: " + fileRealname + "<br/>");
//	out.println("원본 파일 크기: " + fileLength + "<br/>");

	if (fileLength > 5 * 1024 * 1024) {
		out.println("<script>");
		out.println("alert('와우 ㅋ" + fileLength + " 바이트를 업로드 하려 하시네요.')");
		out.println("</script>");
		File file = new File(application.getRealPath("./upload/") + fileRealname);
		
		file.delete();
	} else if (!fileRealname.endsWith(".zip") && !fileRealname.endsWith(".png")) {
		
		out.println("<script>");
		out.println("alert('업로드할 수 있는 파일이 아님'");
		out.println("</script>");
		
		File file = new File(application.getRealPath("./upload/") + fileRealname);
		file.delete();
	}else {
		out.println("<script>");
		out.println("alert('업로드 성공')");
		out.println("</script>");
		out.println("원본 파일 이름: " + filename + "<br/>");
		out.println("업로드된 파일 이름: " + fileRealname + "<br/>");
		out.println("원본 파일 크기: " + fileLength + "<br/>");
	}
	out.println("<script>");
	out.println("location.href='index.jsp'");
	out.println("</script>");
%>

</body>
</html>



























<%@page import="com.tjoeun.fileupload.FileDAO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
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
		// application.getRealPath("./upload/"),
		"C:/upload/",
		5 * 1024 * 1024 * 1024,
		"UTF-8",
		new DefaultFileRenamePolicy()
	);
	
	Enumeration filenames = multipartRequest.getFileNames();
	
	while (filenames.hasMoreElements()) {
		
		String parameter = (String) filenames.nextElement();
	//	out.println(parameter + "<br/>");
	
		String filename = multipartRequest.getOriginalFileName(parameter);
		String fileRealname = multipartRequest.getFilesystemName(parameter);
		if (filename == null) {
			continue;
		}
		
	//	out.println("원본 파일 이름: " + filename + ", 실제 업로드된 파일 이름" + 
	//				fileRealname + "<br/>");
		File realFilename = new File("C:/upload/" + fileRealname);
		long fileLength = realFilename.length();
	//	out.println("파일 크기: " + fileLength + "<br/>");
	if (fileLength > 5 * 1024 * 1024) {
		out.println("<script>");
		out.println("alert('업로드 용량 초과')");
		out.println("</script>");
		realFilename.delete();
	}else if (!fileRealname.endsWith(".zip") && !fileRealname.endsWith(".png")) {
		
		out.println("<script>");
		out.println("alert('업로드할 수 있는 파일이 아님'");
		out.println("</script>");
		realFilename.delete();
	}else {
		out.println("<script>");
		out.println("alert('업로드 성공')");
		out.println("</script>");
		out.println("원본 파일 이름: " + filename + "<br/>");
		out.println("업로드된 파일 이름: " + fileRealname + "<br/>");
		out.println("원본 파일 크기: " + fileLength + "<br/>");
		
		new FileDAO().upload(filename, fileRealname);
	}
	
	out.println("<script>");
	out.println("location.href='index.jsp'");
	out.println("</script>");
	
	}
%>











</body>
</html>
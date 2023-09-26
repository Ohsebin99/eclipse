<%@page import="meokjang.service.PartyService"%>
<%@page import="meokjang.vo.PartyVO"%>
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
// partyUpdate.jsp에서 넘어오는 수정할 글번호, 수정 후 돌아갈 페이지 번호, 수정하기 위해 입력한 
// 수정할 내용(제목, 내용을 받는다.
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>
<jsp:useBean id="vo" class="meokjang.vo.PartyVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>	
<% 	
	out.println("update"+vo);
	PartyVO original = PartyService.getInstance().selectByIdx(vo.getIdx());
	PartyService.getInstance().partyUpdate(vo);
	out.println("<script>");
	// 글을 성공적으로 삭제했다는 메시지를 출력한다.
	out.println("alert('수정완료!!!')");
	out.println("location.href='selectByIdx.jsp?idx="+original.getIdx()+"&currentPage="+currentPage+"&job=repleView'");
	out.println("</script>");
%>

	
</body>
</html>
<%@page import="meokjang.vo.RepleList"%>
<%@page import="meokjang.service.RepleService"%>
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
	// listView.jsp 또는 repleInsert.jsp에서 넘어오는 글번호, 돌아갈 페이지 번호, 분기할 페이지 
	// 이름을 받는다.
		int	idx = Integer.parseInt(request.getParameter("idx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		String job = request.getParameter("job");
		
	// 메인글 1건을 얻어오는 메소드를 호출한다.	
		PartyVO vo = PartyService.getInstance().selectByIdx(idx);
//		out.println(vo);
		
	// 브라우저에 출력할 메인글이 저장된 객체(vo), 작업 후 돌아갈 페이지 번호, 줄바꿈에 사용할
	// 이스케이프 스퀀스(\r\n)를 request 영역에 저장한다.
		request.setAttribute("vo", vo);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("enter", "\r\n");
// 	job에 repleInsert가 넘어왔을 경우 댓글 목록을 얻어와서 request 영역에 저장시킨다.
 	if(job.equals("?")){
		RepleList repleList = RepleService.getInstance().selectRepleList(idx);
		request.setAttribute("repleList", repleList);
	}
		
		pageContext.forward(job+".jsp");
%>	
	
</body>
</html>
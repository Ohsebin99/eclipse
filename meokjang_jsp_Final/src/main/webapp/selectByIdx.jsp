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

		int currentPage = 1;
		int	idx = Integer.parseInt(request.getParameter("idx"));
	// listView.jsp 또는 repleInsert.jsp에서 넘어오는 글번호, 돌아갈 페이지 번호, 분기할 페이지 이름을 받는다.
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(NumberFormatException e) {	}
		String job = request.getParameter("job");
		
//		로그인이 되어있지 않을 경우
		if (session.getAttribute("mo") == null) {
			out.println("<script> "+
					"alert('로그인이 필요한 서비스입니다.');" +
						"location.href='login-register/login.jsp';" +
					"</script>"
			);
		} else {
		// 메인글 1건을 얻어오는 메소드를 호출한다.	
			PartyVO vo = PartyService.getInstance().selectByIdx(idx);
	//		out.println(vo);
		// 메인글 1건의 종속한 reple List를 얻어온다.	
			RepleList repleList = RepleService.getInstance().selectRepleList(idx);
				
			out.println(repleList);
			
		// 브라우저에 출력할 메인글이 저장된 객체(vo), 작업 후 돌아갈 페이지 번호, 줄바꿈에 사용할
			request.setAttribute("repleList", repleList);
			request.setAttribute("vo", vo);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("enter", "\r\n");
			
			pageContext.forward(job+".jsp");
			
		}
		

%>	
	
</body>
</html>
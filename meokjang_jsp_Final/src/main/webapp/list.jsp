<%@page import="meokjang.vo.MemberVO"%>
<%@page import="meokjang.vo.Param"%>
<%@page import="meokjang.service.PartyService"%>
<%@page import="meokjang.vo.PartyList"%>
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
	try{
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}catch(NumberFormatException e){}
	String item = request.getParameter("item");				// 검색어
	String condition = request.getParameter("condition");	// 검색 조건

	String location = request.getParameter("location");
	String acholchk = request.getParameter("acholchk");
	String partyGender = request.getParameter("partyGender");
	String category = request.getParameter("category");
	
	int minLimitAge = 19;
	try{
		minLimitAge = Integer.parseInt(request.getParameter("minLimitAge"));
	}catch(NumberFormatException e){}
	int maxLimitAge = 80;
	try{
		maxLimitAge = Integer.parseInt(request.getParameter("maxLimitAge"));
	}catch(NumberFormatException e){}
	
	
// 넘어온 검색어가 있으면 카테고리와 검색어를 세션에 저장하고 넘어온 검색어가 없으면 세션에 
// 저장된 카테고리와 검색어를 읽어온다.
	if (item != null) {
		session.setAttribute("condition", condition);
		item = item.trim().length() == 0 ? "" : item;
		session.setAttribute("item", item);
	} else {
		condition = (String) session.getAttribute("condition");
		item = (String) session.getAttribute("item");
	}
	
// 브라우저 화면에 표시할 1페이지 분량의 글 목록과 페이징 작업에 사용할 8개의 변수를 초기화 
// 시키는 메소드를 실행한다.
// 검색어가 넘어온 경우 (내용, 이름, 내용+이름)와 넘어오지 않은 경우에 따른 메소드를
// 각각 실행한다.
	PartyList partyList = null;
	PartyService service = PartyService.getInstance();
	Param param = new Param();
	param.setItem(item);
	param.setCondition(condition);
	param.setCategory(category);
	param.setLocation(location);
	param.setAcholchk(acholchk);
	param.setPartyGender(partyGender);
	param.setMinLimitAge(minLimitAge);
	param.setMaxLimitAge(maxLimitAge);
// 검색어가 있는 경우와 검색어가 없는 경우로 메소드를 구현한다.	
	if (location == null && acholchk == null && partyGender == null && category == null) {
	// 검색어가 입력되지 않은 경우
		partyList = service.selectList(currentPage, param);
	} else {
		// 검색어가 입력된 경우 (condition 구별을 xml에서 한다.)
		partyList = service.selectListMulti(currentPage, param);
	}
	
	
// 1페이지 분량의 글 목록과 페이징 작업에 사용할 8개의 변수가 초기화된 객체를 얻어와서 
// request 영역에 저장한다.


	request.setAttribute("partyList", partyList);
	request.setAttribute("currentPage", currentPage);
	
	PartyList partyListSlider = PartyService.getInstance().selectSlider();
	request.setAttribute("partyListSlider", partyListSlider);

// textarea에 글을 입력할 때 엔터키를 눌러 줄을 바꿔 입력한 경우 브라우저에 </br>
// 태그로 바꿔 출력하기 위해 request 영역에 "\r\n"을 저장한다.
	request.setAttribute("enter", "\r\n"); 
	
// request 영역에 저장된 글 목록을 브라우저에 표시하는 페이지(listView.jsp)로 넘겨준다.
	pageContext.forward("listView.jsp");
%>

	
</body>
</html>
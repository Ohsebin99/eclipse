<%@page import="java.util.Arrays"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

myInfoOK.jsp 입니다.

<%
// 	form에 입력된 한글 데이터가 post 방식으로 전송될 때 깨지는 현상을 방지한다.
//	한글 깨짐을 방지하려면 최초 request.getParameter() 메소드가 실행되기 전(맨처음)에 아래의 내용을
//	코딩하면 된다.
	request.setCharacterEncoding("UTF-8");

// 	request.getParameter() 메소드로 이전 페이지에서 submit 버튼이 클릭되면 넘어오는 데이터를 받는다.
//	이전 페이지에서 넘어오는 데이터는 무조건 문자열 형태로 넘어온다.
	String name = request.getParameter("name");
	out.println(name + "님 안녕<br>");
	String id = request.getParameter("id");
	out.println(name +"님의 id는 " + id + "입니다.<br>");
	String password = request.getParameter("password");
	out.println(name +"님의 비밀번호는 " + password + "입니다.<br>");
	try{
	int age = Integer.parseInt(request.getParameter("age"));
	out.println(name +"님의 나이는 " + age + "입니다.<br>");
		
	}catch(NumberFormatException e){
		out.println("잘못된 나이가 입력되었슴다.<be>");
		out.println("<script>");
		out.println("alert('잘못된 나이가 입력되었슴다.')");
		out.println("</script>");
	}
	
	String gender = request.getParameter("gender");
	out.println(gender);
	
// 	checkbox는 여러 항목을 선택할 수 있는데 아래와 같이 request.getParameter() 메소드를 이용해
// 	넘어오는 데이터를 받으면 맨 처음 선택한 값 1개만 받을 수 있다.
// 	데이터가 여러 개 넘어오는 경우 request.getParameter() 메소드를 사용하지 않는다.
	
//	checkbox에서 넘어오는 데이터를 받을 때 넘어오는 항목이 여러 개일 수 있기 때문에
//	getParameterValues() 메소드로 받아서 배열에 저장해야 한다.
	String[] hobbies = request.getParameterValues("hobbies");
	out.println(name + "님의 취미는" + hobbies +"입니다.<br>");
	out.println(name + "님의 취미는" + Arrays.toString(hobbies) +"입니다.<br>");
	try{
		
	for(int i=0; i<hobbies.length; i++){
		out.println(hobbies[i] + " ");
	}
	out.println("입니다.<br>");
	}catch(NullPointerException e){
		out.println("없습니다.<br>");
	}
	
	String trip = request.getParameter("trip");
	out.println(name + "님은 " + trip + "에 가고싶어합니다.<br>");
	
	
	String[] travel = request.getParameterValues("travel");
	out.println(name + "님은" + travel +"에 가고싶어합니다.<br>");
	out.println(name + "님은" + Arrays.toString(travel) +"에 가고싶어합니다..<br>");
	out.println(name + "님은 ");
	try{
		
	for(int i=0; i<travel.length; i++){
		out.println(travel[i] + " ");
	}
	out.println("에 가고싶어합니다.<br>");
	}catch(NullPointerException e){
		out.println("가고싶어 하는 곳이 없습니다.<br>");
	}
	String content = request.getParameter("content");
//	태그 사용 가능, 줄바꿈 불가능
	out.println(content + "<br>");
//	태그 사용 불가능, 줄바꿈 불가능
	out.println(content.replace("<", "&lt;").replace(">", "&gt;") + "<br>");
//	태그 사용 가능, 줄바꿈 가능
	out.println(content.replace("\r\n", "&lt;") + "<br>");
//	태그 사용 가능, 줄바꿈 가능
	out.println(content.replace("<", "&lt;").replace(">", "&gt;").replace("\r\n", "&lt;") + "<br>");




%>

</body>
</html>








































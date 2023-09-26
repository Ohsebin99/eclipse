<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>

<%@page import="com.tjoeun.mycalendar.MyCalendar"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>만년 달력</title>

<style type="text/css">

	table{
		/* border: 선두께 선종류 선색상 */
		border:0px solid #FFEFD5;
	}
	
tr {
	height: 50px;
	font-family: HY견고딕;
		
}

th {
	font-size: 16pt;
	width: 50px;
	font-family:;
	background-color:	#F0F8FF;
	border-radius: 10px;
		
}

th#title {
	font-size: 25pt;
	font-family: 문체부 훈민정음체;
	font-weight: bold;
	color:#191970;
	background-color:	#F0F8FF;
	border-radius: 10px;
}

th#sun {
	color: red;
}

th#satur {
	color: blue;
}

td {
	text-align: right;
	vertical-align: top;
	border: 1px solid black;
	border-radius: 10px;
}

td.sun {
	color: red;
}

td.sat {
	color: blue;
}
td#beforesun {
	color: red;
	font-size: 10pt; 
	background-color:#DCDCDC;
}

td.before {
	color: black;
	font-size: 10pt; 
	background-color:#DCDCDC;
}
td#beforesat2 {
	color: blue;
	font-size: 10pt; 
	background-color:#DCDCDC;
}

td.before2 {
	color: black;
	font-size: 10pt; 
	background-color:#DCDCDC;
}




/*
	하이퍼링크 스타일 지정하기
	link: 1번도 클릭하지 않은 하이퍼링크
	visited: 1번 이상 클릭한 하이퍼링크
	hover: 하이퍼링크에 마우스를 올리고 있을 때
	active: 하이퍼링크를 마우스로 누르고 있을때
	
	
	a:link {
		color: black;
		text-decoration: none;
	}
	a:visited {
		color: black;
		text-decoration: none;
	}
	
	
	a:link,a:visited {
		color: black;
		text-decoration: none;
	}
	*/
a {
	color: black;
	text-decoration: none;
}

a:hover {
	color: #778899;
	text-decoration: none;
}

a:active {
	color: dodgerblue;
	text-decoration: none;
}

.button {
	background-color: #F0F8FF; 
	border: none;
	color: white;
	padding: 13px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 25px;
	margin: 0;
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: #F0F8FF;
	color: black;
	border: 2px solid #F0F8FF;
}

.button1:hover {
	background-color: #FFE4B5;
	color: black;
}

.button2 {
	background-color: #F0F8FF;
	color: black;
	border: 2px solid #F0F8FF;
}

.button2:hover {
	background-color: #FFE4B5;
	color: black;
}
.button5 {border-radius: 12px;}

td#choice{
	text-align: left;
	vertical-align: middle;
}
td.holiday{
	color: white;
	background-color: red;
	font-weight: bold;
}

	.select{
		width: 60px;
		heught: 30px;
	}
	
	span{
	font-size: 8pt;
	}
	td.birthday{
		background-color:#98FB98;
	}
	

</style>


</head>
<body>

<%
//	달력 메소드 테스트

// 컴퓨터 시스템의 년, 월을 얻어온다.
//	Date date = new Date();
//	int year = date.getYear() + 1900;
//	int month = date.getMonth() + 1;
Calendar calendar = Calendar.getInstance();
int year = calendar.get(Calendar.YEAR);
int month = calendar.get(Calendar.MONTH) + 1;
//	out.println(year+"년"+ month +"월");

//	이전달, 다음달 하이퍼링크 또는 버튼을 클리갛면 GET 방식으로 넘어오는 달력을 출력할 년, 월을 받는다.
//	달력이 최초로 실행되면 이전 페이지가 존재하지 않기 때문에 넘어오는 데이터가 없으므로 year와month가
//	null이므로 NumberFormatException이 발생된다. => 예외 처리를 해야한다.
try {
	year = Integer.parseInt(request.getParameter("year"));
	month = Integer.parseInt(request.getParameter("month"));

	if (month <= 0) {
		year--;
		month = 12;
	} else if (month >= 13) {
		year++;
		month = 1;
	}
} catch (NumberFormatException e) {
	
}
%>

<table width="500" border="1" align="center" cellpadding="5" cellspacing="2">
	<tr>
		<th>
			<!-- 
			<a> 태그가 설정된 문자열을 클릭하면 href 속성에 지정된 곳으로 이동한다.
			href 속성에 "#" 뒤에 id(해시)를 지정하면 현재 문서에서 id가 지정된 요소로 이동(책갈피)하고
			url(주소)이 지정되면 지정된 url로 페이지를 이동한다.
			"?"뒤에 이동하는 페이지로 전달할 데이터를 넘겨주는데 이 때 넘겨줄 데이터가 2건 이상이라면
			데이터와 데이터 사이에 "&"를 넣어서 구분한다.
			"?"뒤에는 절대로 띄어쓰기를 하면 안된다.
			 -->
		
		
			<%-- <a href="?year=<%=year%>&month=<%=month - 1%>">이전달</a> --%>
			<input  class="button button1 button5 " type="button" value="↶" 
				onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'"> 
		</th>
		<th id="title" colspan="5">
		<%=year%>년 <%=month%>월
		</th>
		<th>
			<%-- <a href="?year=<%=year%>&month=<%=month + 1%>">다음달</a> --%>
			<button class="button button2 button5" type="button" 
			onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'"> 
			↷
			</button> 
			
		</th>
	</tr>
	<tr>
		<th id="sun">일</th>
		<th>월</th>
		<th>화</th>
		<th>수</th>
		<th>목</th>
		<th>금</th>
		<th id="satur">토</th>
	</tr>
	<!-- 달력에 날짜를 출력한다 -->
	<tr align="center">
	
<%
// 1일이 출력될 위치(요일)을 맞추기 위해 달력을 출력할 달 1일의 요일만큼 반복하며 전달 날짜를 출력한다.
//	for(int i =0;i < MyCalendar.weekDay(year, month, 1); i++){
//		out.println("<td></td>");
//	}
	
	int week = MyCalendar.weekDay(year, month, 1);
	int start;
	if(month == 1) {
		start = 31 - week;
	}else {
		start = MyCalendar.lastDay(year, month -1) - week; 
	}
	for(int i =0;i < week; i++){
		if(i == 0){
			out.println("<td id='beforesun'>" + (month == 1 ? 12 : month - 1)+ "/" + ++start + "</td>");
			
		}else{
			out.println("<td class='before'>" + (month == 1 ? 12 : month - 1)+ "/" + ++start + "</td>");
			
		}
	}

//	1일부터 달력을 출력할 달의 마지막 날짜까지 반복하며 날짜를 출력
 	for(int i=1; i<=MyCalendar.lastDay(year, month); i++) {
 		
 		
 		// 대체 공휴일
 		// 삼일절, 어린이날, 광복절, 개천절, 한글날, 설날, 추석, 석가탄신일이 토요일 또는
 		// 일요일과 겹치는 경우 그 다음 첫번째 비 공휴일을 대체 공휴일로 한다.
 		boolean flag0301 = false;
 		int subHoliday0301 = 0;
 		if(MyCalendar.weekDay(year, 3, 1) == 6){
 			flag0301 = true;
 			subHoliday0301 = 3;
 		}else if(MyCalendar.weekDay(year, 3, 1) == 0){
 			flag0301 = true;
 			subHoliday0301 = 2;
 		}
 		
 		boolean flag0505 = false;
 		int subHoliday0505 = 0;
 		if(MyCalendar.weekDay(year, 5, 5) == 6){
 			flag0505 = true;
 			subHoliday0505 = 7;
 		}else if(MyCalendar.weekDay(year, 5, 5) == 0){
 			flag0505 = true;
 			subHoliday0505 = 6;
 		}
 		
 		boolean flag0606 = false;
 		int subHoliday0606 = 0;
 		if(MyCalendar.weekDay(year, 6, 6) == 6){
 			flag0606 = true;
 			subHoliday0606 = 8;
 		}else if(MyCalendar.weekDay(year, 6, 6) == 0){
 			flag0606 = true;
 			subHoliday0606 = 7;
 		}
 		
 		boolean flag0815 = false;
 		int subHoliday0815 = 0;
 		if(MyCalendar.weekDay(year, 8, 15) == 6){
 			flag0815 = true;
 			subHoliday0815 = 17;
 		}else if(MyCalendar.weekDay(year, 8, 15) == 0){
 			flag0815 = true;
 			subHoliday0815 = 16;
 		}
 		
 		boolean flag1003 = false;
 		int subHoliday1003 = 0;
 		if(MyCalendar.weekDay(year, 10, 3) == 6){
 			flag1003 = true;
 			subHoliday1003 = 5;
 		}else if(MyCalendar.weekDay(year, 10, 3) == 0){
 			flag1003 = true;
 			subHoliday1003 = 4;
 		}
 		
 		boolean flag1009 = false;
 		int subHoliday1009 = 0;
 		if(MyCalendar.weekDay(year, 10, 9) == 6){
 			flag1009 = true;
 			subHoliday1009 = 11;
 		}else if(MyCalendar.weekDay(year, 10, 9) == 0){
 			flag1009 = true;
 			subHoliday1009 = 10;
 		}
 		
 		boolean flag1225 = false;
 		int subHoliday1225 = 0;
 		if(MyCalendar.weekDay(year, 12, 25) == 6){
 			flag1225 = true;
 			subHoliday1225 = 27;
 		}else if(MyCalendar.weekDay(year, 12, 25) == 0){
 			flag1225 = true;
 			subHoliday1225 = 26;
 		}
 		
 		
 		// 앙력 공휴일 
 		if(month == 1 && i == 1){
 			out.println("<td class='holiday'>" + i +"<br><span>신정</span></td>");
 		}else if(month == 3 && i == 1){
 			out.println("<td class='holiday'>" + i +"<br><span>삼일절</span></td>");
 		}else if(month == 5 && i == 1){
 			out.println("<td class='holiday'>" + i +"<br><span>근로자의날</span></td>");
 		}else if(month == 5 && i == 5){
 			out.println("<td class='holiday'>" + i +"<br><span>어린이날</span></td>");
 		}else if(month == 6 && i == 6){
 			out.println("<td class='holiday'>" + i +"<br><span>현충일</span></td>");
 		}else if(month == 8 && i == 15){
 			out.println("<td class='holiday'>" + i +"<br><span>광복절</span></td>");
 		}else if(month == 10 && i == 3){
 			out.println("<td class='holiday'>" + i +"<br><span>개천절</span></td>");
 		}else if(month == 10 && i == 9){
 			out.println("<td class='holiday'>" + i +"<br><span>한글날</span></td>");
 		}else if(month == 12 && i == 25){
 			out.println("<td class='holiday'>" + i +"<br><span>크리스마스</span></td>");
 		}else if(month == 6 && i == 9){
 			out.println("<td class='birthday'>" + i +"<br><span>내 생일</span></td>");
 		}
		// 대체 공휴일 		
 		else if(flag0301 && month == 3 && i == subHoliday0301){
 			out.println("<td class='holiday'>" + i +"<br><span>대체공휴일</span></td>");
 		}else if(flag0505 && month == 5 && i == subHoliday0505){
 			out.println("<td class='holiday'>" + i +"<br><span>대체공휴일</span></td>");
 		}else if(flag0606 && month == 6 && i == subHoliday0606){
 			out.println("<td class='holiday'>" + i +"<br><span>대체공휴일</span></td>");
 		}else if(flag0815 && month == 8 && i == subHoliday0815){
 			out.println("<td class='holiday'>" + i +"<br><span>대체공휴일</span></td>");
 		}else if(flag1003 && month == 10 && i == subHoliday1003){
 			out.println("<td class='holiday'>" + i +"<br><span>대체공휴일</span></td>");
 		}else if(flag1009 && month == 10 && i == subHoliday1009){
 			out.println("<td class='holiday'>" + i +"<br><span>대체공휴일</span></td>");
 		}else if(flag1225 && month == 12 && i == subHoliday1225){
 			out.println("<td class='holiday'>" + i +"<br><span>대체공휴일</span></td>");
 		}
 		else{
 			
 		/*
 		// <td> 태그에 요일에 따른 class 속성을 지정한다.
 		if(MyCalendar.weekDay(year, month, i) == 0){ // 일요일?
 			out.println("<td class='sun'>" + i +"</td>");
 		}else if(MyCalendar.weekDay(year, month, i) == 6){ // 토요일?
 			out.println("<td class='sat'>" + i +"</td>");
 		}else{ // 평일
 			out.println("<td>" + i +"</td>");
 		}
 		*/
 		switch(MyCalendar.weekDay(year, month, i)){
 			case 0:
 				out.println("<td class='sun'>" + i +"</td>");
 				break;
 			case 6:
 				out.println("<td class='sat'>" + i +"</td>");
 				break;
 			default:
 				out.println("<td>" + i +"</td>");
 				break;
 		}
 	
 	}

	// 출력한 날짜(i)가 토요일이고 그 달의 마지막 날짜가 아니면 줄을 바꾼다.
	if(MyCalendar.weekDay(year, month, i) == 6 && i !=MyCalendar.lastDay(year, month)){
		out.println("</tr><tr>");
	}
	
 	}
 	 week = MyCalendar.weekDay(year, month, MyCalendar.lastDay(year, month)) + 1;
	 start = 0;
	 if(week !=0){
	for(int i=week; i<=6; i++) {
		if(i == 6){
			out.println("<td id='beforesat2'>" + (month == 12 ? 1 : month + 1)+ "/" + ++start + "</td>");
			
		}else{
			out.println("<td class='before2'>" + (month == 12 ? 1 : month + 1)+ "/" + ++start + "</td>");
	 }
			
		}
}
	
%>

	</tr>
	<!-- 년, 월을 선택하고 보기 버튼을 클릭하면 선택된 달의 달력으로 한번에 넘어가게 한다. -->
	<tr>
		<td id="choice" colspan = "7">
		<form action="?">
		<fieldset style="width: 70px; display:inline;">
			<legend>년</legend>
			<select class="select" name="year">
			
<%
	
	for(int i=1900; i<=2100; i++){
		if(calendar.get(Calendar.YEAR) == i){
			out.println("<option selected='selected'>" + i +"</option>");
		}else{
			out.println("<option>" + i +"</option>");
		}
	}
%>
			</select>
		</fieldset>
		<fieldset style="width: 70px; display:inline;">
			<legend>월</legend>
			<select class="select" name="month">
			
<% 
	for(int i=1; i<=12; i++){
		if(calendar.get(Calendar.MONTH) + 1 == i){
			out.println("<option selected='selected'>" + i +"</option>");
		}else{
			out.println("<option>" + i +"</option>");
		}
	}

%>
			
			</select>
		</fieldset>
		<input class="select" type="submit" value="보기"/>
	</form>
		</td>
	</tr>
</table>

</body>
</html>



























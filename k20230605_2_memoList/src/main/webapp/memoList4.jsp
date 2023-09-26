<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.tjoeun.memoList.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출첵 게시판</title>
<link rel="stylesheet" href="./css/memolist.css">
<style type="text/css">




</style>

</head>
<body>

<!-- 입력 화면 시작 -->
<form action="memoInsert.jsp" method="post">
	<table width="1000" align="center" border="1" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="3">☆★ 출첵 게시판 ★☆</th>
		</tr>
		<tr>
			<th width="100">이름</th>
			<th width="100">비밀번호</th>
			<th width="800">메모</th>
		</tr>
		<tr>
			<td align="center">
				<input type="text" name="name" style="width: 90%; height: 25px;"/>
			</td>
			<td align="center">
				<input type="text" name="password" style="width: 90%; height: 25px;"/>
			</td>
			<td align="center">
				<input type="text" name="memo" style="width: 92%; height: 25px;"/>
				<input type="submit" value="저장" style="height: 28px;"/>
			</td>
		</tr>
	</table>
</form>
<!-- 입력 화면 끝 -->

<br/>
<hr size="3" color="dodgerblue"/>
<br/>

<!-- 테이블에 저장된 글 목록 전체를 글번호(idx)의 내림차순(최신글 부터)으로 얻어온다. -->
<%
	int pageSize = 10; // 페이지당 표시하려는 글의 개수 
	int totalCount = 0; // 테이블에 저장된 전체 글의 개수
	int totalPage = 0; // 전체 페이지 개수
	int currentPage = 1; // 현재 브라우저에 표시되는 페이지 번호
	int startNo = 0; // 현재 브라우저에 표시되는 글의 시작 인덱스 번호 => mesql은 인덱스가 0부터 시작한다
	int endNo = 0; // 현재 브라우저에 표시되는 글의 마지막 인덱스 번호, mysql에서는 사용하지 않는다.
	int startPage = 0; // 페이지 이동 하이퍼링크 또는 버튼에 표시될 시작 페이지 번호
	int endPage = 0; // 페이지 이동 하이퍼링크 또는 버튼에 표시될 마지막 페이지 번호
	
//	=============================================================================================	
//  페이지당 표시할 글의 개수를 받아 pageSize 변수에 저장한다.
//	게시판이 최초로 실행될 때 이전 페이지가 없으므로 넘어오는 pageSize 값이 null이고 보기 버튼 이외의
//	다른 버튼이 클릭되면 pageSize가 넘어오지 않기 때문에 역시 null이 된다. => 예외 처리를 한다.
	try{
    pageSize = Integer.parseInt(request.getParameter("pageSize")); 
    //	화면에 표시할 글의 개수가 정상적으로 넘어왔으므로 화면에 표시할 글의 개수를 세션에 저장한다.
    session.setAttribute("pageSize", pageSize + "");
	} catch(NumberFormatException e){
	//	보기 버튼을 제외한 나머지 버튼은 pageSize를 전달하는 기능이 없기 때문에 NumberFormatException이
	//	발생되서 이곳으로 오게된다.
	//	이전 페이지에서 넘어오는 pageSize가 null이면 세션에 저장해둔 pageSize를 얻어와서 화면에 표시할
	//	글의 개수로 지정한다.
	//	브라우저가 최초로 실행될 때 세션이 만들어지기 때문에 브라우저가 최초로 실행되면 이전 페이지에서
	//	넘어오는 pageSize도 null이고 세션에 저장된 pageSize도 null이다.
	String temp = (String) session.getAttribute("pageSize");
	if(temp != null) {
		pageSize = Integer.parseInt(temp);
	}
	
	}
//	=============================================================================================	


	Connection conn = DBUtil.getMysqlConnection();
	
	String cnt = "SELECT COUNT(*) FROM memolist;";
	PreparedStatement pstmt2 = conn.prepareStatement(cnt);
	ResultSet rs1 = pstmt2.executeQuery();
	
	
	rs1.next();
	totalCount = rs1.getInt(1);
	totalPage = (totalCount - 1) / pageSize + 1;
	
	
	try{
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
		currentPage = currentPage > totalPage ? totalPage : currentPage; 
	}catch(NumberFormatException e){
		
	}

	startNo = (currentPage - 1) * pageSize;

	endNo = startNo + pageSize - 1;
	endNo = endNo < totalCount ? totalCount : endNo;
	
	String sql = "SELECT * FROM memolist ORDER BY idx DESC limit ?, ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, startNo);
	pstmt.setInt(2, pageSize);
	ResultSet rs = pstmt.executeQuery();
%>

<!-- 테이블에서 얻어온 글 목록을 출력한다. -->
<table width="1300" align="center" border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th width="80">글번호</th>
		<th width="80">이름</th>
		<th width="840" style="background-color: ">메모</th>
		<th width="120">작성일</th>
		<th width="80">ip</th>
		<th width="100">&nbsp;</th>
	</tr>
	
	<tr>
      <td colspan="3">
         
         <!-- 한 페이지에 표시할 글의 개수를 변경한다. -->
         <form action="?" method="post">
         페이지당 표시할 글의 개수를 선택하세요.
           <select name="pageSize" style="width:70px; height: 25px;">
               <option>3</option>
               <option>5</option>
               <option selected="selected">10</option>
               <option>15</option>
               <option>20</option>
            </select> 
            <input type="submit" value="보기"/>
            
            
           <!-- <input name="pageSize" type="radio" value="3"/> 3
           <input name="pageSize" type="radio" value="5"/> 5
           <input selected="selected" name="pageSize" type="radio" value="10"/> 10
           <input name="pageSize" type="radio" value="15"/> 15
           <input name="pageSize" type="radio" value="20"/> 20 -->
         </form>
      </td>
      <td colspan="3" align="right">
         <%=totalCount%>(<%=currentPage%> / <%=totalPage%>) 
      </td>
   </tr>
<%
	if(rs.next()) {
		SimpleDateFormat sdf =  new SimpleDateFormat("yyyy.MM.dd(E)");
		do {
%>
	<tr>
		<td align="center"><%= rs.getInt("idx")%></td>
		<td align="center"><%= rs.getString("name").replace("<", "&lt;").replace(">", "&gt;")%></td>
		<td><%= rs.getString("memo").replace("<", "&lt;").replace(">", "&gt;")%></td>
		<td align="center"><%=sdf.format(rs.getTimestamp("writeDate"))%></td>
		<td><%= rs.getString("ip")%></td>
		
		<!-- 수정, 삭제 버튼 추가 -->
		<td align="center">
			<span type="button" class="span"
				onclick="location.href='memoUpdate.jsp?idx=<%= rs.getInt("idx")%>&currentPage=<%=currentPage%>'">
				수정</span>
			<span type="button" class="span"
				onclick="location.href='memoDelete.jsp?idx=<%= rs.getInt("idx")%>&currentPage=<%=currentPage%>'">
				삭제</span>
		</td>
	</tr>
<%
		} while (rs.next());
	}else {
	
%>
	<tr>
		<td colspan="6">
			<marquee>데이터 없음</marquee>
		</td>
	</tr>

<%
	}
%>
	
	<!-- 6. 첫 페이지부터 마지막 페이지까지 이동할 수 있는 하이퍼링크 또는 버튼을 만든다. -->
	<tr>
		<td colspan="6" align="center">
			<!-- 10 페이지 단위로 페이지 이동 버튼을 추가한다. -->
			
<%
//	페이지 이동 버튼의 시작 페이지 번호와 마지막 페이지 번호를 계산한다.
	startPage = (currentPage - 1) / 10 * 10 + 1;
	endPage = startPage + 9;
//	페이지 이동 버튼의 마지막 페이지 번호가 전체 페이지 개수보다 커지면 존재하지 않는 페이지 번호가
//	표시되므로 페이지 마지막 페이지 번호(endPage)를 전체 페이지 번호로 수정
	endPage = endPage > totalPage ? totalPage : endPage;
	
//	처음으로
//	currentPage가 1보다 크다면 
	if(currentPage > 1) {
%>	
	<span class="btn"
			title="첫 페이지로 이동"
			    onclick="location.href='?currentPage=1'">
			    처음</span>
<% 		
	}else {
%>
	
<%		
	}
	
	
	if (startPage > 1) {
%>
		<span class="btn" 
				title="이전 페이지"
			    onclick="location.href='?currentPage=<%=currentPage-10%>'">
			    이전 페이지</span>
<%
	}else {
%>
		
<%
	}
%>		
<%
	for (int i=startPage; i<=endPage; i++) {
		if (i == currentPage){


		out.println("<span id='num'>" + i + "</span>");
		

		}else {

		out.println("<span  title='" + i + 
				" 페이지로 이동합니다.' onclick='location.href=\"?currentPage=" + i + "\"'>" 
					+ i + "</span>");

		}
	}
%>
<%
	if (endPage < totalPage) {
%>
		<span  class="btn"
				title="다음 페이지"
			    onclick="location.href='?currentPage=<%=currentPage+10%>'">
			    다음 페이지</span>
	
<%
	}else {
%>
		
<%
	}



	if(currentPage < totalPage){
%>
		<span class="btn"
			title="마지막 페이지로 이동"
			    onclick="location.href='?currentPage=<%=totalPage%>'">
			    마지막</span>
<% 
	}else {
%>		
	
<% 
	}
%>

			
		</td>
	</tr>
	
	
</table>

</body>
</html>

















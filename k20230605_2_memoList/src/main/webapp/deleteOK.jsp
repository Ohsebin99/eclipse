<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.tjoeun.memoList.DBUtil"%>
<%@page import="java.sql.Connection"%>
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
//   memoDelete.jsp에서 넘어오는 삭제할 글번호(idx), 돌아갈 페이지 번호(currentPage), 삭제하기 위해
//   입력한 비밀번호(password)를 받는다.
	int idx = Integer.parseInt(request.getParameter("idx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	String password = request.getParameter("password");
	
//	삭제하기 위해 입력한 비밀번호와 삭제할 글의 비밀번호를 비교하기 위해 삭제할 글을 얻어온다.
	Connection conn = DBUtil.getMysqlConnection();
	String sql = "SELECT * FROM memolist WHERE idx = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, idx);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
//	삭제하기 위해 입력한 비밀번호(password)와 삭제할 글의 비밀번호(rs.getString("password"))를 비교해서
//	일치하면 글을 삭제한다.
	out.println("<script>");
	if (password.equals(rs.getString("password"))) {
		sql = "delete from memolist where idx = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
		
		out.println("alert('" + idx + " 번 글 삭제완료!!!')");
	}else {
		
		out.println("alert('비밀번호가 틀림')");
	}
	DBUtil.close(conn);

//	memoList4.jsp로 돌려보낸다.
		out.println("location.href='memoList4.jsp?currentPage=" + currentPage + "'");
		out.println("</script>");
%>


</body>
</html>























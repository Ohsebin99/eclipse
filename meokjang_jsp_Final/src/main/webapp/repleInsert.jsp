<%@page import="meokjang.vo.RepleVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fmt:requestEncoding value="UTF-8"/>
<jsp:useBean id="ro" class="meokjang.vo.RepleVO">
   <jsp:setProperty property="*" name="ro"/>
</jsp:useBean>
<c:set var="currentPage" value="${param.currentPage}" />
<c:out value="${currentPage}"/>
${ro}
${mo}

<form action="repleInsertOK.jsp" method="post">
	<textarea name="reple" rows="3"	style="resize: none;"></textarea>
	<input type="submit" value="댓글저장"/>
	<input type="reset" value="다시쓰기"/>
	<input type="hidden" name="repleIp" value="${pageContext.request.remoteAddr}"/>		
	<input type="hidden" name="repleID" value="${mo.ID}"/>	
	<input type="hidden" name="masterID" value="${vo.ID}"/>	
	<input type="hidden" name="originIdx" value="${vo.idx}"/>	
	<input type="hidden" name="currentPage" value="${currentPage}"/>	
</form>

</body>
</html>
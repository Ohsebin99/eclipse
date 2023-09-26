<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 체크</title>

<script type="text/javascript" src="../js/password.js"></script>
</head>
<body>
<form action="passwordChangeOK.jsp" method="post" onsubmit="return passwordCheck()">
	<input type="text" placeholder="현재 비밀번호" name="passwordChk"/><br/>
	<input type="text" placeholder="변경할 비밀번호" name="password"/><br/>
	<input type="text" placeholder="비밀번호 확인" name="password2"/><br/>
	<input type="text" name="originPassword" value="${mo.password}"><br/>
	<input type="text" name="ID" value="${mo.ID}">
	<input type="submit" value="비밀번호 변경"/>
</form>
</body>
</html>
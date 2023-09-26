<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인글 쓰기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/freeboard.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<form class="m-3" action="insertOK.jsp" method="post" >
	<table class="table" style="width: 700px; margin-left: auto; margin-right: auto; border: 1px solid black;">
		<tr class="table-info">
			<th colspan="3" style="font-size: 30px; text-align: center;">메인글 쓰기</th>
		</tr>
		<tr>
			<th class="align-middle table-success"  style="font-size: 18px; text-align: center;">
			<label for="name">이름</label>
			</th>
			<td width="500">
				<input id="name" class="form-control form-control-sm" type="text" name="name"
					style="width: 200px"/>
			</td>
			<th class="align-middle table-danger" style="font-size: 18px; text-align: center;">
				<label for="notice">공지글 &nbsp;</label>
				<input  id="notice" class="form-check-input" type="checkbox" name="notice"/>
			</th>
		</tr>
		<tr>
			<th class="align-middle table-success"
				width="100"
				style="font-size: 18px; text-align: center;">
			<label for="password">비밀번호</label>
			</th>
			<td colspan="2">
				<input id="password" class="form-control form-control-sm" type="password" name="password"
					style="width: 200px"/>
			</td>
		<tr>
			<th class="align-middle table-success" style="font-size: 18px; text-align: center;">
			<label for="subject">제목</label>
			</th>
			<td colspan="3">
				<input id="subject"
					   class="form-control form-control-sm"
					   type="text"
					   name="subject"/>
			</td>
		</tr>
		<tr>
			<th class="align-middle table-success" width="100" style="font-size: 18px; text-align: center;">
			<label for="content">내용</label>
			</th>
			<td colspan="3">
				<textarea id="content"
						  class="form-control form-control-sm"
						  rows="10"
						  name="content"
						  style="resize: none;"></textarea>
			</td>
		</tr>
		<tr class="table-secondary">
			<td colspan="3" align="center" width="100">
			<input class="btn  btn-sm" type="submit" value="저장하기">
			<input class="btn btn-sm" type="submit" value="다시쓰기">
			<input class="btn  btn-sm" type="submit" value="돌아가기" onclick="history.back()"/>
		</tr>
	</table>
	<!-- 작성자 ip 주소는 hidden으로 insertOK.jsp로 넘긴다. -->
	<input type="hidden" name="ip" value="${pageContext.request.remoteAddr}">
</form>

</body>
</html>
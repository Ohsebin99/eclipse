<%@page import="com.tjoeun.vo.FreeboardVO"%>
<%@page import="com.tjoeun.service.FreeboardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/freeboard.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- bootstrap icon -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  
  <script type="text/javascript" src="./js/setting.js" defer="defer"></script>
</head>
<body>





<div class="m-3">
	<table class="table" style="width: 700px; margin-left: auto; margin-right: auto; border: 1px solid black;">
		<tr class="table2">
		<tr style="background-color: #eafdc8;">
			<td colspan="4" style="font-size: 30px; text-align: center">게시글 보기</td>
		</tr>	
		<tr style="background-color: #d4fbb6;">
			<td style="width: 100px; text-align: center;">글번호</td>
			<td style="width: 350px; text-align: center;">이름</td>
			<td style="width: 150px; text-align: center;">작성일</td>
			<td style="width: 100px; text-align: center;">조회수</td>
		</tr>
		
		<tr>
			<td align="center">${vo.idx}</td>
		<td align="center">
			<c:set var="name" value="${fn:replace(vo.name, '<', '&lt;') }"></c:set>
			<c:set var="name" value="${fn:replace(name, '>', '&gt;' )}"></c:set>
			${name}
			
		</td >
		<td align="center">
			<jsp:useBean id="date" class="java.util.Date"/>
		<c:if test="${date.year == vo.writedate.year && date.month == vo.writedate.month && 
								date.date == vo.writedate.date}">
								<fmt:formatDate value="${vo.writedate}" pattern="a h:mm:ss"/>
					</c:if>
						<c:if test="${date.year != vo.writedate.year || date.month != vo.writedate.month || 
								date.date != vo.writedate.date}">
								<fmt:formatDate value="${vo.writedate}" pattern="yyyy.MM.dd(E) "/>
					</c:if>
			</td>
			<td align="center">
			${vo.hit}
			</td>
		</tr>
		<tr>
			<th class="align-middle">제목</th>
			<td colspan="3">
				<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
				${subject}
			</td>
		</tr>
		<tr>
			<th class="align-middle">내용</th>
			<td colspan="3">
				<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, 'enter', '<br/>')}"></c:set>
				${content}
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center">
					<input class="btn align-height btn-sm" 
					   id="write"
					   type="button"
					   value="수정"
					   style="font-size: 15px; line-height: 20px;"
					   onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=update'">
					   
					<input class="btn align-height btn-sm" 
					   id="write"
					   type="button"
					   value="삭제"
					   style="font-size: 15px; line-height: 20px;"
					   onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=delete'">
					   
					<input class="btn align-height btn-sm" 
					   id="write"
					   type="button"
					   value="뒤로"
					   style="font-size: 15px; line-height: 20px;"
					   onclick="location.href='list.jsp?&currentPage=${currentPage}'">
			</td>
		</tr>
		
				
	</table>
</div>

<hr style="color: red; width: 700px; margin-left: auto; margin-right: auto;"/>


<form  class="m-3" action="commentOK.jsp" method="post" name="commentForm">
	<table class="table" style="width: 700px; margin-left: auto; margin-right: auto; border: 1px solid black;">
		<tr style="background-color: #eafdc8;">
			<td colspan="4" style="font-size: 30px; text-align: center">댓글 보기</td>
		</tr>
		
		<tr>
			<td colspan="4">
				idx : <input type="text" name="idx" value="${vo.idx}" size="1"/>
				
				gup : <input type="text" name="gup" value="${vo.idx}" size="1"/>
				
				mode : <input type="text" name="mode" value="1" size="1"/>
				
				currentPage : <input type="text" name="currentPage" value="${currentPage}" size="1"/>
				
				ip : <input type="text" name="ip" value="${pageContext.request.remoteAddr}"/>
			</td>
		</tr>
		
		<tr>
			<th class="align-middle" style="width: 100px; text-align: center;">
				<label for="name">이름</label>
			</th>
			<td style="width: 250px;">
				<input id="name" class="form-control form-control-sm" type="text" name="name">
			</td>
			<th class="align-middle" style="width: 100px; text-align: center;">
				<label for="password">비밀번호</label>
			</th>
			<td style="width: 250px;">
				<input id="password" class="form-control form-control-sm" type="password" name="password">
			</td>
		</tr>
		<tr>
			<th class="align-middle" style="width: 100px; text-align: center;">
				<label for="content">내용</label>
			</th>
			<td colspan="3" style="width: 600px;">
				<textarea id="content" 
						  class="form-control form-control-sm"
						  rows="3"
						  name="content"
						  style="resize: none;"></textarea>
			</td>
		</tr>
		
		<tr class="table-info">
			<td colspan="4" align="center">
				<input 
					class="btn btn-outline-primary btn-sm"
					type="submit"
					value="댓글저장"
					style="font-size: 13px;"
					name="commentBtn"/>
				<input 
					class="btn btn-outline-danger btn-sm"
					type="button"
					value="다시쓰기"
					style="font-size: 13px;"
					onclick="setting(0, 1, '댓글저장', '', '')"/>
			</td>
		</tr>
		<c:set var="comment" value="${freeboardCommentList.list}"></c:set>
		
		<c:if test="${comment.size() == 0}">
		<tr>
			<td colspan="4">
				<marquee>댓글이 없습니다.</marquee>
			</td>
		</tr>
		</c:if>
		<c:if test="${comment.size() != 0}">
		<c:forEach var="co" items="${comment}">
		<tr>
			<td colspan="4">
				${co.idx}.
				<c:set var="name" value="${fn:replace(co.name, '<', '&lt;') }"></c:set>
				<c:set var="name" value="${fn:replace(name, '>', '&gt;' )}"></c:set>
				${name} 님이
				<fmt:formatDate value="${vo.writedate}" pattern="yyyy.MM.dd(E) HH:mm:ss"/> 에 남긴글<br/>
				
				<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"></c:set>
				<c:set var="content" value="${fn:replace(content, 'enter', '<br/>')}"></c:set>
				${content}
				<br/>
				<div align="right">
					<input class="btn align-height btn-sm" 
					   id="write"
					   type="button"
					   value="수정"
					   style="font-size: 15px; line-height: 20px;"
					   onclick="setting(${co.idx}, 2, '댓글수정', '${name}', '${content}')"/>
					   
					<input class="btn align-height btn-sm" 
					   id="write"
					   type="button"
					   value="삭제"
					   style="font-size: 15px; line-height: 20px;"
					   onclick="setting(${co.idx}, 3, '댓글삭제', '${name}', '${content}')"/>
				</div>
			</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
</form>












</body>
</html>
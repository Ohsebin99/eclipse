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
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/freeboard.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <!-- bootstrap icon -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style type="text/css">
  
  
  </style>
</head>
<body>
	<%-- ${freeboardList} --%>


<div class="m-3">
	<table class="table" style="width: 1000px; margin-left: auto; margin-right: auto; border: 1px solid black;">
		<tr class="table2">
		<th colspan="5" style="font-size: 30px; text-align: center;">게시판 보기</th>
		</tr>
		<tr style="background-color: #eafdc8;">
			<td colspan="5" align="right">
				글 개수: ${freeboardList.totalCount} / 현재 페이지: ${freeboardList.currentPage} / 전체 페이지: ${freeboardList.totalPage})
			</td>
		</tr>	
		<tr style="background-color: #d4fbb6;">
			<td style="width: 70px; text-align: center;">글번호</td>
			<td style="width: 70px; text-align: center;">제목</td>
			<td style="width: 100px; text-align: center;">이름</td>
			<td style="width: 150px; text-align: center;">작성일</td>
			<td style="width: 70px; text-align: center;">조회수</td>
		</tr>	
		
		<!-- 오늘 날짜를 기억하는 Date 클래스 객체를 useBean으로 만든다. -->
		<jsp:useBean id="date" class="java.util.Date"/>
		
		
		<!-- 공지글을 출력한다. -->
		<c:if test="${currentPage == 1}">
		<c:forEach var="vo" items="${notice}">
			<tr class="table-warning">
				<td align="center">
					<img src="./images/notice.png"/>
				</td>
				<td>
					<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
					<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
					<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}" style=" color: black">
					${vo.subject}(${vo.commentCount})</a>
					
				</td>
				<td align="center">
					${vo.name}
				</td >
				<td align="center">
					<!-- 오늘 입력된 글은 시간만 어제 이전에 입력된 글은 날짜만 출력한다. -->
						<c:if test="${date.year == vo.writedate.year && date.month == vo.writedate.month && 
								date.date == vo.writedate.date}">
								<fmt:formatDate value="${vo.writedate}" pattern="a h:mm:ss"/>
					</c:if>
						<c:if test="${date.year != vo.writedate.year || date.month != vo.writedate.month || 
								date.date != vo.writedate.date}">
								<fmt:formatDate value="${vo.writedate}" pattern="yyyy.MM.dd(E) "/>
					</c:if>
					
				</td>
				<td align="center">${vo.hit}</td>
			</tr>
		</c:forEach>
		</c:if>
		<c:set var="list" value="${freeboardList.list}"/>
		
		<c:if test="${list.size() == 0}">
		<tr>
			<td colspan="5">
				<marquee>테이블에 저장된 글이 없습니다.</marquee>
			</td>
			<td align="center">
					<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
					<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
					<c:if test="${date.year != vo.writedate.year || date.month != vo.writedate.month || 
								date.date != vo.writedate.date}">
					
					<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}" style=" color: black">
					${vo.subject}(${vo.commentCount})</a>
					</c:if>
					
				</td>
		</tr>
		</c:if>
		
		<c:if test="${list.size() != 0}">
		<c:forEach var="vo" items="${list}">
			<tr style="background-color: #fbecb6;">
				<td align="center">
					${vo.idx}
				</td>
				<td align="center">
					<!-- 제목에 태그를 적용할 수 없게 한다. -->
					<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"></c:set>
					<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"></c:set>
					<!-- 제목에 하이퍼링크를 걸어준다. -->
					<!-- 하이퍼링크를 클릭하면 조회수를 증가시키고 클릭한 메인글의 내용을 표시한다. -->
					<c:if test="${date.year != vo.writedate.year || date.month != vo.writedate.month || 
								date.date != vo.writedate.date}">
					
					<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}" style=" color: black">
					${vo.subject}(${vo.commentCount})</a>
					</c:if>
					
					
					<!-- 오늘 입력된 글에 new 아이콘 이미지를 표시한다. -->
					<c:if test="${date.year == vo.writedate.year && date.month == vo.writedate.month && 
								date.date == vo.writedate.date}">
							<a href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}" style=" color: red;">
								${vo.subject}(${vo.commentCount})</a>
								<img src="./images/new.png"/>
					</c:if>
					
					<!-- 조회수가 일정 횟수를 넘어가면 hot 아이콘을 표시한다. -->					
				</td>
				<td align="center">
					${vo.name}
				</td >
				<td align="center">
					<!-- 오늘 입력된 글은 시간만 어제 이전에 입력된 글은 날짜만 출력한다. -->
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
					<c:if test="${vo.hit >= 10 }">
						<img src="./images/hot.gif">
						${vo.hit}
					</c:if>
					<c:if test="${vo.hit < 10 }">
					${vo.hit}
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</c:if>
		</table>
		<table  style="width: 1000px; margin-left: auto; margin-right: auto;">
		<tr>
			<td colspan="5" align="center">
			<!-- 처음으로 -->
			<c:if test="${freeboardList.currentPage > 1}">
				<span 
					class='button button1' 
					type="button" 
					title="첫 페이지로 이동합니다." 
					onclick="location.href='?currentPage=1'"
				><i class="bi bi-rewind-fill"></i></span>
			</c:if>
		
			
			<!-- 10페이지 앞으로 -->
			<c:if test="${freeboardList.startPage > 1}">
				<span 
					class='button button1' 
					type="button" 
					title="이전 10페이지로 이동합니다." 
					onclick="location.href='?currentPage=${freeboardList.startPage - 1}'"
				><i class="bi bi-caret-left-fill"></i></span>
			</c:if>
			
			
			<!-- 페이지 이동 버튼 -->
			<c:forEach var="i" begin="${freeboardList.startPage}" end="${freeboardList.endPage}" step="1">
				<c:if test="${freeboardList.currentPage == i}">
					<span class='button button2' style="color: red;" type='button' disabled='disabled'>${i}</span>
				</c:if>
				<c:if test="${freeboardList.currentPage != i}">
					<span 
						class='button button1' 
						type='button' 
						title="${i}페이지로 이동합니다."
						onclick="location.href='?currentPage=${i}'"
					>${i}</span>
				</c:if>
			</c:forEach>
			
			<!-- 10페이지 뒤로 -->
			<c:if test="${freeboardList.endPage < freeboardList.totalPage}">
				<span 
					class='button button1' 
					type="button" 
					title="다음 10페이지로 이동합니다." 
					onclick="location.href='?currentPage=${freeboardList.endPage + 1}'"
				><i class="bi bi-caret-right-fill"></i></span>
			</c:if>
			
			
			<!-- 마지막으로 -->
			<c:if test="${freeboardList.currentPage < freeboardList.totalPage}">
			<span
				class='button btn-sm'  
				type="button" 
				title="마지막 페이지로 이동합니다." 
				onclick="location.href='?currentPage=${freeboardList.totalPage}'"
			><i class="bi bi-fast-forward-fill"></i></span>
			</c:if>
			
			
			
			
		<!-- 글쓰기 버튼 -->
			<span  style="float: right; border: 1px solid gray; height: 28px;" >
		<label for="write"><i class="bi bi-pencil-fill align low" ></i></label>
				<input class="btn align-height btn-sm" 
					   id="write"
					   type="button"
					   value="글쓰기"
					   style="font-size: 15px; line-height: 20px;"
					   onclick="location.href='insert.jsp'">
					   	</span>
			</td>
		</tr>
	</table>
</div>


























</body>
</html>

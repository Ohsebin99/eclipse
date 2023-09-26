<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>			<!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	<!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 글 보기</title>
</head>
<body>

<fmt:requestEncoding value="UTF-8"/>

<form class="m-3" action="partyUpdateOK.jsp" method="post">
	<table width="600" border="1" align="center" cellpadding="5" cellspacing="0">
		<tr>
			<th colspan="2" style="font-size: 30px; text-align: center;">수정할 글 보기</th>
		</tr>
		<tr colspan="2" width="100">
			<img src="./upload/${vo.photo}" align="middle" width="200">
		</tr>
		<tr>
			<th>
				파티 이름
			</th>
			<td>
				<input name="subject" type="text" value="${vo.subject}"/>
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<input name="content" type="text" value="${vo.content}"/>
			</td>
		</tr>
		<tr>
			<th>
				방장 닉네임
			</th>
			<td>
				${vo.nickName}
			</td>
		</tr>
		<tr>
			<th>
				음식 카테고리
			</th>
			<td>
				${vo.category}
			</td>
		</tr>
		<tr>
			<th>
				장소
			</th>	
			<td>
				${vo.place}
			</td>
		</tr>
		<tr>
			<th>
				지역
			</th>
			<td>
				${vo.location}
			</td>
		</tr>
		<tr>
			<th>
				모임 시간
			</th>
			<td>
				<fmt:formatDate value="${vo.mealDate}" pattern="yyyy년 MM월 dd일 HH:mm" />
			</td>
		</tr>
		<tr>
			<th>
				모집 마감
			</th>
			<td>
				<fmt:formatDate value="${vo.limitDate}" pattern="yyyy년 MM월 dd일 HH:mm" />
			</td>
		</tr>
		<tr>
			<th>
				성별
			</th>
			<td>
				${vo.partyGender}
			</td>
		</tr>
		<tr>
			<th>
				음주 여부
			</th>
			<td>
				${vo.acholchk}
			</td>
		</tr>
		<tr>
			<th>
				나이 제한
			</th>
			<td>
				${vo.minLimitAge} ~ ${vo.maxLimitAge}
			</td>
		</tr>
		<tr>
			<th>
				인원 제한
			</th>
			<td>
				${vo.limitNum}
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정하기"/>
				<input type="button" value="돌아가기" onclick="history.back()"/>
				<input type="button" value="목록보기" 
					onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
			</td>
		</tr>
	</table>
	
	<!--  -->
	<input type="hidden" name="idx" value="${vo.idx}"/>
	<input type="hidden" name="currentPage" value="${currentPage}"/>
	
</form>

</body>
</html>
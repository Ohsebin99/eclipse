<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>			<!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	<!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티글 보기</title>

<!-- common -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>			<!-- device-width -->
<link rel="icon" href="images/favicon.png">										<!--  favicon -->
<script type="text/javascript" src="common/jquery-3.7.0.js"></script>			<!-- jQury -->
<link rel="stylesheet" href="common/bootstrap/css/bootstrap.min.css">			<!-- bootstrap -->
<script src="common/bootstrap/js/bootstrap.min.js"></script>					<!-- bootstrap -->
<script src="common/bootstrap/js/popper.min.js"></script>						<!-- bootstrap -->
<script type="text/javascript" src="common/custom.js" defer="defer"></script>	<!-- template -->
<link rel="stylesheet" href="common/style.css"/>								<!-- template -->

<link rel="stylesheet" href="common/owl-carousel/owl.carousel.min.css">			<!-- Slick Carousel -->
<link rel="stylesheet" href="common/owl-carousel/owl.theme.default.min.css">	<!-- Slick Carousel -->
<link rel="stylesheet" href="common/magnific-popup/magnific-popup.css">			<!-- Slick Carousel -->

<link rel="stylesheet" href="common/themify-icons.css">							<!-- Themify -->
<link rel="stylesheet" href="common/slick-carousel/slick-theme.css">			<!-- Themify -->
<link rel="stylesheet" href="common/slick-carousel/slick.css">					<!-- Themify -->

<script src="common/owl-carousel/owl.carousel.min.js"></script>					<!-- Owl caeousel -->
<script src="common/slick-carousel/slick.min.js"></script>						<!-- Owl caeousel -->
<script src="common/magnific-popup/magnific-popup.js"></script>					<!-- Owl caeousel -->


<style type="text/css">* {font-family: 'S-CoreDream-3Light'!important;}</style>	<!-- font-family -->
</head>
<body>
${vo}<br/>
${mo}<br/>
<!-- 메인 상단 바 -->
<header class="header-top bg-grey justify-content-center" style="margin-bottom: 50px;">
	<nav class="navbar navbar-expand-lg navigation row" style="margin: 0 80px;">
		<!-- 왼쪽 메인 로고 -->
		<div class="col-lg-2 col-md-12 d-none d-lg-block">
			<a class="navbar-brand " href="list.jsp">
				<img src="images/logo.png" alt="메인 로고 이미지" class="img-fluid">
			</a>
		</div>
		<!-- 여백 -->
		<div class="col-lg-1 col-md-6">
		</div>
		<!-- nav  바 -->
		<div class="col-lg-6 col-md-12">
			<nav class="navbar navbar-expand-lg navigation-2 navigation">
	        	<div class="collapse navbar-collapse" id="navbar-collapse">
	            	<ul id="menu" class="menu navbar-nav mx-auto">
	                	<li class="nav-item"><a href="partyInsert.jsp" class="nav-link">파티생성</a></li>
	                    <li class="nav-item"><a href="list.jsp" class="nav-link">파티목록</a></li>
	                    <li class="nav-item"><a href="#" class="nav-link">파티관리</a></li>
	                    <!-- <li class="nav-item"></li> -->
	                </ul>
	        	</div>
			</nav>
		</div>
		<!-- 여백 -->
		<div class="col-lg-1 col-md-6">
		</div>
		<!-- 로그인 로그아웃 -->
		<div class="col-lg-2 col-md-6">
			<div class="header-socials-2 text-right d-none d-lg-block">
			<c:if test="${mo != null}">
				<div class="row">
					<div class="list-inline-item">
						<div class="row">
							<span class="text-center" style="font-size: 10pt;">${mo.nickName}님 방갑습니다.</span>
							<a id="logout-nav" href="login-register/logoutOK.jsp"><i>로그아웃</i></a>
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${mo == null }">
				<div style="display: inline-flex;">
					<div class="list-inline-item follow-socials"><a href="login-register/login.jsp"style=" width: 100px;"><i>로그인</i></a></div>
					<div class="list-inline-item follow-socials"><a href="login-register/member.jsp"style=" width: 100px;"><i>회원가입</i></a></div>
				</div>
			</c:if>
			<!-- 로그인 로그아웃 끝 -->				
			</div>
		</div>
	</nav>
</header>

<fmt:requestEncoding value="UTF-8"/>
	<table width="600" border="1" align="center" cellpadding="5" cellspacing="0">
		<tr colspan="3" width="100">
			<img src="./upload/${vo.photo}" align="middle" width="200"/>
		</tr>
		<tr>
			<th>
				파티 이름
			</th>
			<td>
				<!-- subject에 태그가 적용되지 않도록 줄이 바뀌도록 replace 함수를 적용한다. -->
				<c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
					${vo.subject} <br/>
			</td>
		</tr>
		<tr>
			<th>
				내용
			</th>
			<td>
				<!-- content에 태그가 적용되지 않도록 줄이 바뀌도록 replace 함수를 적용한다. -->
				<c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
				<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
				<!-- "\r\n" 에러 발생 request 변수(enter)로 받아서 처리 -->
				<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
					${vo.content} <br/>
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
		<c:if test="${vo.ID == mo.ID}">
			<tr>
				<td colspan="2" align="center">
					<input 
						type="button" 
						value="수정하기"
						onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=partyUpdate'"
					/>
					<input 
						type="button" 
						value="삭제하기"
						onclick="location.href='selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=partyDelete'"
					/>
					<input 
						class="btn btn-outline-warning btn-sm" 
						type="button" 
						value="돌아가기"
						style="font-size: 13px;"
						onclick="history.back()"
					/>
				</td>
			</tr>
		</c:if>		
	</table>	
	
	<form action="repleInsertOK.jsp" method="post">
		<table class="table" style="width: 700px; margin-left: auto; margin-right: auto;">
			<tr class="table-success">
				<th style="font-size: 30px; text-align: center;">댓글 보기</th>
			</tr>
			
			<tr>
				<th class="align-middle" style="width: 100px; text-align: center;">
					<label for="content">댓글</label>
				</th>
				<td colspan="3" style="width: 600px;">
					<textarea name="reple" rows="3"	style="resize: none;"></textarea>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="submit" value="댓글저장"/>
					<input type="reset" value="다시쓰기"/>
				</td>
			</tr>
		</table>
		<input type="hidden" name="repleIp" value="${pageContext.request.remoteAddr}"/>		
		<input type="hidden" name="repleID" value="${mo.ID}"/>	
		<input type="hidden" name="masterID" value="${vo.ID}"/>	
		<input type="hidden" name="originIdx" value="${vo.idx}"/>	
		<input type="hidden" name="currentPage" value="${currentPage}"/>	
	</form>
	
	
	<!--  -->
	

<c:set var="count" value="${0}"/>
<c:set var="view1" value="${repleList.list}"/>
<c:forEach var="ro1" items="${view1}">
   <c:if test="${ro1.fix == 'Y'}">
		<c:set var="count" value="${count + 1}"/>
   </c:if>
</c:forEach>

${count}
	<!--  -->
	
	
	
	
	
	
	
	
	
	
	
	
	<table>		
		<!-- 댓글을 출력한다. -->
		${repleList.list}
	 	<form id="repleForm" method="post">	
			<c:forEach var="ro" items="${repleList.list}">
				<tr class="table-dark">
					<td>
						<c:set var="repleID" value="${fn:replace(ro.repleID, '<', '&lt;')}"/>
						<c:set var="repleID" value="${fn:replace(repleID, '>', '&gt;')}"/>
						${repleID} 님이
					</td>
					<td>
						<c:set var="reple" value="${fn:replace(ro.reple, '<', '&lt;')}"/>
						<c:set var="reple" value="${fn:replace(reple, '>', '&gt;')}"/>
						<c:set var="reple" value="${fn:replace(reple, enter, '<br/>')}"/>
						${reple}
						<br/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<c:if test="${vo.ID == mo.ID}">
						<input 
							type="button" 
							value="답글 달기"
							style="font-size: 13px;"
							onclick="repleControlInert(${ro.seq})"
						/>
						</c:if>
						<c:if test="${ro.repleID == mo.ID}">
						<input 
							type="button" 
							value="수정하기"
							style="font-size: 13px;"
							onclick="repleControlUpdate(${ro.seq})"
						/>
						<input 
							type="button" 
							value="삭제하기"
							style="font-size: 13px;"
							onclick="repleControlDelete(${ro.seq})"
						/>
						</c:if>
					</td>
				</tr> 
			<input type="hidden" name="originIdx" value="${ro.originIdx}" />
			<input id="seq" type="hidden" name="seq"/>
			</c:forEach>
		</form>
	</table>
	
</body>
</html>
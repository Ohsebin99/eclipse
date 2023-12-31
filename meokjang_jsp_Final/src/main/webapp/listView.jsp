<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>			<!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	<!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이먹장</title>

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

<!-- private -->
<script type="text/javascript" src="js/loginCheck.js" defer="defer"></script>



</head>
<body>
<!-- 로그인 확인용 전역 JavaScript 변수 선언 -->
<script type="text/javascript">
    window.mo = "${mo}";
</script>

<!-- 외부 스크립트 로드 -->
<script src="/meokjang/src/main/webapp/js/loginCheck.js" type="text/javascript"></script>


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
	            	<input type="hidden" id="loginCheck" value="${mo.ID}"/>
	            	<ul id="menu" class="menu navbar-nav mx-auto">
	                	<li class="nav-item"><a href="#" onclick="loginCheck('partyInsert')" class="nav-link">파티생성</a></li>
	                    <li class="nav-item"><a href="list.jsp" class="nav-link">파티목록</a></li>
	                    <li class="nav-item"><a href="#" onclick="loginCheck('mylist')" class="nav-link">파티관리</a></li>
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
							<span class="text-center mr-3" style="font-size: 10pt;"><a id="myProfile" href="login-register/myProfileChK.jsp"> ${mo.ID}</a></span>
							<a id="logout-nav" href="login-register/logoutOK.jsp"><i>로그아웃</i></a>
						</div>
					</div>
				</div>
			</c:if>
			
			<c:if test="${mo == null}">
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
<!-- 헤더 끝-->
<fmt:requestEncoding value="UTF-8"/>
<c:set var="view" value="${partyList.list}"></c:set>

<section class="slider mt-4">
   <div class="container-fluid">
      <div class="row no-gutters">
         <div class="col-lg-12 col-sm-12 col-md-12 slider-wrap">
               <!-- 아이템 끝 -->
               <c:forEach var="so" items="${partyListSlider.list}">
               <c:if test="${so.deleteReport < 3}">
                  <div class="slider-item">
                     <div class="slider-item-content">
                     <div class="post-thumb mb-4">
                        <a class="post-thumb mb-4 d-block" href="selectByIdx.jsp?idx=${so.idx}&currentPage=${currentPage}&job=repleView">
                           <img src="./upload/${so.photo}" alt="" class="img-fluid" style="height: 500px;">
                        </a>
                     </div>
   
                     <div class="slider-post-content">
                        <span class="cat-name text-color font-sm font-extra text-uppercase letter-spacing">${so.category}</span>
                        <h3 class="post-title mt-1"><a href="selectByIdx.jsp?idx=${so.idx}&currentPage=${currentPage}&job=repleView">${so.subject}</a></h3>
                        <span class=" text-muted  text-capitalize">
                           <fmt:formatDate value="${so.mealDate}" pattern="yy.MM.dd HH시mm분" />
                   </span>
                     </div>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
               <!-- 아이템 끝 -->
            </div>
      </div>
   </div>
</section>  


<!-- main 시작 -->
	
<section class="section-padding">
	<div class="container">
		<div class="row">
<!-- 파티 리스트 시작 -->
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<!-- 검색 -->
						<form class="mb-5" action="list.jsp" method="post">
						<div class="col-md-12 mb-5">
							<div class="col-lg-12">
								<div class="row mb-3">
									<!-- 지역 -->
									<div class="col-md-3">
										<select class="form-control" name="location">
											<option>전국</option>
											<option>서울</option>
											<option>경기/인천</option>
											<option>강원</option>
											<option>대전</option>
											<option>세종</option>
											<option>충남</option>
											<option>충북</option>
											<option>부산</option>
											<option>울산</option>
											<option>경남</option>
											<option>경북</option>
											<option>대구</option>
											<option>광주</option>
											<option>전남</option>
											<option>전북</option>
											<option>제주</option>
										</select>
									</div>
									<!-- 카테고리 -->
									<div class="col-md-3">
										<select class="form-control" name="category">
							               <option>음식 카테고리</option>
							               <option>족발&보쌈</option>
							               <option>찜&탕&찌개</option>
							               <option>돈까스&회&일식</option>
							               <option>피자</option>
							               <option>고기&구이</option>
							               <option>양식</option>
							               <option>치킨</option>
							               <option>중식</option>
							               <option>아시안</option>
							               <option>백반&국수</option>
							               <option>분식</option>
							               <option>카페&디저트</option>
							               <option>패스트푸드</option>
							            </select>
									</div>
									<!-- 음주 -->
									<div class="col-md-3">
										<select class="form-control" name="acholchk">
											<option>음주 여부</option>
											<option>무관</option>
											<option>음주</option>
											<option>논알콜</option>
										</select>
									</div>
									<!-- 성별 -->
									<div class="col-md-3">
										<select class="form-control" name="partyGender">
											<option>성별</option>
											<option>무관</option>
											<option>남자</option>
											<option>여자</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="row mb-3">
								<div class="col-md-2">
								</div>
								<!-- 검색 내용 -->
								<div class="col-md-6">
									<input type="text" class="form-control" name="item" value="${item}"/>
								</div>
								<!-- 검색어 -->
								<div class="col-md-2">
									<select class="form-control" name="condition">
										<option>파티명</option>
										<option>내용</option>
										<option>내용+파티명</option>
									</select>
								</div>
								<!-- 검색 버튼 -->
								<div class="col-md-2">
									<input class="btn btn-primary" type="submit" value="검색"/>
								</div>
							</div>
						</div>
						</form>
						<!-- 검색 끝 -->
					</div>
					<!-- 반복문으로 list 출력 시작-->
					<c:forEach var="vo" items="${view}">
						<c:if test="${vo.deleteReport < 3}">
							<div class="col-lg-3 col-md-6">
								<article class="post-grid mb-5">
									<a class="post-thumb mb-4 d-block" href="selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=repleView">
										<img src="./upload/${vo.photo}" class="img-fluid w-100" style="height: 210px; width: 210px;" >
										<span class="text-color mt-2 letter-spacing">${vo.category}</span><br/>
										<span class="text-muted letter-spacing text-uppercase font-sm">
											<fmt:formatDate value="${vo.mealDate}" pattern="yy.MM.dd" />&nbsp;
											<fmt:formatDate value="${vo.mealDate}" pattern="HH시mm분" />
											<c:if test="${vo.acholchk == '음주'}">
												<img src="./images/soju.png" width="17px;">
											</c:if>
										</span><br/>
										<span class="post-title">${vo.subject}</span><br/><br/>
										<span class="py-1">${vo.location}</span>
										</a>
								</article>
							</div>
						</c:if>
						<c:if test="${vo.deleteReport >= 3}">
							<div class="col-lg-3 col-md-6">
								<article class="post-grid mb-5">
										<img src="./upload/report.png" class="img-fluid w-100" style="height: 210px; width: 210px;" >
										<span class="text-color mt-2 letter-spacing"> </span><br/>
										<span class="text-muted letter-spacing text-uppercase font-sm">
											<fmt:formatDate value="${vo.mealDate}" pattern=" " />&nbsp;
											<fmt:formatDate value="${vo.mealDate}" pattern=" " />
											</span><br/>
										<div class="post-title text-center"><b style="color: red; font-size: 20px;">신고 누적된 방입니다.</b></div><br/><br/>
										<span class="py-1"> </span>
								</article>
							</div>
						</c:if>
					</c:forEach>
					<!-- 반복문으로 list 출력 끝-->
				</div>
			</div>
<!-- 파티 리스트 끝 -->

<!-- 페이징 작업 시작 -->			
			<div class="m-auto">
				<div class="pagination mt-5 pt-4">
					<ul class="list-inline">	
						<!-- 처음으로 -->
						<!-- 활성화 -->
						<c:if test="${partyList.currentPage >1}">
							<li class="list-inline-item">
								<a class="active" href="?currentPage=1">처음</a>
							</li>
						</c:if>
						
						<!-- 10페이지 앞으로 -->
						<c:if test="${partyList.startPage >1}">
							<li class="list-inline-item">
								<a href="?currentPage=${partyList.startPage - 1}">이전</a>
							</li>
						</c:if>
						
						<c:if test="${partyList.startPage <= 1}">
							<li class="list-inline-item">
								<a class="active">이전</a>
							</li>
						</c:if>
						
						<!-- 페이지 이동버튼 -->
						<c:forEach var="i" begin="${partyList.startPage}" end="${partyList.endPage}" step="1">
							<c:if test="${partyList.currentPage == i}">
								<li class="list-inline-item">
									<a class="active">${i}</a>
								</li>
							</c:if>
							
							<c:if test="${partyList.currentPage != i}">
								<li class="list-inline-item">
									<a href="?currentPage=${i}">${i}</a>
								</li>
							</c:if>
						</c:forEach>
						
						<!-- 10페이지 뒤로 -->
						<c:if test="${partyList.endPage < partyList.totalPage}">
							<li class="list-inline-item">
								<a href="?currentPage=${partyList.endPage + 1}">다음</a>
							</li>
						</c:if>
						
						<c:if test="${partyList.endPage >= partyList.totalPage}">
								<li class="list-inline-item">
									<a class="active">다음</a>
								</li>
						</c:if>
						
						<!-- 마지막 -->
						<c:if test="${partyList.currentPage < partyList.totalPage}">
							<li class="list-inline-item">
								<a class="active" href="?currentPage=${partyList.totalPage}">끝</a>
							</li>
						</c:if>
						
					</ul>
				</div>
			</div>
<!-- 페이징 작업 시작 끝 -->						
		</div>
	</div>
</section>
<!-- 테마로 찍어보기 종료 -->
	
	
	<!-- 페이지 이동 버튼 -->

<!-- footer 시작 -->
<section class="footer-2 section-padding gray-bg pb-5" style="margin-top: 50px;">
	<div class="footer-btm mt-5 pt-4 border-top">
		<div class="row">
			<div class="col-lg-12">
				<ul class="list-inline footer-socials-2 text-center">
	              <li class="list-inline-item"><a href="#">Privacy policy</a></li>
	              <li class="list-inline-item"><a href="#">Support</a></li>
	              <li class="list-inline-item"><a href="#">About</a></li>
	              <li class="list-inline-item"><a href="#">Contact</a></li>
	              <li class="list-inline-item"><a href="#">Terms</a></li>
	              <li class="list-inline-item"><a href="#">Category</a></li>
	            </ul>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-6">
				<div class="copyright text-center ">
					&copy; copyright all reserved to <a href="https://themefisher.com/">themefisher.com</a>-2019
				</div>
			</div>
		</div>
	</div>
</section>	


</body>
</html>
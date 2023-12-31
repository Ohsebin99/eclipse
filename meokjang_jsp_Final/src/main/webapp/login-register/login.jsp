<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>			<!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		<!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>	<!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹장 - 로그인</title>

<!-- common -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>			<!-- device-width -->
<link rel="icon" href="../images/favicon.png">									<!--  favicon -->
<script type="text/javascript" src="../common/jquery-3.7.0.js"></script>		<!-- jQury -->
<link rel="stylesheet" href="../common/bootstrap/css/bootstrap.min.css">		<!-- bootstrap -->
<script src="../common/bootstrap/js/bootstrap.min.js"></script>					<!-- bootstrap -->
<script src="../common/bootstrap/js/popper.min.js"></script>					<!-- bootstrap -->
<script type="text/javascript" src="../common/custom.js" defer="defer"></script><!-- template -->
<link rel="stylesheet" href="../common/style.css"/>								<!-- template -->

<link rel="stylesheet" href="../common/owl-carousel/owl.carousel.min.css">		<!-- Slick Carousel -->
<link rel="stylesheet" href="../common/owl-carousel/owl.theme.default.min.css">	<!-- Slick Carousel -->
<link rel="stylesheet" href="../common/magnific-popup/magnific-popup.css">		<!-- Slick Carousel -->

<link rel="stylesheet" href="../common/themify-icons.css">						<!-- Themify -->
<link rel="stylesheet" href="../common/slick-carousel/slick-theme.css">			<!-- Themify -->
<link rel="stylesheet" href="../common/slick-carousel/slick.css">				<!-- Themify -->

<script src="../common/owl-carousel/owl.carousel.min.js"></script>				<!-- Owl caeousel -->
<script src="../common/slick-carousel/slick.min.js"></script>					<!-- Owl caeousel -->
<script src="../common/magnific-popup/magnific-popup.js"></script>				<!-- Owl caeousel -->

<style type="text/css">* {font-family: 'S-CoreDream-3Light'!important;}</style>	<!-- font-family -->

<!-- private -->
<link rel="stylesheet" href="../css/member.css"/>
<script type="text/javascript" src="../js/login.js"></script>


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
			<a class="navbar-brand " href="../list.jsp">
				<img src="../images/logo.png" alt="메인 로고 이미지" class="img-fluid">
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
	                	<li class="nav-item"><a href="#" onclick="loginCheck()" class="nav-link">파티생성</a></li>
	                    <li class="nav-item"><a href="../list.jsp" class="nav-link">파티목록</a></li>
	                    <li class="nav-item"><a href="#" onclick="loginCheck()" class="nav-link">파티관리</a></li>
	                    <!-- <li class="nav-item"></li> -->
	                </ul>
	        	</div>
			</nav>
		</div>
		<!-- 여백 -->
		<div class="col-lg-1 col-md-6">
		</div>
		<!-- 로그인 회원가입 -->
		<div class="col-lg-2 col-md-6">
			<div class="header-socials-2 text-right d-none d-lg-block">
			<c:if test="${mo == null }">
				<div style="display: inline-flex;">
					<div class="list-inline-item follow-socials"><a href="login.jsp"style=" width: 100px;"><i>로그인</i></a></div>
					<div class="list-inline-item follow-socials"><a href="member.jsp"style=" width: 100px;"><i>회원가입</i></a></div>
				</div>
			</c:if>
			<!-- 로그인 후 주소창찍고 넘어 올 때 처리 -->
			<c:if test="${mo != null }">
				<script type="text/javascript" src="../js/loginChk.js"></script>
			</c:if>
			<!--  -->
			<!-- 로그인 회원가입-->				
			</div>
		</div>
	</nav>
</header>

<!-- 메인 -->
<section class="section-padding">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="col-lg-12">
					<div class="row mb-3">
						<div class="col-lg-2"></div>
						<div class="col-lg-8">
							<!-- <img id="output" class="img-fluid w-100"/><br/> -->
						</div>
						<div class="col-lg-2"></div>
					</div>
				<form class="comment-form mb-3 gray-bg p-5" action="loginOK.jsp" method="post" onsubmit="return formCheck()">
					<h1 class="mb-4" style="vertical-align: middle; text-align: center; font-size: 25px;">로그인</h1>
					<div class="row">
						<!-- 로그인 입력 -->
						<div class="col-lg-12">
							<input type="text" id="userId" class="form-control mb-3" name="ID" autocomplete="off" placeholder="아이디"/>
						</div>
						<!-- 비밀번호 입력 -->
						<div class="col-lg-12">
							<input type="password" class="form-control mb-3" name="password" autocomplete="off" placeholder="비밀번호"/>
						</div>
					</div>
							<div>
								<label for="idSave">아이디 저장 &nbsp;</label>
								<input id="idSave" type="checkbox" name="idSave" checked="checked" /></br>
								<div class="mb-2">
									<a href="idSerch.jsp">아이디 찾기</a>&nbsp;&nbsp;
									<a href="passwordSerch.jsp">비밀번호 찾기</a>
								</div>
							</div>
							<div class="d-grid">
						<input class="btn btn-primary btn-block mb-3" type="submit" value="로그인" onclick="login()">
						<input class="btn btn-primary btn-block" type="button" value="회원가입" onclick="location.href='member.jsp'">
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>
</section>

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
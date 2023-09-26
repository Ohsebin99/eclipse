<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티 관리</title>

<!-- common -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>         <!-- device-width -->
<link rel="icon" href="images/favicon.png">                              <!--  favicon -->
<script type="text/javascript" src="common/jquery-3.7.0.js"></script>         <!-- jQury -->
<link rel="stylesheet" href="common/bootstrap/css/bootstrap.min.css">         <!-- bootstrap -->
<script src="common/bootstrap/js/bootstrap.min.js"></script>               <!-- bootstrap -->
<script src="common/bootstrap/js/popper.min.js"></script>                  <!-- bootstrap -->
<script type="text/javascript" src="common/custom.js" defer="defer"></script>   <!-- template -->
<link rel="stylesheet" href="common/style.css"/>                        <!-- template -->

<link rel="stylesheet" href="common/owl-carousel/owl.carousel.min.css">         <!-- Slick Carousel -->
<link rel="stylesheet" href="common/owl-carousel/owl.theme.default.min.css">   <!-- Slick Carousel -->
<link rel="stylesheet" href="common/magnific-popup/magnific-popup.css">         <!-- Slick Carousel -->

<link rel="stylesheet" href="common/themify-icons.css">                     <!-- Themify -->
<link rel="stylesheet" href="common/slick-carousel/slick-theme.css">         <!-- Themify -->
<link rel="stylesheet" href="common/slick-carousel/slick.css">               <!-- Themify -->

<script src="common/owl-carousel/owl.carousel.min.js"></script>               <!-- Owl caeousel -->
<script src="common/slick-carousel/slick.min.js"></script>                  <!-- Owl caeousel -->
<script src="common/magnific-popup/magnific-popup.js"></script>               <!-- Owl caeousel -->

<style type="text/css">* {font-family: 'S-CoreDream-3Light'!important;}</style>   <!-- font-family -->

<!-- private -->
</head>
<body>

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
                       <li class="nav-item"><a href="mylist.jsp" class="nav-link">파티관리</a></li>
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

<br/>
<br/>

<fmt:requestEncoding value="UTF-8"/>


<span style="font-size: 20px; font-weight: 900;">내가 만든 방</span><hr></hr>
<!-- 반복문으로 생성한 방list 출력 시작-->
<section class="section-padding">
	<div class="container">
		<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div class="row">
<c:set var="view" value="${createList.list}"></c:set>
<c:if test="${view.size() != 0}">
   <c:forEach var="vo" items="${view}">
   <c:if test="${vo.deleteReport < 10}">
      <div class="col-lg-2 col-md-2">
         <article class="post-grid mb-5">
            <a class="post-thumb mb-4 d-block" href="selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=repleView">
               <img src="./upload/${vo.photo}" class="img-fluid" style="height: 210px; width: 250px;" >
               <span class="cat-name text-color font-lg font-extra text-uppercase letter-spacing" style="display: block">${vo.category}</span><br/>
               <span class="text-muted letter-spacing text-uppercase font-sm">
                  <fmt:formatDate value="${vo.mealDate}" pattern="yy.MM.dd  HH:mm" />&nbsp;
                  <fmt:formatDate value="${vo.mealDate}" pattern="HH:mm" />
               </span><br/>
               <span class="post-title mt-1">${vo.subject}</span>
            </a>
         </article>
      </div>
   </c:if>
   <c:if test="${vo.deleteReport >= 10}">
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
</c:if>
</div>
</div>
<!-- 반복문으로 list 출력 끝-->
<span style="font-size: 20px; font-weight: 900;">참여한 방</span><hr></hr>
<!-- 반복문으로 생성한 방list 출력 시작-->
<c:set var="view" value="${joinList}"></c:set>
<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
<div class="row">
<c:if test="${view.size() != 0}">
   <c:forEach var="vo" items="${view}">
      <div class="col-lg-3 col-md-6">
         <article class="post-grid mb-5">
            <a class="post-thumb mb-4 d-block" href="selectByIdx.jsp?idx=${vo.idx}&currentPage=${currentPage}&job=repleView">
               <img src="./upload/${vo.photo}" class="img-fluid w-100" style="height: 210px; width: 210px;" >
               <span class="cat-name text-color font-lg font-extra text-uppercase letter-spacing">${vo.category}</span><br/>
               <span class="text-muted letter-spacing text-uppercase font-sm">
                  <fmt:formatDate value="${vo.mealDate}" pattern="yy.MM.dd  HH:mm" />&nbsp;
                  <fmt:formatDate value="${vo.mealDate}" pattern="HH:mm" />
               </span><br/>
               <span class="post-title mt-1">${vo.subject}</span>
            </a>
         </article>
      </div>
   </c:forEach>
</c:if>
</div>
</div>

      </div>
   </div>
</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정할 글 보기</title>

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
</head>
<body>
<fmt:requestEncoding value="UTF-8"/>

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
                     <span class="text-center mr-3" style="font-size: 10pt;">${mo.nickName}님 방갑습니다.</span>
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
<!-- 헤더 끝-->

<section class="single-block-wrapper section-padding">
<div class="container">
<div class="row">

   <div class="col-lg-8 col-md-12 col-sm-12 col-xs-12">
      <div class="single-post">
          <div class="post-header mb-5 text-center">
              <div class="post-featured-image mt-5">
                 <img src="upload/${vo.photo}" class="img-fluid w-100" style="height: 420px;"/>
              </div>
          </div>
           <div class="post-body">
            <!--  -->
            <div class="container bg-grey comment-form">
               <div class="row">
                  <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                     <div class="col-lg-12">
                        <form action="partyUpdateOK.jsp" method="post">
                           <div class="row">
                              <!-- 파티명 -->
                              <div class="col-lg-12">
                                    <c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;')}"/>
                                 <c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
                                 <input type="text" name="subject" class="form-control text-center mt-3 mb-4" value="${subject}"/>
                              </div>
                              <!-- 장소 -->
                              <div class="col-lg-12">
                                 <input type="text" class="form-control-plaintext text-center mt-3 mb-3" readonly="readonly"
                                 value="${vo.place}"/>
                              </div>
                              <!-- 음식 카테고리 -->
                              <div class="col-md-4">
                                 <h5 class="mb-3 text-center">카테고리</h5>
                                 <input type="text" class="form-control-plaintext mb-3 text-center b" readonly="readonly" value="${vo.category}"/>
                              </div>
                              <!-- 성별 -->
                              <div class="col-md-4">
                                 <h5 class="mb-3 text-center">성별</h5>
                                 <input type="text" class="form-control-plaintext text-center mb-3" readonly="readonly" value="${vo.partyGender}"/>
                              </div>
                              <!-- 모임 시간 -->
                              <div class="col-md-4">
                                 <h5 class="lg-12 text-center">식사 시간</h5>
                                 <input type="text" class="form-control-plaintext"  style="text-align: center;" readonly="readonly"
                                    value="<fmt:formatDate value="${vo.mealDate}" pattern="MM월 dd일 HH:mm"/>"/>
                              </div>
                              <!-- 음주 -->
                              <div class="col-lg-4 col-md-6">
                                 <h5 class="mb-3 text-center">술 여부</h5>
                                 <input type="text" class="form-control-plaintext mb-3" style="text-align: center;" readonly="readonly" value="${vo.acholchk}"/>
                              </div>
                              <!-- 인원 -->
                              <div class="col-lg-4 col-md-6">
                                 <h5 class="mb-3 text-center">인원 제한</h5>
                                 <input type="text" class="form-control-plaintext text-center mb-3" readonly="readonly"
                                    value="${vo.limitNum}명"/>
                              </div>
                              <!-- 나이 -->
                              <div class="col-lg-4 col-md-6">
                                 <h5 class="mb-3 text-center">나이 제한</h5>
                                 <input type="text" class="form-control-plaintext text-center mb-3" readonly="readonly"
                                 value="${vo.minLimitAge}사 ~ ${vo.maxLimitAge}살"/>
                              </div>
                              
                              <!-- 글 내용 -->
                              <div class="col-lg-12">
                                 <c:set var="content" value="${fn:replace(vo.content, '<', '&lt;')}"/>
                                 <c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
                                 <c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
                                 <textarea class="form-control mb-3" name="content" rows="15" cols="30" style="resize: none;">${content}</textarea>
                              </div>
                           </div>
                           <!-- 히든 속성 -->
                           <input type="hidden" name="idx" value="${vo.idx}"/>
                           <input type="hidden" name="currentPage" value="${currentPage}"/>
                           <div class="row">
                              <div class="col-lg-12 mb-4" style="text-align: center;">
                                 <div class="btn-group">
                                    <input class="btn btn-primary" type="submit" value="수정하기"/>
                                    <input class="btn btn-primary" type="button" value="돌아가기" onclick="history.back()"/>
                                 <input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='list.jsp?currentPage=${currentPage}'"/>
                                 </div>
                              </div>
                        </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
           </div>
      </div>
   </div>
   
   <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
      <div class="sidebar sidebar-right">
         <div class="sidebar-wrap mt-5 mt-lg-0">
            
            <div class="sidebar-widget about mb-5 text-center p-3">
               <div class="about-author">
                  <img src="images/author.jpg" alt="" class="img-fluid">
               </div>
               <h4 class="mb-0 mt-4">먹방 짱</h4>
               <p>${vo.nickName}</p>
               <!--  -->
               <p>무슨 내용을 적어야할지 조금은 고민해봅시다.</p>
               <!--  -->
            </div>
   
            <div class="sidebar-widget mb-5 ">
               <h4 class="text-center widget-title">참여 목록</h4>
                 
                 <div class="media border-bottom py-3 sidebar-post-item">
                     <a href="#"><img class="mr-4" src="images/news/thumb-1.jpg" alt=""></a>
                     <div class="media-body">
                        <h5 class="widget">닉네임</h5>
                        <span class="text-muted font-sm">aA날짜     A A A 0708</span><br/>
                         <span class="font-sm letter-spacing-1">Jzxcxzcx19</span>
                     </div>
                 </div>
                 <div class="media border-bottom py-3 sidebar-post-item">
                     <a href="#"><img class="mr-4" src="images/news/thumb-2.jpg" alt=""></a>
                     <div class="media-body">
                         <h4 ><a href="blog-single.html">파티방 이름</a></h4>
                        <span class="text-muted font-sm">날짜 0708</span>
                     </div>
                 </div>
            </div>
            
         </div>
      </div>
   </div>

</div>
</div>
</section>



</body>
</html>
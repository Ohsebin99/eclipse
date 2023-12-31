<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>같이먹장</title>

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
<script type="text/javascript" src="js/partyInsert.js" defer="defer"></script>



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

<!-- 메인 시작 -->
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
            <form class="comment-form mb-5 bg-grey p-5" action="InsertServlet" method="post" enctype="multipart/form-data" onsubmit="return partyInsertOK()">
               <h3 class="mb-4 text-center">먹방 생성</h3>
               <div class="row">
                  <!-- 파티 명 -->
                  <div class="col-lg-12">
                     <input type="text" class="form-control mb-3" name="subject" autocomplete="off" placeholder="파티명 :"/>
                  </div>
                  <!-- 파일 업로드 -->                  
                  <div class="col-lg-12">
                     <div class="row mb-3">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                           <h5 class="mb-3 text-center">파일 업로드</h5>
                           <input class="form-control" type="file" accept="image/*" name="fileName" onchange="photoView(event)"/>
                        </div>
                        <div class="col-md-4"></div>
                     </div>
                     <div class="row mb-3">
                        <div class="col-lg-3"></div>
                        <div class="col-lg-6">
                           <img id="output" class="img-fluid w-100"/><br/>
                        </div>
                        <div class="col-lg-3"></div>
                     </div>
                  </div>
                  <!-- 음식 카테고리 -->
                  <div class="col-md-6">
                     <h5 class="mb-3 text-center">카테고리</h5>
                     <select class="form-control mb-3" name="category">
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
                  <!-- 성별 -->
                  <!-- 지역 -->
                  <div class="col-md-6">
                     <h5 class="mb-3 text-center">지역</h5>
                     <select class="form-control text-center mb-3" name="location">
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
                  
                  <!-- 음주 -->
                  <div class="col-lg-3 col-md-6">
                     <h5 class="mb-3 text-center">술 여부</h5>
                     <select class="form-control mb-3" name="acholchk">
                        <option>무관</option> 
                        <option>음주</option>
                        <option>논알콜</option>
                     </select>
                  </div>
                  <!-- 인원 -->
                  <div class="col-lg-3 col-md-6">
                     <h5 class="mb-3 text-center">인원 제한</h5>
                     <input type="text" class="form-control text-center mb-3" name="limitNum" autocomplete="off" placeholder="최대 먹방 인원 :"
                        value="4">
                  </div>
                  <!-- 나이 -->
                  <div class="col-lg-3 col-md-6">
                     <h5 class="mb-3 text-center">나이 제한</h5>
                     <div class="row mb-3">
                        <div class="col-md-6">
                           <input type="text" class="form-control text-center" name="minLimitAge" autocomplete="off" placeholder="최소"
                           value="20"/>
                        </div>
                        <div class="col-md-6">
                           <input type="text" class="form-control text-center" name="maxLimitAge" autocomplete="off" placeholder="최대"
                           value="30"/>
                        </div>
                     </div>
                  </div>
                  <!-- 성별 -->
                  <div class="col-lg-3 col-md-6">
                     <h5 class="mb-3 text-center">성별</h5>
                     <select class="form-control mb-3" name="partyGender">
                        <option>무관</option>
                        <option>남자</option>
                        <option>여자</option>
                     </select>
                  </div>
                  
                  <!-- 모임 시간 시작 -->
                  <div class="col-md-6">
                     <h5 class="mb-3 text-center">식사 시간</h5>
                     <div class="row mb-3">
                        <div class="col-lg-6">
                           <input type="date" class="form-control" name="mealDate" onclick="dateOK()"/>
                        </div>
                        <div class="col-lg-6">
                           <input type="time" class="form-control" name="mealTime" value="12:00" min="00:00" max="23:59" onchange="timeOK()">
                        </div>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <h5 class="mb-3 text-center">장소 검색</h5>
                     <div class="row">
                        <div class="col-lg-8">
                           <input type="text" id="searchInput" class="form-control mb-3" name="place"  autocomplete="off" placeholder="장소 :" value="종로 맛집"/>
                        </div>
                        <div class="col-lg-4 text-center">
                           <div>
                              <input type="button" id="searchButton" value="검색" style="width: 80px; height: 40px;">
                           </div>
                        </div>
                     </div>

                  </div>
                     <!-- 장소 -->
                  <div class="col-lg-6">
                     <textarea class="form-control mb-4" name="content" rows="11"  placeholder="내용" style="resize: none;">글 내용</textarea>
                  </div>
                     <!-- 글 내용 -->
                  <div class="col-lg-6" style="display: flex;">
                     <div id="map" class="mb-4" style="width:100%;"></div>
                  </div>
               </div>
                  <!-- 모임 시간 끝 -->
               <div class="row">
                  <div class="col-lg-12 text-center">
                     <div class="btn-group">
                        <input class="btn btn-primary" type="submit" value="생성하기"/>
                        <input class="btn btn-primary" type="reset" value="다시쓰기"/>
                        <input class="btn btn-primary" type="button" value="돌아가기" onclick="history.back()"/>
                     </div>
                  </div>
               </div>
               <!-- 작성자 ip 주소를 hidden으로 넘겨준다. -->
               <input type="hidden" name="ip" value="${pageContext.request.remoteAddr}"/>
               
               <!-- 연습용 ID -->
               <input type="hidden" name="ID" value="${mo.ID}"/>
               <input type="hidden" name="nickName" value="${mo.nickName}"/>
            </form>
         </div>
      </div>
   </div>
   </div>
</section>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b6bf51f6f463894d9e2e6e36957148d&libraries=services"></script>
</body>
</html>
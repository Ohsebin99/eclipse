<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹장 - 회원가입</title>

<!-- common -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>         <!-- device-width -->
<link rel="icon" href="../images/favicon.png">                           <!--  favicon -->
<script type="text/javascript" src="../common/jquery-3.7.0.js"></script>      <!-- jQury -->
<link rel="stylesheet" href="../common/bootstrap/css/bootstrap.min.css">      <!-- bootstrap -->
<script src="../common/bootstrap/js/bootstrap.min.js"></script>               <!-- bootstrap -->
<script src="../common/bootstrap/js/popper.min.js"></script>               <!-- bootstrap -->
<script type="text/javascript" src="../common/custom.js" defer="defer"></script><!-- template -->
<link rel="stylesheet" href="../common/style.css"/>                        <!-- template -->

<link rel="stylesheet" href="../common/owl-carousel/owl.carousel.min.css">      <!-- Slick Carousel -->
<link rel="stylesheet" href="../common/owl-carousel/owl.theme.default.min.css">   <!-- Slick Carousel -->
<link rel="stylesheet" href="../common/magnific-popup/magnific-popup.css">      <!-- Slick Carousel -->

<link rel="stylesheet" href="../common/themify-icons.css">                  <!-- Themify -->
<link rel="stylesheet" href="../common/slick-carousel/slick-theme.css">         <!-- Themify -->
<link rel="stylesheet" href="../common/slick-carousel/slick.css">            <!-- Themify -->

<script src="../common/owl-carousel/owl.carousel.min.js"></script>            <!-- Owl caeousel -->
<script src="../common/slick-carousel/slick.min.js"></script>               <!-- Owl caeousel -->
<script src="../common/magnific-popup/magnific-popup.js"></script>            <!-- Owl caeousel -->

<style type="text/css">* {font-family: 'S-CoreDream-3Light'!important;}</style>   <!-- font-family -->
<!-- private -->
<script type="text/javascript" src="../js/member.js"></script>
<link rel="stylesheet" href="../css/member.css"/>

</head>
<body>
${mo}
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
      <!-- 로그인 로그아웃 -->
      <div class="col-lg-2 col-md-6">
         <div class="header-socials-2 text-right d-none d-lg-block">
         <c:if test="${mo != null}">
            <div class="row">
               <div class="list-inline-item">
                  <div class="row">
                     <span class="text-center mr-3" style="font-size: 10pt;"><a id="myProfile" href="myProfile.jsp"> ${mo.ID}</a></span>
                     <a id="logout-nav" href="logoutOK.jsp"><i>로그아웃</i></a>
                  </div>
               </div>
            </div>
         </c:if>
         
         <c:if test="${mo == null }">
            <div style="display: inline-flex;">
               <div class="list-inline-item follow-socials"><a href="login.jsp"style=" width: 100px;"><i>로그인</i></a></div>
               <div class="list-inline-item follow-socials"><a href="member.jsp"style=" width: 100px;"><i>회원가입</i></a></div>
            </div>
         </c:if>
         <!-- 로그인 로그아웃 끝 -->            
         </div>
      </div>
   </nav>
</header>

<!-- 메인 시작 -->
<div class="container" style="margin-top: 20px;">
   <form action="memberOK.jsp" method="post" onsubmit="return formCheck()">
      <table class="table table-bordered" style="width: 500px; margin-left: auto; margin-right: auto;">
         <thead>
            <tr class="success">
               <th colspan="3" style="text-align: center; font-size: 25px;">회원가입</th>
            </tr>
         </thead>
         <tbody>
            <!-- 아이디 -->
            <tr>
               <td colspan="2">
                  <input id="ID" class="form-control" type="text" name="ID" 
                     placeholder="아이디" autocomplete="off"   onkeyup="idCheck()"/>
                  <!-- 아이디 오류 문구 출력 -->
                  <h5 id="idChkMessage1" style="color: red; font-weight: bold"></h5>
                  <h5 id="idChkMessage2" style="color: lime; font-weight: bold"></h5>
               </td>
            </tr>
            <!-- 비밀번호 -->
            <tr>
               <td colspan="2">
                  <input id="password" class="form-control" type="password" name="password" 
                     placeholder="비밀번호" autocomplete="off" onkeyup="pwdCheck1()"/>
                  <!-- 비밀번호 오류 문구 출력 -->
                  <h5 id="pwdChkMessage1" style="color: red; font-weight: bold"></h5>
            <!-- 비밀번호 확인 -->
                  <input id="password2" class="form-control" type="password" name="password2" 
                     placeholder="비밀번호 확인" autocomplete="off" onkeyup="pwdCheck2()"/>
                  <h5 id="pwdChkMessage2" style="color: red; font-weight: bold"></h5>
               </td>
            </tr>
            <!-- 닉네임 -->
            <tr>
               <td colspan="2">
                  <input id="nickname" class="form-control" type="text" name="nickName" value="무우명"
                     placeholder="닉네임" autocomplete="off"/>
               </td>
            <!-- 이름 -->
            <tr>
               <td colspan="2">
                  <input id="name" class="form-control" type="text" name="name" value="고대일"
                     placeholder="이름" autocomplete="off"/>
               </td>
            </tr>
            <!-- 주민번호 -->
            <tr>
               <td colspan="3" style="display: flex;">
                  <input style="width: 230px;" type="text" class="form-control" name="jumin1" maxlength="6"  placeholder="주민번호 앞자리"/>
                  <b style="margin-top: 10px;"> - </b>
                  <input style="width: 230px;" type="password" class="form-control" name="jumin2" maxlength="7"  placeholder="뒷자리" /> 
               </td>
            </tr>
            <!-- 이메일 -->
            <tr>
               <td colspan="2" style="display: flex;">
                  <input  type="text" name="email1" class="form-control" style="width: 130px;"
                     autocomplete="off" placeholder="이메일"/>
                  <b style="margin-top: 10px; margin-left: 15px; " >@</b>
                  <input  type="text" name="email2" class="form-control" autocomplete="off" placeholder="직접 입력하기"
                     style="width: 130px; height: 46px; margin-left: 20px;"/>
                  <select style="width: 160px; margin-left: 10px; margin-bottom: 15px;" class="form-control" onchange="selectEmail()">
                        <option>직접 입력하기</option>
                        <option>gmail.com</option>
                        <option>naver.com</option>
                        <option>daum.net</option>
                        <option>nate.net</option>
                        <option>koma.kr</option>
                        <option>yahoo.com</option>
                        <option>freechal.com</option>
                        <option>lycos.co.kr</option>
                  </select>
               </td>
            </tr>
            <!-- 전화번호 -->
            <tr>
               <td>
                  <div style="display: flex;">
                     <select class="form-control" style="width: 100px; margin-bottom: 14px;">
                        <option>010</option>
                        <option>011</option>
                        <option>016</option>
                        <option>017</option>
                        <option>018</option>
                        <option>019</option>
                     </select>
                     <input id="telephone" class="form-control" type="text"  
                        placeholder="휴대폰 번호('-'없이 입력하세요)" maxlength="8" autocomplete="off"/>
                  </div>
               </td>
            </tr>
            <!-- 주소 -->
            <tr>
               <td>
                  <input type="text" class="form-control" id="sample6_postcode" name="postcode" placeholder="우편번호">
                  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                  <input type="text" class="form-control" id="sample6_address" name="address" placeholder="주소"><br>
                  <input type="text" class="form-control" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
                  <input type="text" class="form-control" id="sample6_extraAddress" name="extraAddress" placeholder="참고항목">
               </td>
            </tr>
         </tbody>
      </table>
      <table style="margin-left: auto; margin-right: auto;">   
         <tr>
            <td>
               <input class="btn btn-success" type="submit" value="가입완료"
               style="width: 400px; margin-left: auto; margin-right: auto;" />
            </td>
         </tr>
      </table>
      <!-- hidden 속성 -->
         <input type="hidden" id="IDCheckOK"/>
         <input type="hidden" name="jumin">
         <input type="hidden" name="email"/>
         <input type="hidden" name="telephone"/>
         <input type="hidden" name="gender"/>
         <input type="hidden" name="age"/>
   </form>
</div>

<!-- 회원 저장 모달 창 -->
<div id="messageModal" class="modal fade" role="dialog" aria-hidden="true">
   <div class="vertical-alignment-helper">
      <div class="modal-dialog vertival-center">
         <!-- 모달 창의 종류(색상)를 설정한다. -->
         <!-- messageCheck라는 id를 추가하고 class를 제거한다. -->
         <div id="messageCheck" class="modal-content panel-warning">
            <!-- 헤더 -->
            <div class="modal-header panel-heading">
               <!-- 헤더 오른쪽 상단에 "X" 버튼 표시 -->
               <button class="close btn btn-lg" type="button" data-dismiss="modal">
                  <span aria-hidden="true">&times;</span>
                  <span class="sr-only">Close</span>
               </button>
               <!-- messageType이라는 id를 추가한다. -->
               <h4 id="messageType" class="modal-title">
                  에러 메시지
               </h4>
            </div>
            <!-- 바디 -->
            <!-- messageContent이라는 id를 추가한다. -->
            <div id="messageContent" class="modal-boby">
               <%-- ${messageContent} --%>
            </div>
            <!-- 풋터 -->
            <div class="modal-footer">
               <button class="btn btn-primary" type="button" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>
</div>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>


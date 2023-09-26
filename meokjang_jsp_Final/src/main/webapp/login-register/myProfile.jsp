<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl c -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      <!-- jstl fmt -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   <!-- jstl fn -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>

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
<link rel="stylesheet" href="../css/member.css"/>
<script type="text/javascript" src="../js/myProfile.js"></script>

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
            <div class="row">
               <div class="list-inline-item">
                  <div class="row">
                     <span class="text-center mr-3" style="font-size: 10pt;"><a id="myProfile" href="myProfileChK.jsp"> ${mo.ID}</a></span>
                     <a id="logout-nav" href="logoutOK.jsp"><i>로그아웃</i></a>
                  </div>
               </div>
            </div>
         <!-- 로그인 로그아웃 끝 -->            
         </div>
      </div>
   </nav>
</header>

<!-- 메인 시작 -->
<div class="container" style="margin-top: 20px;">
   <form action="myProfileOK.jsp" method="post" onsubmit="return formCheck()">
      <table class="table table-bordered" style="width: 500px; margin-left: auto; margin-right: auto;">
         <thead>
            <tr class="success">
               <th colspan="3" style="text-align: center; font-size: 25px;">내 정보 관리</th>
            </tr>
         </thead>
         <tbody>
            <!-- 아이디 -->
            <tr>
               <td colspan="2">
                  <input id="ID" class="form-control" type="text" style="background-color: #636363; color: white;" name="ID" value="${mo.getID()}"
                     placeholder="아이디" autocomplete="off" onkeyup="idCheck()" readonly="readonly"/>
                  <!-- 아이디 오류 문구 출력 -->
                  <h5 id="idChkMessage1" style="color: red; font-weight: bold"></h5>
                  <h5 id="idChkMessage2" style="color: lime; font-weight: bold"></h5>
               </td>
            </tr>
            <!-- 닉네임 -->
            <tr>
               <td colspan="2">
                  <input id="nickname" class="form-control" type="text" name="nickName" value="${mo.getNickName()}"
                     placeholder="닉네임" autocomplete="off"/>
               </td>
            <!-- 이름 -->
            <tr>
               <td colspan="2">
                  <input id="name" class="form-control" type="text" style="background-color: #636363; color: white;" name="name" value="${mo.getName()}"
                     readonly="readonly"/>
               </td>
            </tr>
            <!-- 주민번호 -->
            <tr>
               <td colspan="3" style="display: flex;">
                  <c:set var="jumin1" value="${mo.getJumin().substring(0, 6)}"/>
                  <input style="width: 235px; background-color: #636363; color: white;" type="text" class="form-control" name="jumin1" value="${jumin1}" readonly="readonly"/>
                  <b style="margin-top: 10px;"> - </b>
                  <c:set var="jumin2" value="${mo.getJumin().substring(6, 13)}"/>
                  <input  style="width: 235px; background-color: #636363; color: white;;"  type="password" class="form-control" name="jumin2" value="${jumin2}" readonly="readonly"/> 
               </td>
            </tr>
            <!-- 이메일 -->
            <tr>
               <td colspan="2" style="display: flex;">
                  <c:set var="email1" value="${mo.getEmail().split('@')}"/>
                  <input  type="text" name="email1" class="form-control" style="width: 130px;" value="${email1[0]}"/>
                  <b style="margin-top: 10px; margin-left: 15px; ">@</b>
                  <input  type="text" name="email2" value="${email1[1]}" class="form-control"
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
                     <select class="form-control" style="width: 100px; margin-bottom: 14px; border-right-color: #b7b7b7;">
                        <option>010</option>
                        <option>011</option>
                        <option>016</option>
                        <option>017</option>
                        <option>018</option>
                        <option>019</option>
                     </select>
                     <c:set var="telephone" value="${mo.getTelephone().substring(3, 11)}"/>
                     <input id="telephone" class="form-control" type="text" 
                           placeholder="휴대폰 번호('-'없이 입력하세요)" 
                           maxlength="8" value="${telephone}"/>
                  </div>
               </td>
            </tr>
            <!-- 주소 -->
            <tr>
               <td>
                  <input type="text" class="form-control"  id="sample6_postcode" name="postcode" value="${mo.getPostcode()}">
                  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                  <input type="text" class="form-control" id="sample6_address" name="address" value="${mo.getAddress()}"><br>
                  <input type="text" class="form-control" id="sample6_detailAddress" name="detailAddress" value="${mo.getDetailAddress()}">
                  <input type="text" class="form-control" id="sample6_extraAddress" name="extraAddress" value="${mo.getExtraAddress()}">
               </td>
            </tr>
         </tbody>
      </table>
      <table style="margin-left: auto; margin-right: auto;">   
         <tr>
            <td>
               <input class="btn btn-success" type="submit" value="내 정보 수정하기"
               style="width: 400px; margin-left: auto; margin-right: auto;" />
            </td>
         </tr>
      </table>
      <table style="margin-left: auto; margin-right: auto;">   
         <tr>
            <td>
               <a class="btn btn-success" style="width: 400px; margin-left: auto; margin-right: auto;" href="passwordChange.jsp">비밀번호 변경</a>
            </td>
         </tr>
      </table>
     <!-- 
      <table style="margin-left: auto; margin-right: auto;">   
         <tr>
            <td>
               <a class="btn btn-success" style="width: 400px; margin-left: auto; margin-right: auto;" href="memberDrop.jsp">회원 탈퇴</a>
            </td>
         </tr>
      </table>
       -->
      <!-- hidden 속성 -->
         <input type="hidden" name="password"/>
         <input type="hidden" id="IDCheckOK"/>
         <input type="hidden" name="jumin">
         <input type="hidden" name="email"/>
         <input type="hidden" name="telephone"/>
         <input type="hidden" name="gender"/>
         <input type="hidden" name="age"/>
   </form>
</div>

</body>
</html>
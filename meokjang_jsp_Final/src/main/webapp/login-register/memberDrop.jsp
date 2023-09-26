<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹장 - 비밀번호 찾기</title>

<!-- common -->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
<link rel="icon" href="../images/favicon.png">
<script type="text/javascript" src="../common/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="../common/bootstrap/css/bootstrap.min.css">
<script src="../common/bootstrap/js/bootstrap.min.js"></script>
<script src="../common/bootstrap/js/popper.min.js"></script>
<script type="text/javascript" src="../common/custom.js" defer="defer"></script>
<link rel="stylesheet" href="../common/style.css"/>

<!-- private -->
<script type="text/javascript" src="../js/memberDrop.js"></script>

<style type="text/css">* {font-family: 'S-CoreDream-3Light'!important;}</style>
</head>
<body>
${mo}
<section class="section-padding">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-6 col-md-8 col-sm-12 col-xs-12">
				<form id="myProfile" class="comment-form mb-3 gray-bg p-5" action="memberDropOK.jsp" method="post" onsubmit="return passwordCheck()">
					<h1 class="mb-4" style="vertical-align: middle; text-align: center; font-size: 25px;">회원 탈퇴</h1>
					<div class="row">
						<div class="col-lg-12">
							<input type="password" placeholder="현재 비밀번호" name="passwordChk" class="form-control mb-3"/><br/>
							<input type="hidden" name="originPassword" value="${mo.password}"><br/>
							<input type="hidden" name="ID" value="${mo.ID}">
							<input type="hidden" name="name" value="${mo.name}">
						</div>
					</div>
					<input type="hidden" name="jumin">
					<div class="d-grid">
						<input class="btn btn-primary btn-block mb-3" type="submit" value="회원 탈퇴"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</section>
</body>
</html>
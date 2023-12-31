<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<link rel="icon" href="./images/bb.jpg">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="./js/jquery-3.7.0.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<script type="text/javascript" src="./js/ajax.js"></script> 
</head>
<body>

<div class="container" style="margin-top: 20px;">
		<form action="./UserRegister" method="post">
			<table class="table table-hover table-bordered" style="border: 1px solid black;">
				<thead>
				<tr class="success">
					<th colspan="3" style="text-align: center; font-size: 25px;">회원가입 양식</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<th class="danger" style="vertical-align: middle; width: 120px;">아이디</th>
						<td>
							<input id="userID" class="form-control" type="text" name="userID"
								placeholder="아이디를 입력하세요" autocomplete="off"/>
						</td>
						<td class="info" style="vertical-align: middle; width: 120px; text-align: center;">
								<button class="btn btn-primary" type="button" onclick="">
									중복검사
								</button>					
						</td>
					</tr>
					<tr>
						<th class="danger" style="vertical-align: middle; width: 120px;">비밀번호</th>
						<td colspan="2">
							<input id="userPassword1" class="form-control" type="password" name="userPassword1"
								placeholder="비밀번호를 입력하세요" autocomplete="off" 
								onkeyup="passwordCheckFunction()"/>
						</td>
					</tr>
					<tr>
						<th class="danger" style="vertical-align: middle; width: 120px;">비밀번호 확인</th>
						<td colspan="2">
							<input id="userPassword2" class="form-control" type="password" name="userPassword2"
								placeholder="비밀번호를 입력하세요" autocomplete="off" 
								onkeyup="passwordCheckFunction()"/>
						</td>
					</tr>
					<tr>
						<th class="danger" style="vertical-align: middle; width: 120px;">이름</th>
						<td colspan="2">
							<input id="userName" class="form-control" type="text" name="userName"
								placeholder="이름을 입력하세요" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th class="danger"  
							style=" vertical-align: middle; width: 120px;"
							align="center">나이</th>
						<td colspan="2">
							<input id="userAge" class="form-control" type="text" name="userAge"
								placeholder="나이를 입력하세요" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th style="background-color: #e3fcf2; vertical-align: middle;">성별</th>
						<td colspan="2">
							<div class="btn-group " data-toggle="buttons">
								<label class="btn btn-success"> <input type="radio"
									name="userGender" value="남자" checked="checked"/>남자
									
								</label> <label class="btn btn-success active"> <input
									type="radio" name="userGender" value="여자" />여자
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<th style="background-color: #e3fcf2; vertical-align: middle;">이메일</th>
						<td colspan="2"><input id="userEmail" class="form-control" type="email" name="userEmail"
							autocomplete="off" placeholder="이메일을 입력하세요" /></td>
					</tr>
					<tr>
						<td colspan="3" style="text-align: center;">
						<h5 id="passwordCheckMessage" style="color: red; font-weight: bold"></h5>
						<!-- 아이디 중복 검사 결과 메시지가 출력될 영역 -->
						<h5 id="idCheckMessage" style="color: red; font-weight: bold"></h5>
						 <!-- 오류 메시지가 출력될 영역 -->
						<h5 id="errorMessage" style="color: lime; font-weight: bold">
							 ${messageType}: ${messageContent}
							 </h5>
							<input class="btn btn-primary" type="submit" value="회원가입"/>
							<input class="btn btn-primary" type="reset" value="다시쓰기"/>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
</div>

<%
//	session에 저장된 메시지를 얻어온다.
	String messageType = null;
	if (session.getAttribute("messageType") != null) {
		messageType = (String) session.getAttribute("messageType");
	//	out.println("messageType: " + messageType + "<br/>");
	}
	String messageContent = null;
	if (session.getAttribute("messageContent") != null) {
		messageContent = (String) session.getAttribute("messageContent");
	//	out.println("messageContent: " + messageContent + "<br/>");
	}
	
//	session에 메시지가 있으면 메시지를 표시하는 모달 창을 띄운다.
	if (messageContent != null) {
		
%>		
<div id="messageModal" class="modal fade" role="dialog" aria-hidden="true">
	<div class="vertical-alignment-helper">
		<div class="modal-dialog vertival-center">
			<!-- 모달 창의 종류를 설정한다. -->
			<div class="modal-content
			
			
<%
	if (messageType.equals("오류 메시지")) {
		out.println("panel-warning");
	}else {
		out.println("panel-success");
	}
%>			
			
			">
				<!-- 헤더 -->
				<div class="modal-header panel-heading">
					<!-- 헤더 오른쪽 상단에 "X" 버튼 표시 -->
					<button class="close" type="button" data-dismiss="modal">
						<span aria-hidden="true">&times;</span>
						<span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">
						${messageType}
					</h4>
				</div>
				<!-- 바디 -->
				<div class="modal-boby">
					${messageContent}
				</div>
				<!-- 풋터 -->
				<div class="modal-footer">
					<button class="btn btn-primary" type="button" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
	
<script type="text/javascript">
	$('#messageModal').modal('show');
</script>
	
<%		
	}
%>


</body>
</html>
























//  비밀번호가 일치하는가 확인하는 함수
function passwordCheckFunction() {
	let userPassword1 = $('#userPassword1').val();
	let userPassword2 = $('#userPassword2').val();
	
   
   if (userPassword1.trim() != userPassword2.trim()) {
	   $('#passwordCheckMessage').html('비밀번호가 일치하지 않습니다.');
       return false;
    }
    $('#passwordCheckMessage').html('');
    return true;
}

// ================================================================================
// 2에서 추가 - jQuery ajax
// ================================================================================

// 회원 가입을 실행하는 함수
function userRegister() {
// ajax를 이용해서 index.jsp에서 테이블에 저장할 데이터를 얻어온다.
   let userID = $('#userID').val();
   let userPassword1 = $('#userPassword1').val();
   let userPassword2 = $('#userPassword2').val();
   let userName = $('#userName').val();
   let userAge = $('#userAge').val();
   let userGender = $('input[name=userGender]:checked').val();
   let userEmail = $('#userEmail').val();
//   console.log(userID, userPassword1, userPassword2, userName, userAge, userGender, userEmail);

//	jQuery ajax
	$.ajax({
		type: 'POST',// 요청 방식
		url: './UserRegister', // 요청할 서블릿
		data: { // 서블릿으로 전송할 데이터
			// 변수명: 값
			userID: userID,
			userPassword1: userPassword1,
			userPassword2: userPassword2,
			userName: userName,
			userAge: userAge,
			userGender: userGender,
			userEmail: userEmail
		},
		// ajax 요청이 성공하면 response.getWriter().write(문자열)의 문자열이 콜백 함수의 인수로 넘어온다
		success: res =>{
			// console.log('요청 성공: ', res);
			
			// 다음 데이터를 입력받기 위해 텍스트 상자의 내용을 지운다.
			$('#userID').val('');
			$('#userPassword1').val('');
			$('#userPassword2').val('');
			$('#userName').val('');
			$('#userAge').val('');
			$('#userEmail').val('');
			
			// 서블릿 응답에 따른 메시지를 출력한다.
			switch (res) {
				case '1':
					$('#messageType').html('에러 메시지');
					$('#messageContent').html('입력되지 않은 정보가 있습니다.');
					$('#errorMessage').html('입력되지 않은 정보가 있습니다.');
					$('#messageCheck').attr('class', 'modal-content panel-warning')
					break;
				case '2':
					$('#messageType').html('에러 메시지');
					$('#messageContent').html('비밀번호가 일치하지 않습니다.');
					$('#errorMessage').html('비밀번호가 일치하지 않습니다.');
					$('#messageCheck').attr('class', 'modal-content panel-warning')
					break;
				case '3':
					$('#messageType').html('축하드립니다!');
					$('#messageContent').html('회원가입에 성공했습니다.');
					$('#messageCheck').attr('class', 'modal-content panel-success')
					break;
				case '4':
					$('#messageType').html('에러 메시지');
					$('#messageContent').html('이미 존재하는 아이디 입니다.');
					$('#messageCheck').attr('class', 'modal-content panel-warning')
					break;
			}
			// 회원 저장 모달 창을 띄운다.
			$('#messageModal').modal('show');
		},
		// ajax 요청이 실패하면 에러 정보가 콜백 함수의 인수로 넘어온다.
		// ajax 요청이 실패하면 실행할 콜백 함수
		error: e => console.log('요청 실패: ', e.status)
	});
	
}

// 아이디 중복 검사를 실행하는 함수
function registerCheckFuntion() {
// ajax를 이용해서 중복 검사할 아이디를 얻어온다.
	let userID = $('#userID').val();
	
//	jQuery ajax
	$.ajax({
		type: 'POST',
		url: './UserRegisterCheck',
		data: {
			userID: userID
		},
		success: res => {
			switch (res) {
				
				case '1':
					$('#messageType').html('에러 메시지');
					$('#messageContent').html('아이디를 입력 하세요');
					$('#messageCheck').attr('class', 'modal-content panel-warning')
					$('#userID').val('');
					$('#userID').focus();
					break;
				case '2':
					$('#messageType').html('에러 메시지');
					$('#messageContent').html('중복된 아이디 입니다.');
					$('#messageCheck').attr('class', 'modal-content panel-warning')
					$('#userID').val('');
					$('#userID').focus();
					break;
				case '3':
					$('#messageType').html('성공 메시지');
					$('#messageContent').html('사용 가능한 아이디 입니다.');
					$('#messageCheck').attr('class', 'modal-content panel-success')
					break;
				
			}
			// 회원 저장 모달 창을 띄운다.
			$('#messageModal').modal('show');
		},
		error: e => console.log('요청 실패: ', e.status)
	});
}


















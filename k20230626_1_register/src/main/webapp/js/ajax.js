//  비밀번호가 일치하는가 확인하는 함수
function passwordCheckFunction() {
	let userPassword1 = $('#userPassword1').val();
	let userPassword2 = $('#userPassword2').val();
	
   
   if (userPassword1.trim() != userPassword2.trim()) {
	   $('#passwordCheckMessage').html('패스워드가 일치하지 않습니다.');
       return false;
    }
    $('#passwordCheckMessage').html('');
    return true;
}






















//	콜백 지옥

//	id와 password를 입력 받아서 로그인 처리와 로그인 후 역할을 받아오는 클래스
class UserStorage {
	
//	로그인 함수
//	loginUser(아이디, 비밀번호, 로그인 성공시 실행할 callback 함수, 로그인 실패시 실행할 callback 함수)
	loginUser(id, password, onSuccess, onError) {
		setTimeout(() => {
			if(id == '홍길동' && password == '1111' || id == '임꺽정' && password == '2222') {
				// 로그인 성공시 실행할 callback 함수를 실행한다.
				// 로그인에 성공했으므로 역할을 받아오는 함수를 실행한다.
				onSuccess(id);
			}else {
				// 로그인 실패시 실행할 callback 함수를 실행한다.
				onError(new Error('로그인 실패'));
			}
		}, 2000);
	}

//	로그인 후 역할을 받아오는 함수
//	getRoles(아이디, 역할을 받아오면 실행항 callback 함수, 역할을 받아오지 못하면 실행항 callback 함수)
	getRoles(user, onSuccess, onError) {
		setTimeout(function () {
			if (user == '홍길동'){
				onSuccess({
					name: '홍길동',
					role: '관리자'
				});
			}else {
				onError('권한이 없습니다.');
			}
		}, 1000);
	}
	
}

//	아이디와 비밀번호를 입력받는다.
const id = prompt('아이디를 입력하세요');
const password = prompt('비밀번호를 입력하세요');

//	로그인 처리를 하기 위해 loginUser() 함수가 작성된 클래스 객체를 생성한다.
const userStorage = new UserStorage();

//	UserStorage 클래스의 loginUser() 함수를 호출해서 로그인 처리를 한다.
userStorage.loginUser(id, password, function (user) {
	console.log(user + '로그인 성공');
//	로그인에 성공했으므로 아이디에 따른 역할을 요청해서 받아온다.
	userStorage.getRoles(user, function (userWithRole) {
		// 요청이 성공적으로 받아졌으면
		alert(`안녕하세요 ${userWithRole.name}님 당신의 권한은 ${userWithRole.role} 입니다.`)
	}, function (error) {
		console.log(error);
	});
	
}, function (error) {
	console.log(error);
	
});






























































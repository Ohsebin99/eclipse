//	id와 password를 입력 받아서 로그인 처리와 로그인 후 역할을 받아오는 클래스
class UserStorage {
	/*
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
	*/
	
//	callback 지옥에 빠진 이유는 함수가 성공시 실행할 함수와 실패시 실행할 함수를 인수로 받았기 때문이다.
//	promise를 사용하면 성공시 resolve()로 실패시 reject()로 처리하면 된다.
	loginUser(id, password) {
		//	함수가 호출되면 promise를 만들어서 리턴시킨다.
		return new Promise((resolve, reject) => {
			setTimeout(() => {
			//	기존에 있던 코드를 promise의 executor 함수에서 실행한다.
			if(id == '홍길동' && password == '1111' || id == '임꺽정' && password == '2222') {
				resolve(id);
			}else {
				reject('로그인 실패');
			}
			}, 2000);
		});
	}
	//	로그인 후 역할을 받아오는 함수
//	getRoles(아이디, 역할을 받아오면 실행항 callback 함수, 역할을 받아오지 못하면 실행항 callback 함수)
/*
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
	*/
	
	getRoles(user) {
		return new Promise((resolve, reject) => {
			//	기존에 있던 코드를 promise의 executor 함수에서 실행한다.
			setTimeout(() => {
				if (user == '홍길동'){
				resolve({
					name: '홍길동',
					role: '관리자'
				});
			}else {
				reject('권한이 없습니다.');
			}
			}, 1000);
		});
	}
}

//	아이디와 비밀번호를 입력받는다.
const id = prompt('아이디를 입력하세요');
const password = prompt('비밀번호를 입력하세요');

//	로그인 처리를 하기 위해 loginUser() 함수가 작성된 클래스 객체를 생성한다.
const userStorage = new UserStorage();

/*
userStorage.loginUser(id, password) 
	.then(function (id) {
		// console.log(id);
		return userStorage.getRoles(id);
	})
	.then(function (userWithRole) {
		alert(`안녕하세요 ${userWithRole.name}님 당신의 권한은 ${userWithRole.role} 입니다.`)
	})
	.catch(function (error) {
		console.log(error);
	})
*/

userStorage.loginUser(id, password) 
	.then(id => userStorage.getRoles(id))
	.then(userWithRole =>alert(`안녕하세요 ${userWithRole.name}님 당신의 권한은 ${userWithRole.role} 입니다.`))
	//.catch(error =>  console.log(error))
	.catch(console.log);



































	
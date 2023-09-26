//	jsonplacehoder
//	https://jsonplaceholder.typicode.com/ 사이트 아래쪽으로 이동해서 /posts 클릭
//	https://jsonplaceholder.typicode.com/posts

//	javascript fetch api 검색
//	https://developer.mozilla.org/ko/docs/Web/API/Fetch_API/Using_Fetch	

//	fetch()의 결과(리턴)는 promise 이다.

/*
console.log(1);
//	fetch(요청)
fetch('https://jsonplaceholder.typicode.com/posts')
	.then(function (response) {// then()을 사용한다는 것은 fetch() 실행후 리턴이 promise라는 의미이다.
		//console.log(response);
		console.log(response.json()); // json 타입의 데이터를 javascript 객체로 변환한다.
	})
console.log(2);
*/

/*
console.log(1);
//	fetch(요청)
fetch('https://jsonplaceholder.typicode.com/posts')
	.then(function (response) {
	//	console.log(response.json()); 
	return response.json();
	})
	.then(function (data) {
		console.log(data); 
	});
console.log(2);
*/

console.log(1);
fetch('https://jsonplaceholder.typicode.com/posts')
	.then(response => response.json())
	.then(console.log);
console.log(2);


//	fetch(요청 url) 함수의 리턴값은 promise이며 response(응답) 객체이다.
let fetched = fetch('https://jsonplaceholder.typicode.com/posts');
//	리턴값이 promise이면 비동기적으로 실행되는 함수이다.
console.log('fetched: ' + fetched); // fetched: [object Promise] => 전체 문자열
console.log('fetched: ' , fetched); // fetched:  Promise {<pending>} => 문자열 객체 

//	fetch() 함수가 리턴값에는 then()과 catch() 2개의 함수를 사용할 수 있다.
//	then() 함수는 fetch() 함수가 성공적으로 실행되면 호출되고 catch() 함수는 fetch() 함수가 정상적으로
//	실행되지 않으면 호출된다.
//	fetch() 함수가 실행되면 promise가 리턴되고 then() 함수도 실행되면 promise를 리턴한다.

fetched.then(response => {
	console.log('fetched: ' , response);
});

fetched = fetch('https://jsonplaceholder.typicode.com/posts1'); // 주소틀린
 fetched.catch(error => {
	 console.log('2. error: ' , error); // error: TypeError: Failed to fetch
 });


fetch('https://jsonplaceholder.typicode.com/posts')
	.then(function (response) {
	//	console.log('3. response: ', response.json());
	/*
		response.json().then(function (data) {
			console.log('3. data: ', data);
		})
	})
	*/
	// response.json().then(data => console.log('3. data 1: ', data));
	return response.json(); // promise 를 리턴한다.
	})
	.then(function (data) {
		// then() 함수에서 promise를 리턴시키고 외부에서 then() 함수로 받아서 사용하는 방식을
		// promise chaining이라 하고 일반적으로 nested promise 방식보다 더 많이 사용한다.
		console.log('3. data 2: ', data) 
	})
	.catch(error => {
		console.log('3. error: ', error);
	});

















































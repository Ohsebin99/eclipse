//	객체 선언 => function 사용
function Clazz(name) {
//	멤버 변수 초기화
	this.name = name; // 멤버 변수 초기화
	age = 20;
	this.getAge = function () {
		return this.age;
	}
}

function objectFunction() {
//	function을 사용해서 선언한 클래스 객체는 new를 사용해서 생성한다.
	const obj = new Clazz('홍길동');
	console.log(obj);
	console.log(obj.name);
	console.log(obj.age);
	console.log(obj.getAge());
}

//	객체 선언 => class 사용
class Clazz2 {
	constructor(name){
	this.name = name; // 멤버 변수 초기화
	this.age = 20;
	}
	getAge() {
		return this.age;
}
}

function objectClass() {
//	class을 사용해서 선언한 클래스 객체도 new를 사용해서 생성한다.	
	const obj = new Clazz2('임꺽정');
	console.log(obj);
	console.log(obj.name);
	console.log(obj.age);
	console.log(obj.getAge());
}

//	json 객체 선언 => key 부분을 반드시 큰따옴표로 묶어야 한다.
const Clazz3 = {
	"name": '장길산',
	"age": 45,
	"getAge": function (){
		//	함수 내부에서 json 형식을 사용한 객체의 key를 참조하려면 반드시 객체 이름에 '.'을 찍어서
		//	접근해야 한다.
		return Clazz3.age;
	}
}

function objectJSON() {
//	function이나 class를 사용해서 선언한 객체는 new을 사용해서 객체를 생성하고 사용한다.
//	json 형식으로 선언한 객체는 별도의 선언 과정없이 사용할 수 있다.
	console.log(Clazz3.name);
	console.log(Clazz3.age);
	console.log(Clazz3.getAge());
	
//	json을 가장한 문자열 => key 부분은 반드시 큰따옴표를 사용해서 문자열로 만든다.
	let myJson = '{"name": "일지매", "age": 41}';
	console.log(myJson);
}

//	JSON.parse(): 인수로 지정된 json를 가장한 문자열을 json 객체로 변환한다.
	let jsonObj = JSON.parse(myJson);
	console.log(typeof jsonObj);

//	JSON.stringify(): 인수로 지정된 json 객체를 문자열로 변
	myJson = {
		"name": '손오공',
		"age": 30
	}
	let jsonStr = JSON.stringify(myJson);
	






















function evalTest() {
//	let str = document.getElementsByName('evalValue')[0];
//	let str = document.getElementsByTagName('evalValue')[0];
	let str = document.querySelectorAll('input')[0];
	console.log(str);
	console.log(str.value);
	console.log(typeof str.value);
	console.log(eval(str.value));
	
	if(confirm('연산식을 올바르게 입력했나요?\n입력한 연산식: ' + str.value)) {
		document.getElementsByTagName('span')[0].innerHTML = '<h2>계산 결과: ' + eval(str.value) + '</h2>'
		
	} else {
		str.value = '';
		str.focus();
	}
}

function calTest() {
	let docs = document.querySelectorAll('.cal');
	
	let str = '';
	for (let doc of docs) {
		str += doc.value;
	}
	console.log(str);
	console.log(typeof str);
	console.log(eval(str));
	
	document.quertSelectorAll('span')[1].innerHTML ='<h2'
}

















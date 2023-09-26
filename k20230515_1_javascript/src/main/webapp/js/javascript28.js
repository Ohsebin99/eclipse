function randomNumber(number) {
	for(let i=0; i<6; i++) {
//	console.log(Math.random());
	console.log(parseInt(Math.random() * number) + 1);
	}
	
//	ceil(): 올림, floor(): 내림, round(): 반올림
	console.log('올림: ' + Math.ceil(3.14))
	console.log('올림: ' + Math.ceil(3.94))
	console.log('내림: ' + Math.floor(3.14))
	console.log('내림: ' + Math.floor(3.94))
	console.log('내림: ' + Math.round(3.44))
	console.log('내림: ' + Math.round(3.54))
}


function randomColor() {
	let r = parseInt(Math.random() * 256);
	let g = parseInt(Math.random() * 256);
	let b = parseInt(Math.random() * 256);
	document.body.style.backgroundColor = `rgb(${r}, ${g}, ${b}`;
	}
	
function randomCircle(){
	let radius =  Math.floor(Math.random() * 100) + 1;
	
	let circle = document.getElementById('circle');
	
	circle.style.width = radius * 2 + 'px';
	circle.style.height = radius * 2 + 'px';
	
	let random = () => Math.floor(Math.random() * 256);
	circle.style.border = '4px solid ' + `rgb(${random()}, ${random()}, ${random()}`;
	circle.style.backgroundColor = `rgb(${random()}, ${random()}, ${random()}`;
	circle.style.borderRadius = '50%';
}


function randomCircleArea() {
	
	let circleWidth =  document.getElementById('circle').style.width;
	
	wdith = parseInt(circleWidth);
	
	let radius = wdith/2;
	
	
	let area = Math.PI * Math.pow(radius, 2);
	let len = 2 * Math.PI * radius;
	
	document.getElementById('area').innerHTML = Math.round(area);
	document.getElementById('len').innerHTML =  Math.round(len);
}















































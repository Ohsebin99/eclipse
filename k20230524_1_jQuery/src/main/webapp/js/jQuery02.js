//   javascript 작성법
//   document.getElementById('list').style.color = 'blue';

//   jQuery 작성법
//   $('css 선택자).함수();
//   $('#list').css('color', 'hotpink');

//   javascript onload
//   onload = function () {
//      alert('javascript onload 이벤트1');
//   }
//   ======================================================
//   onload = () => {
//      alert('javascript onload 이벤트2');
//   }
//   ======================================================
//   onload = () => alert('javascript onload 이벤트3');
//   ======================================================

//   jQuery onload
//   $(document).ready(function () {
//      alert('jQuery onload 이벤트1');
//   });
//   ======================================================
//   $().ready(function () { // document 생략 가능
//      alert('jQuery onload 이벤트2');
//   });
//   ======================================================
//   $().ready(() => { // 화살표 함수
//      alert('jQuery onload 이벤트3');
//   });
//   ======================================================
//   $().ready(() => alert('jQuery onload 이벤트4'));
//   ======================================================
//   $(function () { // ().ready 생략 가능
//      alert('jQuery onload 이벤트5');
//   });
//   ======================================================
//   $(() => { // ().ready 생략, 화살표 함수
//      alert('jQuery onload 이벤트6');
//   });
//   ======================================================
//   $(() => alert('jQuery onload 이벤트7')); // ().ready 생략, 화살표 함수, {} 생략
//   ======================================================

function imgSize() {
//	javascript
//	wudth만 지정하거나 height만 지정하면 지정하지 않은 부분은 비율을 계산해서 같이 변경된다.
//	document.getElementsByTagName('img')[0].style.width = '100px';
//	document.getElementsByTagName('img')[0].style.height = '200px';
	
//	jQuery
	$('img').css('width', '100px');
	$('img').css('height', '200px');
	
//	아래와 같이 1줄에 여러개의 스타일 속성을 지정할 수 있다.
	$('img').css({'whdth': '100px', 'height': '200px'});
	$('img').css({'whdth': '100px', 'height': '200px'}).css('opacity', '0.5');
}

//	필터링 함수
//   .first(): 선택된 요소 중 첫 번째 요소를 선택한다.
//   .last(): 선택된 요소 중 마지막 요소를 선택한다.
//   .eq(index): 선택된 요소 중 index 번째 요소를 선택한다.
//   .slice(): 선택한 요소 중 전달받은 인덱스 범위에 해당하는 요소만 선택한다.
//   .filter(): 선택된 요소 중 전달받은 선택자에 해당된거나, 함수 호출 결과가 참인 모든 요소를 선택한다.
//   .not(): 선택된 요소 중 전달받은 선택자에 해당된거나, 함수 호출 결과가 거짓인 모든 요소를 선택한다.
//   .has(): 선택된 요소 중 전달받은 선택자에 해당되는 요소의 모든 자손 요소를 선택한다.
//   .is(): 선택된 요소 중 전달받은 선택자에 해당되는 요소가 하나라도 존재하면 true를 리턴한다.
//   .map(): 선택한 요소 집합의 각 요소마다 콜백 함수를 실행하고 리턴값으로 구성된 객체를 리턴한다.


function highLight() {
//	document.getElementById('list').style.backgroundColor = 'tomato';
//	$('#list').css('background-color', 'skyblue'); 
//	document.getElementsByTagName('li')[1].style.backgroundColor = 'blue';
//	jQuery
	$('#list > li').first().css('backgroundColor', 'skyblue');
	$('#list > li').last().css('backgroundColor', 'cyan');
	$('#list > li').eq(1).css('backgroundColor', 'red');
	$('#list > li').slice(2, 5).css('backgroundColor', 'blue');
}

//   요소(Element)의 추가 함수
//   선택된 요소의 내부에 추가
//      .append(): 선택된 요소의 마지막에 추가한다.
//      .prepend(): 선택된 요소의 첫 번째에 추가한다.
//   선택된 요소의 외부에 추가
//      .before(): 선택된 요소의 앞에 추가한다.
//      .after(): 선택된 요소의 뒤에 추가한다.

function addImg() {
	$('div').append('<img alt="샤미드" src="./images/img03.jpg"/>');
	$('div').prepend('<img alt="이브이A" src="./images/img01.jpg"/>');
	$('div').after('<img alt="이브이A" src="./images/img05.jpg"/>');
	$('div').before('<img alt="이브이A" src="./images/img04.jpg"/>');
}
	
//	요소의 표시와 숨김
//   .hide(): 선택한 요소의 css를 자동으로 조정해서 사라지게 한다.
//   .show(): 선택한 요소의 css를 자동으로 조정해서 표시되게 한다.
//   .toggle(): 선택한 요소의 css를 자동으로 조절해서 hide(), show() 메소드가 번갈아 적용된다.
//   hide(), show() 메소드의 인수로 시간(밀리초)을 설정하거나 "slow", "fast"와 같은 예약어를 전달해 
//   속도를 설정할 수 있다.
   
//   페이드 효과
//   .fadeIn(): 선택한 요소의 css 중 opacity 속성의 값을 높여가며 나타나게 한다.
//   .fadeOut(): 선택한 요소의 css 중 opacity 속성의 값을 줄여가며 사리지게 한다.
//   .fadeToggle(): fadeIn(), fadeOut() 메소드가 번갈아 적용된다.
//   fadeIn(), fadeOut() 메소드의 인수로 시간(밀리초)을 설정하거나 "slow", "fast"와 같은 예약어를 전달해
//   속도를 설정할 수 있다.

//   슬라이드 효과
//   slideUp(): 선택한 요소의 css 중 height 속성의 값을 낮춰가며 사라지게 한다.
//   slideDown(): 선택한 요소의 css 중 height 속성의 값을 높여가며 나타나게 한다.
//   slideToggle(): slideUp(), slideDown() 메소드가 번갈아 적용된다.
//   slideUp(), slideDown() 메소드의 인수로 시간(밀리초)을 설정하거나 "slow", "fast"와 같은 예약어를 
//   전달해 속도를 설정할 수 있다.
	
function hideImg() {
//	개별
//	javascript
//	document.getElementsByTagName('img')[0].style.display = 'none';
//	jQuery
//	$('img').first().css('display', 'none');

//	전체
//	let imgs = document.getElementsByTagName('img');
//	for (let img of imgs) {
//		img.style.display = 'none';
//	}
//	$('img').css('display', 'none');

//	$('img').hide();
//	$('img').fadeOut();
	$('div').slideUp();

}

function showImg() {
//	개별
//	javascript
	document.getElementsByTagName('img')[0].style.display = 'block';
//	jQuery
//	$('img').first().css('display', 'none');

//	$('img').show();
	$('div').slideDown();
}

function toggleImg() {
	$('img').toggle();
}

















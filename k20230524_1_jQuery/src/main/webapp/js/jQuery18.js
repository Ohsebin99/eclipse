$(() => {
	
//	id 속성이 base인 div 태그를 선택해서 뒤에 새로운 요소를 추가한다.
	$('button').eq(0).click(function () {
		//	after(): 선택된 요소 외부 뒤에 새로운 요소를 추가한다.
//		$('#base').after('<div>after() 함수로 추가한 요소</div>');
		$('#base').after($('<div>').text('after() 함수로 추가한 요소'));
	});
	
//	id 속성이 base인 div 태그를 선택해서 뒤에 새로운 요소를 추가한다.
	$('button:eq(1)').click(function () {
		//	insertAfter(): 새로운 요소를 인수로 지정한 요소 외부 뒤에 추가한다.
		//	$('div>insertAfter() 함수로 추가한 요소1</div>').insertAfter('#base');
	$('<div>').text('after() 함수로 추가한 요소').insertAfter('#base');
	
	});
	
//	id 속성이 base인 div 태그를 선택해서 뒤에 새로운 요소를 추가한다.
	$('button:eq(2)').click(function () {
		//before(): 선택된 요소 외부 앞에 인수로 지정한 새로운 요소를 추가한다.
		//	$('선택자').before(추가할 요소);
		$('#base').before('<div>before() 함수로 추가한 요소1</div>');		
	});
});



























$(() => {
	
//	$('div > p > b').css({'fontSize': '30px', 'color': 'purple'});
	$('div').next('p').css({'fontSize': '30px', 'color': 'yellowgreen'});
	
//	$('#chd').text('야무치');
//	children() 함수의 인수를 생략하면 모든 자식 요소가 선택된다.
//	$('div').children('#chd').html('<i>베지터</i>');

	$('span').css('fontSize', '20px').css('backgroundColor', 'skyblue')
	$('span').parent().css('backgroundColor', 'tomato');
//	parents() 함수의 인수를 생략하면 모든 조상 요소가 선택된다.
	$('span').parents('div').css('backgroundColor', 'red');
	
	$('p:eq(2)').next().css('backgroundColor', 'lime');
	$('p:eq(2)').prev().css('backgroundColor', 'yellow');
	
});





















































$(() => {
	
//	$('p:eq(0)').css('color', 'red');	
//	$('span:eq(0)').css('color', 'red');

//	0번째 <p> 태그를 선택한 후 <span> 태그를 선택한다.
//	$('p:eq(0) > span').css('backgroundColor', 'red');
//	$('p').eq(0).add('span:eq(0)').css('backgroundColor', 'red');
	$('div').children().click(function () {
		if ($(this).is('span')) {
			$(this).css('color', 'red');
		}
		if ($(this).is('b')) {
			$(this).css('color', 'blue');
		}
		if ($(this).is('p')) {
			$(this).css('color', 'tomato');
		}
	});
});